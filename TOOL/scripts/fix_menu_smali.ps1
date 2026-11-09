$files = @(
    "D:\swordxstaff\TOOL\client\smali\com\kauto\KAutoMenu.smali",
    "D:\swordxstaff\TOOL\smali_us_classes2\com\kauto\KAutoMenu.smali"
)

foreach ($f in $files) {
    if (Test-Path $f) {
        $lines = [System.IO.File]::ReadAllLines($f)
        for ($i = 0; $i -lt $lines.Length; $i++) {
            if ($lines[$i].Trim().StartsWith("const-string v6, `"<")) {
                $lines[$i] = "    sget-object v6, Lcom/kauto/KAutoHtml;->HTML_CONTENT:Ljava/lang/String;"
                Write-Host "Replaced in $f at line $($i+1)"
                break
            }
        }
        $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
        [System.IO.File]::WriteAllLines($f, $lines, $utf8NoBom)
    }
}
