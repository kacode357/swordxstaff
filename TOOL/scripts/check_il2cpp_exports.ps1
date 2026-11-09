$so = "D:\swordxstaff\game_assets\il2cpp\libil2cpp.so"
$bytes = [System.IO.File]::ReadAllBytes($so)
$text = [System.Text.Encoding]::ASCII.GetString($bytes)
$matches = [regex]::Matches($text, "il2cpp_[a-zA-Z0-9_]+")
$uniq = $matches | ForEach-Object { $_.Value } | Select-Object -Unique
Write-Host "Found $($uniq.Count) il2cpp symbols:"
$uniq | Select-Object -First 30 | ForEach-Object { Write-Host "  $_" }
