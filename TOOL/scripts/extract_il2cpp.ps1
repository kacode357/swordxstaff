Add-Type -AssemblyName System.IO.Compression.FileSystem
$apk = 'C:\Users\Lenovo\Downloads\ZhangjcsomStatic-155095.apk'
$zip = [System.IO.Compression.ZipFile]::OpenRead($apk)
$e = $zip.GetEntry('lib/arm64-v8a/libil2cpp.so')
$outDir = "D:\swordxstaff\game_assets\il2cpp"
if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force | Out-Null }
$dest = "$outDir\libil2cpp.so"
Write-Host "Extracting libil2cpp.so ($($e.Length) bytes)..."
[System.IO.Compression.ZipFileExtensions]::ExtractToFile($e, $dest, $true)
$zip.Dispose()
Write-Host "Done!"
