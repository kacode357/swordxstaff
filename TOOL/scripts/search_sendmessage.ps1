$dir = "D:\swordxstaff\TOOL\smali_us_classes2"
Get-ChildItem -Path $dir -Recurse -Filter "*.smali" | Select-String -Pattern "UnitySendMessage" | Select-Object Path, LineNumber, Line
