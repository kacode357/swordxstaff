$dir = "D:\swordxstaff\game_assets\hybridclr"
$files = Get-ChildItem -Path $dir -Filter "*.bytes"

foreach ($f in $files) {
    $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
    $str = [System.Text.Encoding]::UTF8.GetString($bytes)
    
    # Search for timeScale or Speed
    $regex = [regex]::Matches($str, "[A-Za-z0-9_]{3,40}(?:timeScale|TimeScale|Speed|speed|SetSpeed)[A-Za-z0-9_]{0,40}")
    $list = @()
    foreach ($m in $regex) {
        $list += $m.Value
    }
    $uniq = $list | Select-Object -Unique
    if ($uniq) {
        Write-Host "=== $($f.Name) ===" -ForegroundColor Cyan
        $uniq | ForEach-Object { Write-Host "  $_" }
    }
}
