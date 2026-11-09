# Build KAuto Java sources -> D8 -> Smali -> Inject vao classes3 -> classes3_patched.dex
param([switch]$Force)

. "$PSScriptRoot\config.ps1"

Write-Host ">>> [BUILD KAUTO] Bat dau compile ma nguon Java KAuto Menu..." -ForegroundColor Cyan

$clientDir = Join-Path $ROOT_DIR "client"
$srcDir = Join-Path $clientDir "src\com\kauto"
$binDir = Join-Path $clientDir "bin"
$dexDir = Join-Path $clientDir "dex"
$smaliDir = Join-Path $clientDir "smali"
$smaliClasses3 = Join-Path $ROOT_DIR "smali_classes3"

New-Item -ItemType Directory -Path $binDir, $dexDir -Force | Out-Null

$srcFiles = Get-ChildItem -Path "$srcDir\*.java" | ForEach-Object { $_.FullName }

# 1. Javac
Write-Host "  -> 1. Javac compiling (--release 8)..." -ForegroundColor Yellow
& javac --release 8 -cp "$ANDROID_JAR" -d "$binDir" $srcFiles

if ($LASTEXITCODE -ne 0) {
    Write-Error "Loi khi compile Java!"
    exit 1
}

# 2. D8
Write-Host "  -> 2. D8 dexing..." -ForegroundColor Yellow
$classFiles = Get-ChildItem -Path "$binDir\com\kauto\*.class" | ForEach-Object { $_.FullName }
& "$D8" --lib "$ANDROID_JAR" --output "$dexDir" $classFiles

if ($LASTEXITCODE -ne 0) {
    Write-Error "Loi khi chay D8!"
    exit 1
}

# 3. Baksmali KAuto classes
Write-Host "  -> 3. Baksmali disassembling KAuto classes..." -ForegroundColor Yellow
$kautoDex = Join-Path $dexDir "classes.dex"
java -jar "$BAKSMALI" d -o "$smaliDir" "$kautoDex"

# 4. Kiem tra smali_classes3
if (-not (Test-Path "$smaliClasses3\com\leiting\unity\AppActivity.smali")) {
    Write-Host "  -> Disassembling original classes3.dex..." -ForegroundColor Yellow
    $classes3Dex = Join-Path $ROOT_DIR "classes3.dex"
    if (-not (Test-Path $classes3Dex)) {
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $zip = [System.IO.Compression.ZipFile]::OpenRead($ORIGINAL_APK)
        $entry = $zip.GetEntry("classes3.dex")
        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $classes3Dex, $true)
        $zip.Dispose()
    }
    java -jar "$BAKSMALI" d -o "$smaliClasses3" "$classes3Dex"
}

# 5. Copy com.kauto smali vao smali_classes3
Write-Host "  -> 4. Copying KAuto smali to smali_classes3..." -ForegroundColor Yellow
Copy-Item -Path "$smaliDir\com\kauto" -Destination "$smaliClasses3\com" -Recurse -Force

# 6. Hook AppActivity.smali neu chua co
$appActivityPath = "$smaliClasses3\com\leiting\unity\AppActivity.smali"
$content = Get-Content $appActivityPath -Raw
if (-not $content.Contains("Lcom/kauto/KAutoMenu;->init")) {
    Write-Host "  -> Hooking AppActivity.onCreate()..." -ForegroundColor Yellow
    $target = "    iput-object p0, p0, Lcom/leiting/unity/AppActivity;->activity:Landroid/app/Activity;"
    $replacement = @"
    iput-object p0, p0, Lcom/leiting/unity/AppActivity;->activity:Landroid/app/Activity;

    # [KAuto] Khoi tao Floating Mod Menu tren Unity Activity
    invoke-static {p0}, Lcom/kauto/KAutoMenu;->init(Landroid/app/Activity;)V
"@
    $content = $content.Replace($target, $replacement)
    Set-Content -Path $appActivityPath -Value $content -NoNewline
}

# 7. Smali assemble classes3_patched.dex
Write-Host "  -> 5. Reassembling classes3_patched.dex..." -ForegroundColor Yellow
java -jar "$SMALI" a -o "$PATCHED_DEX" "$smaliClasses3"

if ($LASTEXITCODE -eq 0 -and (Test-Path $PATCHED_DEX)) {
    Write-Host ">>> [BUILD KAUTO] THANH CONG! $PATCHED_DEX" -ForegroundColor Green
} else {
    Write-Error ">>> [BUILD KAUTO] THAT BAI!"
    exit 1
}
