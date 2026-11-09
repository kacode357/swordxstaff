# 3. Inject patched dex, Zipalign va Ky bang testkey
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
$alignedApk = Join-Path $DIST_DIR "KAuto_aligned.apk"

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

# 2. Zipalign 4-byte
Write-Host "  -> 2. Zipalign 4-byte (with -p)..." -ForegroundColor Yellow
& "$ZIPALIGN" -f -p 4 "$unsignedApk" "$alignedApk"

if ($LASTEXITCODE -ne 0) {
    Write-Error "Loi khi Zipalign APK!"
    exit 1
}

# 3. Sign APK
Write-Host "  -> 3. Ky chu ky APK (v1 + v2)..." -ForegroundColor Yellow
java -jar "$APKSIGNER" sign --key "$KEY_PK8" --cert "$KEY_PEM" --v1-signing-enabled true --v2-signing-enabled true --out "$OUTPUT_APK" "$alignedApk"

if ($LASTEXITCODE -ne 0) {
    Write-Error "Loi khi ky APK!"
    exit 1
}

# Don dep file tam
Remove-Item -Path $unsignedApk, $alignedApk -Force -ErrorAction SilentlyContinue

Write-Host ">>> [3/3] XUAT FILE APK THANH CONG: $OUTPUT_APK" -ForegroundColor Green

# 4. Cai vao may ao neu co switch -Install
if ($Install) {
    Write-Host ">>> Dang cai dat vao thiet bi Android qua ADB..." -ForegroundColor Cyan
    adb install -r "$OUTPUT_APK"
}
