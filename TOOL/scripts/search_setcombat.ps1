$files = Get-ChildItem -Path "D:\swordxstaff" -Recurse -File -Exclude "*.apk","*.dex","*.log","*.png"
foreach ($f in $files) {
    try {
        $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
        $str = [System.Text.Encoding]::ASCII.GetString($bytes)
        if ($str.Contains("SetCombatRating")) {
            Write-Host "Found in: $($f.FullName)"
        }
    } catch {}
}
