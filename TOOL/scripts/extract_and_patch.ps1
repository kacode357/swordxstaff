param()

$ErrorActionPreference = "Stop"

$ROOT_DIR = "D:\swordxstaff\TOOL"
$ORIGINAL_APK = "$ROOT_DIR\original\Sword_x_Staff_Merged.apk"
$CLASSES3_DEX = "$ROOT_DIR\classes3.dex"
$SMALI_CLASSES3 = "$ROOT_DIR\smali_classes3"
$PATCHED_DEX = "$ROOT_DIR\classes3_patched.dex"
$KAUTO_SMALI_DIR = "$ROOT_DIR\client\smali\com\kauto"
$TOOLS_DIR = "$ROOT_DIR\tools"
$BAKSMALI = "$TOOLS_DIR\baksmali.jar"
$SMALI = "$TOOLS_DIR\smali.jar"
$JAVA = "C:\Program Files\Microsoft\jdk-17.0.21.21-hotspot\bin\java.exe"

Write-Host ">>> [1] Extracting classes3.dex from merged APK..." -ForegroundColor Cyan
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead($ORIGINAL_APK)
$entry = $zip.GetEntry("classes3.dex")
if (-not $entry) {
    throw "classes3.dex not found in $ORIGINAL_APK"
}
[System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $CLASSES3_DEX, $true)
$zip.Dispose()
Write-Host "  -> Extracted classes3.dex ($(Get-Item $CLASSES3_DEX | Select-Object -ExpandProperty Length) bytes)" -ForegroundColor Green

Write-Host ">>> [2] Disassembling classes3.dex with baksmali..." -ForegroundColor Cyan
if (Test-Path $SMALI_CLASSES3) {
    Remove-Item -Path $SMALI_CLASSES3 -Recurse -Force
}
& $JAVA -jar $BAKSMALI d -o $SMALI_CLASSES3 $CLASSES3_DEX
if ($LASTEXITCODE -ne 0) {
    throw "baksmali failed with exit code $LASTEXITCODE"
}
Write-Host "  -> Disassembled into $SMALI_CLASSES3" -ForegroundColor Green

Write-Host ">>> [3] Copying KAuto smali files..." -ForegroundColor Cyan
$destKauto = Join-Path $SMALI_CLASSES3 "com\kauto"
if (-not (Test-Path $destKauto)) {
    New-Item -ItemType Directory -Path $destKauto -Force | Out-Null
}
Copy-Item -Path "$KAUTO_SMALI_DIR\*" -Destination $destKauto -Recurse -Force
Write-Host "  -> Copied KAuto smali files to $destKauto" -ForegroundColor Green

Write-Host ">>> [4] Hooking AppActivity.onCreate()..." -ForegroundColor Cyan
$appActivityPath = Join-Path $SMALI_CLASSES3 "com\leiting\unity\AppActivity.smali"
if (-not (Test-Path $appActivityPath)) {
    throw "AppActivity.smali not found at $appActivityPath"
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$content = [System.IO.File]::ReadAllText($appActivityPath, $utf8NoBom)
if ($content.Contains("Lcom/kauto/KAutoMenu;->init")) {
    Write-Host "  -> Already hooked!" -ForegroundColor Yellow
} else {
    $target = "    iput-object p0, p0, Lcom/leiting/unity/AppActivity;->activity:Landroid/app/Activity;"
    if (-not $content.Contains($target)) {
        throw "Could not find hook target in AppActivity.smali"
    }
    $replacement = @"
    iput-object p0, p0, Lcom/leiting/unity/AppActivity;->activity:Landroid/app/Activity;

    # [KAuto] Khoi tao Floating Mod Menu tren Unity Activity
    invoke-static {p0}, Lcom/kauto/KAutoMenu;->init(Landroid/app/Activity;)V
"@
    $content = $content.Replace($target, $replacement)
    [System.IO.File]::WriteAllText($appActivityPath, $content, $utf8NoBom)
    Write-Host "  -> Hooked AppActivity.onCreate successfully!" -ForegroundColor Green
}

Write-Host ">>> [5] Assembling classes3_patched.dex with smali..." -ForegroundColor Cyan
if (Test-Path $PATCHED_DEX) {
    Remove-Item $PATCHED_DEX -Force
}
& $JAVA -jar $SMALI a -o $PATCHED_DEX $SMALI_CLASSES3
if ($LASTEXITCODE -ne 0 -or -not (Test-Path $PATCHED_DEX)) {
    throw "smali assemble failed with exit code $LASTEXITCODE"
}
Write-Host "  -> Reassembled $PATCHED_DEX ($(Get-Item $PATCHED_DEX | Select-Object -ExpandProperty Length) bytes)" -ForegroundColor Green

Write-Host ">>> HOAN THANH PATCH DEX!" -ForegroundColor Green
