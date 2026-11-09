# 3. Inject patched dex, Zipalign va Ky APK
param([switch]$Install)

. "$PSScriptRoot\config.ps1"

Write-Host ">>> [3/3] Bat dau dong goi va ky APK KAuto Sword x Staff..." -ForegroundColor Cyan

if (-not (Test-Path $DIST_DIR)) {
    New-Item -ItemType Directory -Path $DIST_DIR -Force | Out-Null
}

# Kiem tra dex da build chua
if (-not (Test-Path $PATCHED_DEX)) {
    Write-Host "  -> Chua co $PATCHED_DEX, tien hanh compile..." -ForegroundColor Yellow
    & "$PSScriptRoot\build_kauto_dex.ps1"
}

$unsignedApk = Join-Path $DIST_DIR "KAuto_unsigned.apk"

# 1. Tao file APK unsigned bang cach sao chep APK goc va thay the classes3.dex
Write-Host "  -> 1. Injecting classes3_patched.dex vao APK..." -ForegroundColor Yellow
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

# 2. Zipalign va Ky APK bang uber-apk-signer (v1, v2, v3)
Write-Host "  -> 2. Zipalign va Ky chu ky APK (v1, v2, v3)..." -ForegroundColor Yellow
& $JAVA -jar "$UBER_SIGNER" -a "$unsignedApk" --allowResign -o "$DIST_DIR"

$signedResult = Join-Path $DIST_DIR "KAuto_unsigned-aligned-debugSigned.apk"
if (Test-Path $signedResult) {
    Move-Item -Path $signedResult -Destination $OUTPUT_APK -Force
}

if (Test-Path $OUTPUT_APK) {
    Write-Host ">>> [3/3] XUAT FILE APK THANH CONG: $OUTPUT_APK" -ForegroundColor Green
} else {
    Write-Error ">>> [3/3] Dong goi & ky APK THAT BAI!"
    exit 1
}

# Don dep file tam
if (Test-Path $unsignedApk) {
    Remove-Item $unsignedApk -Force -ErrorAction SilentlyContinue
}

# 4. Cai vao may ao neu co switch -Install
if ($Install) {
    Write-Host ">>> Dang ket noi va cai dat vao MuMu Player qua ADB..." -ForegroundColor Cyan
    & $ADB connect 127.0.0.1:16384
    & $ADB -s 127.0.0.1:16384 install -r "$OUTPUT_APK"
    if ($LASTEXITCODE -ne 0) {
        & $ADB -s emulator-5554 install -r "$OUTPUT_APK"
    }
}
