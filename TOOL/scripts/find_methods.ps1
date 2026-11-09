$f = "D:\swordxstaff\TOOL\smali_us_classes2\com\leiting\unity\AppActivity.smali"
$lines = Get-Content $f
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "UnitySendMessage") {
        $start = [Math]::Max(0, $i - 10)
        $end = [Math]::Min($lines.Count - 1, $i + 2)
        Write-Host "--- Match at line $($i + 1) ---"
        for ($j = $start; $j -le $end; $j++) {
            Write-Host "$($j + 1): $($lines[$j])"
        }
    }
}
