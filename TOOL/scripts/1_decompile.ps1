# 1. Decompile APK da merge vao thu muc source
param([switch]$Force)

. "$PSScriptRoot\config.ps1"

Write-Host ">>> [1/3] Bat dau Decompile APK: $ORIGINAL_APK" -ForegroundColor Cyan

if (-not (Test-Path $ORIGINAL_APK)) {
    Write-Host ">>> Chua tim thay APK merged, tien hanh merge tu XAPK truoc..." -ForegroundColor Yellow
    & "$PSScriptRoot\0_merge_xapk.ps1"
}

if (-not (Test-Path $ORIGINAL_APK)) {
    Write-Error "Khong tim thay file APK tai $ORIGINAL_APK"
    exit 1
}

# Xoa thu muc source cu neu co
if (Test-Path $SOURCE_DIR) {
    Write-Host "  -> Don dep thu muc source cu..." -ForegroundColor Gray
    Remove-Item -Path $SOURCE_DIR -Recurse -Force -ErrorAction SilentlyContinue
}

# Goi apktool decompile
java -jar "$APKTOOL" d -f -o "$SOURCE_DIR" "$ORIGINAL_APK"

if ($LASTEXITCODE -eq 0) {
    Write-Host ">>> [1/3] Decompile THANH CONG vao $SOURCE_DIR" -ForegroundColor Green
} else {
    Write-Error ">>> [1/3] Decompile THAT BAI voi ma loi $LASTEXITCODE"
}
