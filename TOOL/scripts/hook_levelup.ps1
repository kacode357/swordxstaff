$f = "D:\swordxstaff\TOOL\smali_us_classes2\com\leiting\unity\AppActivity.smali"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$lines = [System.IO.File]::ReadAllLines($f, $utf8NoBom)

for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i].Trim() -eq ".method public LevelUpReport(Ljava/lang/String;)V") {
        $lines[$i + 1] = "    .registers 4"
        $newLines = @(
            "    # [KAuto] Hook LevelUpReport",
            "    const-string v0, `"LevelUpReport`"",
            "    invoke-static {v0, p1}, Lcom/kauto/KAutoBridge;->onGameReport(Ljava/lang/String;Ljava/lang/String;)V"
        )
        $lines = $lines[0..($i + 1)] + $newLines + $lines[($i + 2)..($lines.Length - 1)]
        Write-Host "Hooked LevelUpReport at line $($i + 1)"
        break
    }
}

[System.IO.File]::WriteAllLines($f, $lines, $utf8NoBom)
