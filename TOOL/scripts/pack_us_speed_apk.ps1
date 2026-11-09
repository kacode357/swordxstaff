param()

$ErrorActionPreference = "Stop"

$ROOT_DIR = "D:\swordxstaff\TOOL"
$ORIGINAL_US_APK = "C:\Users\Lenovo\Downloads\ZhangjcsomStatic-155095.apk"
$DIST_DIR = "$ROOT_DIR\dist"
$UNSIGNED_APK = "$DIST_DIR\KAuto_US_unsigned.apk"
$OUTPUT_APK = "$DIST_DIR\KAuto_Sword_x_Staff_US.apk"
$PATCHED_DEX = "$ROOT_DIR\us_classes2_patched.dex"
$NATIVE_DIR = "$ROOT_DIR\client\native\libs"
$TOOLS_DIR = "$ROOT_DIR\tools"
$UBER_SIGNER = "$TOOLS_DIR\uber-apk-signer.jar"
$JAVA = "C:\Program Files\Microsoft\jdk-17.0.21.21-hotspot\bin\java.exe"
$ADB = "C:\Program Files\Netease\MuMuPlayer\nx_main\adb.exe"

Write-Host ">>> [1/4] Chuan bi file APK unsigned..." -ForegroundColor Cyan
Copy-Item $ORIGINAL_US_APK $UNSIGNED_APK -Force

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$zip = [System.IO.Compression.ZipFile]::Open($UNSIGNED_APK, [System.IO.Compression.ZipArchiveMode]::Update)

# 1. Inject classes2.dex
Write-Host "  -> Injecting classes2.dex..." -ForegroundColor Yellow
$oldDex = $zip.GetEntry("classes2.dex")
if ($oldDex) { $oldDex.Delete() }
$null = [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $PATCHED_DEX, "classes2.dex")

# 2. Inject libkauto_speed.so for arm64-v8a and armeabi-v7a (DO NOT inject x86_64 to match original game ABI)
$archs = @("arm64-v8a", "armeabi-v7a")
foreach ($arch in $archs) {
    $soPath = "$NATIVE_DIR\$arch\libkauto_speed.so"
    if (Test-Path $soPath) {
        $entryName = "lib/$arch/libkauto_speed.so"
        Write-Host "  -> Injecting $entryName..." -ForegroundColor Yellow
        $oldSo = $zip.GetEntry($entryName)
        if ($oldSo) { $oldSo.Delete() }
        $null = [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $soPath, $entryName)
    }
}

$zip.Dispose()
Write-Host "  -> Inject dex & native libs thanh cong!" -ForegroundColor Green

# 3. Zipalign va Ky bang uber-apk-signer
Write-Host ">>> [2/4] Zipalign va Ky APK (v1, v2, v3)..." -ForegroundColor Cyan
& $JAVA -jar $UBER_SIGNER -a $UNSIGNED_APK --allowResign -o $DIST_DIR

$signedResult = Join-Path $DIST_DIR "KAuto_US_unsigned-aligned-debugSigned.apk"
if (Test-Path $signedResult) {
    Move-Item -Path $signedResult -Destination $OUTPUT_APK -Force
}

if (-not (Test-Path $OUTPUT_APK)) {
    throw "Loi: Khong tim thay file APK da ky!"
}

if (Test-Path $UNSIGNED_APK) {
    Remove-Item $UNSIGNED_APK -Force -ErrorAction SilentlyContinue
}
Write-Host ">>> [3/4] XUAT FILE APK MOD SPEED THANH CONG: $OUTPUT_APK" -ForegroundColor Green

# 4. Cai vao MuMu Player
Write-Host ">>> [4/4] Cai dat vao MuMu Player qua ADB..." -ForegroundColor Cyan
& $ADB connect 127.0.0.1:16384
& $ADB -s 127.0.0.1:16384 install -r "$OUTPUT_APK"

Write-Host ">>> Khoi chay lai game..." -ForegroundColor Cyan
& $ADB -s 127.0.0.1:16384 shell am force-stop com.zjcs.android.us
& $ADB -s 127.0.0.1:16384 shell am start -n com.zjcs.android.us/com.joybox.overseas.activity.SdkFirstActivity
Write-Host ">>> HOAN TAT!" -ForegroundColor Green
