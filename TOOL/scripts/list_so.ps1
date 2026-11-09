Add-Type -AssemblyName System.IO.Compression.FileSystem
$apk = 'C:\Users\Lenovo\Downloads\ZhangjcsomStatic-155095.apk'
$zip = [System.IO.Compression.ZipFile]::OpenRead($apk)
foreach ($e in $zip.Entries) {
    if ($e.FullName -like 'lib/*') {
        Write-Host "$($e.FullName) ($($e.Length) bytes)"
    }
}
$zip.Dispose()
