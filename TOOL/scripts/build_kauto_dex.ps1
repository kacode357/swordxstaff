# Build KAuto Smali -> Inject vao classes3 -> classes3_patched.dex
param([switch]$Force)

. "$PSScriptRoot\config.ps1"

Write-Host ">>> [BUILD KAUTO] Bat dau dong goi classes3_patched.dex..." -ForegroundColor Cyan

$clientDir = Join-Path $ROOT_DIR "client"
$smaliDir = Join-Path $clientDir "smali"
$smaliClasses3 = Join-Path $ROOT_DIR "smali_classes3"

# 1. Kiem tra va disassemble classes3.dex neu chua co
if ((-not (Test-Path "$smaliClasses3\com\leiting\unity\AppActivity.smali")) -or $Force) {
    Write-Host "  -> Disassembling original classes3.dex..." -ForegroundColor Yellow
    $classes3Dex = Join-Path $ROOT_DIR "classes3.dex"
    if ((-not (Test-Path $classes3Dex)) -or $Force) {
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $zip = [System.IO.Compression.ZipFile]::OpenRead($ORIGINAL_APK)
        $entry = $zip.GetEntry("classes3.dex")
        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $classes3Dex, $true)
        $zip.Dispose()
    }
    if (Test-Path $smaliClasses3) {
        Remove-Item -Path $smaliClasses3 -Recurse -Force
    }
    & $JAVA -jar "$BAKSMALI" d -o "$smaliClasses3" "$classes3Dex"
}

# 2. Copy com.kauto smali vao smali_classes3
Write-Host "  -> Copying KAuto smali to smali_classes3..." -ForegroundColor Yellow
$destKauto = Join-Path $smaliClasses3 "com\kauto"
if (-not (Test-Path $destKauto)) {
    New-Item -ItemType Directory -Path $destKauto -Force | Out-Null
}
Copy-Item -Path "$smaliDir\com\kauto\*" -Destination "$destKauto" -Recurse -Force

# 3. Hook AppActivity.smali neu chua co
$appActivityPath = "$smaliClasses3\com\leiting\unity\AppActivity.smali"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$content = [System.IO.File]::ReadAllText($appActivityPath, $utf8NoBom)
if (-not $content.Contains("Lcom/kauto/KAutoMenu;->init")) {
    Write-Host "  -> Hooking AppActivity.onCreate()..." -ForegroundColor Yellow
    $target = "    iput-object p0, p0, Lcom/leiting/unity/AppActivity;->activity:Landroid/app/Activity;"
    $replacement = @"
    iput-object p0, p0, Lcom/leiting/unity/AppActivity;->activity:Landroid/app/Activity;

    # [KAuto] Khoi tao Floating Mod Menu tren Unity Activity
    invoke-static {p0}, Lcom/kauto/KAutoMenu;->init(Landroid/app/Activity;)V
"@
    $content = $content.Replace($target, $replacement)
    [System.IO.File]::WriteAllText($appActivityPath, $content, $utf8NoBom)
}

# 4. Smali assemble classes3_patched.dex
Write-Host "  -> Reassembling classes3_patched.dex..." -ForegroundColor Yellow
if (Test-Path $PATCHED_DEX) {
    Remove-Item -Path $PATCHED_DEX -Force
}
& $JAVA -jar "$SMALI" a -o "$PATCHED_DEX" "$smaliClasses3"

if ($LASTEXITCODE -eq 0 -and (Test-Path $PATCHED_DEX)) {
    Write-Host ">>> [BUILD KAUTO] THANH CONG! $PATCHED_DEX" -ForegroundColor Green
} else {
    Write-Error ">>> [BUILD KAUTO] THAT BAI!"
    exit 1
}
