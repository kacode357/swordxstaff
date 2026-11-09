$toolsDir = "D:\swordxstaff\TOOL\tools"
if (-not (Test-Path $toolsDir)) {
    New-Item -ItemType Directory -Path $toolsDir -Force | Out-Null
}

$downloads = @(
    @{ Url = "https://github.com/REAndroid/APKEditor/releases/download/V1.4.9/APKEditor-1.4.9.jar"; Out = "$toolsDir\APKEditor.jar" },
    @{ Url = "https://github.com/iBotPeaches/Apktool/releases/download/v3.0.3/apktool_3.0.3.jar"; Out = "$toolsDir\apktool.jar" },
    @{ Url = "https://repo1.maven.org/maven2/org/smali/baksmali/2.5.2/baksmali-2.5.2.jar"; Out = "$toolsDir\baksmali.jar" },
    @{ Url = "https://repo1.maven.org/maven2/org/smali/smali/2.5.2/smali-2.5.2.jar"; Out = "$toolsDir\smali.jar" },
    @{ Url = "https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar"; Out = "$toolsDir\uber-apk-signer.jar" }
)

foreach ($d in $downloads) {
    if (-not (Test-Path $d.Out)) {
        Write-Host "Downloading $($d.Out)..." -ForegroundColor Cyan
        Invoke-WebRequest -Uri $d.Url -OutFile $d.Out -UseBasicParsing
    } else {
        Write-Host "Already exists: $($d.Out)" -ForegroundColor Green
    }
}

Get-ChildItem $toolsDir | Select-Object Name, Length
