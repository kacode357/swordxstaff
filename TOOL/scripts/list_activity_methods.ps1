$f = "D:\swordxstaff\TOOL\smali_us_classes2\com\leiting\unity\AppActivity.smali"
$lines = Get-Content $f
foreach ($line in $lines) {
    if ($line -match "^\.method public (\w+)\(") {
        Write-Host $matches[1]
    }
}
