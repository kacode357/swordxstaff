$f = "D:\swordxstaff\TOOL\smali_us_classes2\com\unity3d\player\UnityPlayer.smali"
if (Test-Path $f) {
    $lines = Get-Content $f
    foreach ($line in $lines) {
        if ($line -match "^\.method.* (\w+)\(") {
            Write-Host $matches[1]
        }
    }
} else {
    Write-Host "Not in classes2, searching elsewhere"
    Get-ChildItem -Path "D:\swordxstaff\TOOL\smali_us_classes2" -Recurse -Filter "*UnityPlayer*.smali" | ForEach-Object { $_.FullName }
}
