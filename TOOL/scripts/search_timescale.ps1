$files = Get-ChildItem -Path "D:\swordxstaff\game_assets" -Recurse -File
foreach ($f in $files) {
    $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
    $str = [System.Text.Encoding]::ASCII.GetString($bytes)
    if ($str.Contains("timeScale") -or $str.Contains("TimeScale")) {
        Write-Host "Found in: $($f.FullName)"
    }
}
