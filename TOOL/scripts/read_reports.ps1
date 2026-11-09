$f = "D:\swordxstaff\TOOL\smali_us_classes2\com\leiting\unity\AppActivity.smali"
$lines = Get-Content $f
$print = $false
$count = 0
foreach ($line in $lines) {
    if ($line -match "^\.method public (CreateRoleReport|LevelUpReport|LoginReport|ReportShushuEvent)\(") {
        $print = $true
        $count = 0
        Write-Host "================== $line =================="
    }
    if ($print) {
        Write-Host $line
        $count++
        if ($line -match "^\.end method" -or $count -gt 35) {
            $print = $false
        }
    }
}
