param([switch]$Install)

$ErrorActionPreference = "Stop"

$ROOT_DIR = "D:\swordxstaff\TOOL"
$ORIGINAL_APK = "$ROOT_DIR\original\Sword_x_Staff_Merged.apk"
$PATCHED_DEX = "$ROOT_DIR\classes3_patched.dex"
$DIST_DIR = "$ROOT_DIR\dist"
$OUTPUT_APK = "$DIST_DIR\KAuto_Sword_x_Staff.apk"
$TOOLS_DIR = "$ROOT_DIR\tools"
$UBER_SIGNER = "$TOOLS_DIR\uber-apk-signer.jar"
$JAVA = "C:\Program Files\Microsoft\jdk-17.0.21.21-hotspot\bin\java.exe"
$ADB = "C:\Program Files\Netease\MuMuPlayer\nx_main\adb.exe"

if (-not (Test-Path $DIST_DIR)) {
    New-Item -ItemType Directory -Path $DIST_DIR -Force | Out-Null
}

$unsignedApk = Join-Path $DIST_DIR "KAuto_unsigned.apk"

Write-Host ">>> [1/3] Injecting classes3_patched.dex into APK..." -ForegroundColor Cyan
Copy-Item $ORIGINAL_APK $unsignedApk -Force

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$zip = [System.IO.Compression.ZipFile]::Open($unsignedApk, [System.IO.Compression.ZipArchiveMode]::Update)
$oldEntry = $zip.GetEntry("classes3.dex")
if ($oldEntry) {
    $oldEntry.Delete()
}
$null = [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $PATCHED_DEX, "classes3.dex")
$zip.Dispose()
Write-Host "  -> classes3_patched.dex injected successfully!" -ForegroundColor Green

Write-Host ">>> [2/3] Zipaligning & Signing APK with uber-apk-signer (v1, v2, v3)..." -ForegroundColor Cyan
& $JAVA -jar $UBER_SIGNER -a $unsignedApk --allowResign -o $DIST_DIR

$signedResult = Join-Path $DIST_DIR "KAuto_unsigned-aligned-debugSigned.apk"
if (Test-Path $signedResult) {
    Move-Item -Path $signedResult -Destination $OUTPUT_APK -Force
} else {
    throw "Signed output APK not found at $signedResult!"
}

if (Test-Path $OUTPUT_APK) {
    Write-Host ">>> [3/3] BUILD THANH CONG: $OUTPUT_APK ($(Get-Item $OUTPUT_APK | Select-Object -ExpandProperty Length) bytes)" -ForegroundColor Green
} else {
    throw "Build and sign failed, output APK not found!"
}

# Clean up temporary unsigned file if left
if (Test-Path $unsignedApk) {
    Remove-Item $unsignedApk -Force
}

# 4. Cai vao thiet bi Android qua ADB neu co switch -Install
if ($Install) {
    Write-Host ">>> [ADB] Dang ket noi va cai dat vao MuMu Player..." -ForegroundColor Cyan
    & $ADB connect 127.0.0.1:16384
    & $ADB -s 127.0.0.1:16384 install -r "$OUTPUT_APK"
    if ($LASTEXITCODE -eq 0) {
        Write-Host ">>> [ADB] CAI DAT APK THANH CONG VAO MUMU PLAYER!" -ForegroundColor Green
    } else {
        Write-Warning ">>> [ADB] Cai dat vao 127.0.0.1:16384 khong thanh cong, thu tiep voi thiet bi mac dinh..."
        & $ADB install -r "$OUTPUT_APK"
    }
}
