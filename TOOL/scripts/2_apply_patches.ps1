# 2. Build client bundle & ap dung cac patch APK
param()

. "$PSScriptRoot\config.ps1"

Write-Host ">>> [2/3] Dang kiem tra cac script patch client..." -ForegroundColor Cyan
$buildClientPy = Join-Path $ROOT_DIR "client\build_client.py"
if (Test-Path $buildClientPy) {
    Write-Host "  -> Dang chay build_client.py..." -ForegroundColor Yellow
    $env:PYTHONIOENCODING = "utf-8"
    & python $buildClientPy
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Loi khi chay build_client.py!"
        exit 1
    }
}

Write-Host ">>> [2/3] Bat dau ap dung cac patch APK tu: $PATCHES_DIR" -ForegroundColor Cyan

$patchFolders = Get-ChildItem -Path $PATCHES_DIR -Directory -ErrorAction SilentlyContinue | Sort-Object Name

if ($patchFolders) {
    foreach ($patch in $patchFolders) {
        $patchScript = Join-Path $patch.FullName "apply.ps1"
        if (Test-Path $patchScript) {
            Write-Host "  -> Dang ap dung: [$($patch.Name)]" -ForegroundColor Yellow
            & $patchScript -SourceDir $SOURCE_DIR -PatchDir $patch.FullName
        } else {
            Write-Host "  -> Bo qua [$($patch.Name)] (chua co apply.ps1)" -ForegroundColor Gray
        }
    }
} else {
    Write-Host "  -> Chua co thu muc patch nao trong $PATCHES_DIR" -ForegroundColor Gray
}

Write-Host ">>> [2/3] Ap dung cac patch HOAN TAT!" -ForegroundColor Green
