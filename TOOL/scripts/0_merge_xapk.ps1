# 0. Merge XAPK (Split APKs) thanh 1 file APK don le duy nhat
param([switch]$Force)

. "$PSScriptRoot\config.ps1"

Write-Host ">>> [0/3] Bat dau Merge XAPK: $ORIGINAL_XAPK -> $ORIGINAL_APK" -ForegroundColor Cyan

if (-not (Test-Path $ORIGINAL_XAPK)) {
    Write-Error "Khong tim thay file XAPK goc tai $ORIGINAL_XAPK"
    exit 1
}

if ((Test-Path $ORIGINAL_APK) -and (-not $Force)) {
    Write-Host ">>> File APK da merge da ton tai tai $ORIGINAL_APK (dung -Force de merge lai)" -ForegroundColor Yellow
    exit 0
}

java -jar "$APKEDITOR" m -i "$ORIGINAL_XAPK" -o "$ORIGINAL_APK" -f

if ($LASTEXITCODE -eq 0 -and (Test-Path $ORIGINAL_APK)) {
    Write-Host ">>> [0/3] Merge XAPK THANH CONG: $ORIGINAL_APK" -ForegroundColor Green
} else {
    Write-Error ">>> [0/3] Merge XAPK THAT BAI!"
    exit 1
}
