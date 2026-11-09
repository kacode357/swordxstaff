$bytes = [System.IO.File]::ReadAllBytes("D:\swordxstaff\game_assets\il2cpp\libil2cpp.so")
$str = [System.Text.Encoding]::ASCII.GetString($bytes)
$matches = [regex]::Matches($str, "UnityEngine\.Time::[a-zA-Z0-9_()]+")
$uniq = $matches | ForEach-Object { $_.Value } | Select-Object -Unique
Write-Host "Found $($uniq.Count) Time icalls:"
$uniq | ForEach-Object { Write-Host "  $_" }
