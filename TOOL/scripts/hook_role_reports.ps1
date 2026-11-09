$f = "D:\swordxstaff\TOOL\smali_us_classes2\com\leiting\unity\AppActivity.smali"
$content = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)

# Hook ReportShushuEvent
$target1 = ".method public ReportShushuEvent(Ljava/lang/String;Ljava/lang/String;)V`r`n    .registers 8"
$replace1 = @'
.method public ReportShushuEvent(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    # [KAuto] Cap nhat thong tin nhan vat
    invoke-static {p1, p2}, Lcom/kauto/KAutoBridge;->onGameReport(Ljava/lang/String;Ljava/lang/String;)V
'@

if ($content.Contains("invoke-static {p1, p2}, Lcom/kauto/KAutoBridge;->onGameReport")) {
    Write-Host "Already hooked ReportShushuEvent"
} else {
    # Match flexibly
    $content = $content -replace '(?m)^\.method public ReportShushuEvent\(Ljava/lang/String;Ljava/lang/String;\)V\s*\.registers 8', @'
.method public ReportShushuEvent(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    # [KAuto] Cap nhat thong tin nhan vat
    invoke-static {p1, p2}, Lcom/kauto/KAutoBridge;->onGameReport(Ljava/lang/String;Ljava/lang/String;)V
'@
    Write-Host "Hooked ReportShushuEvent"
}

# Hook CreateRoleReport
$content = $content -replace '(?m)^\.method public CreateRoleReport\(Ljava/lang/String;\)V\s*\.registers 3', @'
.method public CreateRoleReport(Ljava/lang/String;)V
    .registers 4

    const-string v0, "CreateRole"
    invoke-static {v0, p1}, Lcom/kauto/KAutoBridge;->onGameReport(Ljava/lang/String;Ljava/lang/String;)V
'@

# Hook LoginReport
$content = $content -replace '(?m)^\.method public LoginReport\(Ljava/lang/String;\)V\s*\.registers 3', @'
.method public LoginReport(Ljava/lang/String;)V
    .registers 4

    const-string v0, "LoginReport"
    invoke-static {v0, p1}, Lcom/kauto/KAutoBridge;->onGameReport(Ljava/lang/String;Ljava/lang/String;)V
'@

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($f, $content, $utf8NoBom)
Write-Host "AppActivity hooks applied successfully!"
