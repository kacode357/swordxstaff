$htmlCode = Get-Content "D:\swordxstaff\TOOL\client\src\com\kauto\KAutoHtml.java" -Raw
# Extract between HTML_CONTENT = " ... ";
$start = $htmlCode.IndexOf('"<!DOCTYPE html>')
$end = $htmlCode.LastIndexOf('";')
$htmlStr = $htmlCode.Substring($start, $end - $start + 1)

# Remove quotes and plus signs from Java concatenation
$cleanHtml = $htmlStr -replace '"\s*\+\s*"', ''
# Remove leading and trailing quote
if ($cleanHtml.StartsWith('"')) { $cleanHtml = $cleanHtml.Substring(1) }
if ($cleanHtml.EndsWith('"')) { $cleanHtml = $cleanHtml.Substring(0, $cleanHtml.Length - 1) }

# Escape for smali (escape quotes and backslashes)
$smaliHtml = $cleanHtml.Replace('\', '\\').Replace('"', '\"')

$smaliContent = @'
.class public Lcom/kauto/KAutoHtml;
.super Ljava/lang/Object;
.source "KAutoHtml.java"


# static fields
.field public static final HTML_CONTENT:Ljava/lang/String; = "{HTML}"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
'@

$smaliContent = $smaliContent.Replace('{HTML}', $smaliHtml)
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("D:\swordxstaff\TOOL\client\smali\com\kauto\KAutoHtml.smali", $smaliContent, $utf8NoBom)
Write-Host "KAutoHtml.smali written successfully!"
