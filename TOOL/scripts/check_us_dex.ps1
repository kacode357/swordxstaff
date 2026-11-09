Add-Type -AssemblyName System.IO.Compression.FileSystem
$apk = 'C:\Users\Lenovo\Downloads\ZhangjcsomStatic-155095.apk'
$zip = [System.IO.Compression.ZipFile]::OpenRead($apk)
foreach ($e in $zip.Entries) {
    if ($e.FullName -like '*.dex') {
        $tempDex = Join-Path $env:TEMP "check_$($e.Name)"
        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($e, $tempDex, $true)
        $bytes = [System.IO.File]::ReadAllBytes($tempDex)
        Remove-Item $tempDex
        $text = [System.Text.Encoding]::ASCII.GetString($bytes)
        $hasAppActivity = $text.Contains('Lcom/leiting/unity/AppActivity;')
        Write-Host "$($e.FullName): has AppActivity = $hasAppActivity"
    }
}
$zip.Dispose()
