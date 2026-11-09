param()

$ErrorActionPreference = "Stop"

$ROOT_DIR = "D:\swordxstaff\TOOL"
$ORIGINAL_US_APK = "C:\Users\Lenovo\Downloads\ZhangjcsomStatic-155095.apk"
$TOOLS_DIR = "$ROOT_DIR\tools"
$BAKSMALI = "$TOOLS_DIR\baksmali.jar"
$SMALI = "$TOOLS_DIR\smali.jar"
$UBER_SIGNER = "$TOOLS_DIR\uber-apk-signer.jar"
$JAVA = "C:\Program Files\Microsoft\jdk-17.0.21.21-hotspot\bin\java.exe"
$ADB = "C:\Program Files\Netease\MuMuPlayer\nx_main\adb.exe"

$CLASSES2_DEX = "$ROOT_DIR\us_classes2.dex"
$SMALI_CLASSES2 = "$ROOT_DIR\smali_us_classes2"
$PATCHED_DEX = "$ROOT_DIR\us_classes2_patched.dex"
$KAUTO_SMALI_DIR = "$ROOT_DIR\client\smali\com\kauto"
$DIST_DIR = "$ROOT_DIR\dist"
$UNSIGNED_APK = "$DIST_DIR\KAuto_US_unsigned.apk"
$OUTPUT_APK = "$DIST_DIR\KAuto_Sword_x_Staff_US.apk"

Write-Host ">>> [1/5] Trich xuat classes2.dex tu ZhangjcsomStatic-155095.apk..." -ForegroundColor Cyan
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$zip = [System.IO.Compression.ZipFile]::OpenRead($ORIGINAL_US_APK)
$entry = $zip.GetEntry("classes2.dex")
if (-not $entry) {
    throw "Khong tim thay classes2.dex trong $ORIGINAL_US_APK"
}
[System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $CLASSES2_DEX, $true)
$zip.Dispose()
Write-Host "  -> Trich xuat classes2.dex thanh cong ($(Get-Item $CLASSES2_DEX | Select-Object -ExpandProperty Length) bytes)" -ForegroundColor Green

Write-Host ">>> [2/5] Decompile classes2.dex bang baksmali..." -ForegroundColor Cyan
if (Test-Path $SMALI_CLASSES2) {
    Remove-Item -Path $SMALI_CLASSES2 -Recurse -Force
}
& $JAVA -jar $BAKSMALI d -o $SMALI_CLASSES2 $CLASSES2_DEX
if ($LASTEXITCODE -ne 0) {
    throw "baksmali that bai voi exit code $LASTEXITCODE"
}

Write-Host ">>> [3/5] Inject ma nguon Smali KAuto va Hook AppActivity..." -ForegroundColor Cyan
# Copy com.kauto
$destKauto = Join-Path $SMALI_CLASSES2 "com\kauto"
if (-not (Test-Path $destKauto)) {
    New-Item -ItemType Directory -Path $destKauto -Force | Out-Null
}
Copy-Item -Path "$KAUTO_SMALI_DIR\*" -Destination $destKauto -Recurse -Force

# Hook AppActivity
$appActivityPath = Join-Path $SMALI_CLASSES2 "com\leiting\unity\AppActivity.smali"
if (-not (Test-Path $appActivityPath)) {
    throw "Khong tim thay AppActivity.smali tai $appActivityPath"
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$content = [System.IO.File]::ReadAllText($appActivityPath, $utf8NoBom)
if ($content.Contains("Lcom/kauto/KAutoMenu;->init")) {
    Write-Host "  -> Da duoc hook tu truoc!" -ForegroundColor Yellow
} else {
    $target = "    iput-object p0, p0, Lcom/leiting/unity/AppActivity;->activity:Landroid/app/Activity;"
    if (-not $content.Contains($target)) {
        throw "Khong tim thay vi tri hook trong AppActivity.smali"
    }
    $replacement = @"
    iput-object p0, p0, Lcom/leiting/unity/AppActivity;->activity:Landroid/app/Activity;

    # [KAuto] Khoi tao Floating Mod Menu tren Unity Activity
    invoke-static {p0}, Lcom/kauto/KAutoMenu;->init(Landroid/app/Activity;)V
"@
    $content = $content.Replace($target, $replacement)
    [System.IO.File]::WriteAllText($appActivityPath, $content, $utf8NoBom)
    Write-Host "  -> Hook AppActivity.onCreate thanh cong!" -ForegroundColor Green
}

Write-Host ">>> [4/5] Assemble lai classes2_patched.dex bang smali..." -ForegroundColor Cyan
if (Test-Path $PATCHED_DEX) {
    Remove-Item $PATCHED_DEX -Force
}
& $JAVA -jar $SMALI a -o $PATCHED_DEX $SMALI_CLASSES2
if ($LASTEXITCODE -ne 0 -or -not (Test-Path $PATCHED_DEX)) {
    throw "smali assemble that bai voi exit code $LASTEXITCODE"
}
Write-Host "  -> Reassembled $PATCHED_DEX ($(Get-Item $PATCHED_DEX | Select-Object -ExpandProperty Length) bytes)" -ForegroundColor Green

Write-Host ">>> [5/5] Dong goi, Zipalign va Ky APK bang uber-apk-signer..." -ForegroundColor Cyan
Copy-Item $ORIGINAL_US_APK $UNSIGNED_APK -Force

$zipUpdate = [System.IO.Compression.ZipFile]::Open($UNSIGNED_APK, [System.IO.Compression.ZipArchiveMode]::Update)
$oldEntry = $zipUpdate.GetEntry("classes2.dex")
if ($oldEntry) {
    $oldEntry.Delete()
}
$null = [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zipUpdate, $PATCHED_DEX, "classes2.dex")
$zipUpdate.Dispose()

& $JAVA -jar $UBER_SIGNER -a $UNSIGNED_APK --allowResign -o $DIST_DIR

$signedResult = Join-Path $DIST_DIR "KAuto_US_unsigned-aligned-debugSigned.apk"
if (Test-Path $signedResult) {
    Move-Item -Path $signedResult -Destination $OUTPUT_APK -Force
}

if (-not (Test-Path $OUTPUT_APK)) {
    throw "Khong tim thay file APK da ky tai $OUTPUT_APK"
}

if (Test-Path $UNSIGNED_APK) {
    Remove-Item $UNSIGNED_APK -Force -ErrorAction SilentlyContinue
}

Write-Host ">>> BUILD THANH CONG APK GLOBAL KAUTO: $OUTPUT_APK" -ForegroundColor Green

Write-Host ">>> [ADB] Cai dat vao MuMu Player..." -ForegroundColor Cyan
& $ADB connect 127.0.0.1:16384
& $ADB -s 127.0.0.1:16384 install -r "$OUTPUT_APK"
if ($LASTEXITCODE -ne 0) {
    & $ADB -s emulator-5554 install -r "$OUTPUT_APK"
}

Write-Host ">>> [ADB] Khoi chay game Global..." -ForegroundColor Cyan
& $ADB -s 127.0.0.1:16384 shell am start -n com.zjcs.android.us/com.leiting.unity.AppActivity
Write-Host ">>> HOAN TAT!" -ForegroundColor Green
