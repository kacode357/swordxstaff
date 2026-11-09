$bytes = [System.IO.File]::ReadAllBytes("D:\swordxstaff\game_assets\hybridclr\Assembly-CSharp.mv.bytes")
$str = [System.Text.Encoding]::ASCII.GetString($bytes)
$matches = [regex]::Matches($str, "[A-Za-z0-9_]{3,40}(CombatRating|Level|Power|Player)[A-Za-z0-9_]*")
$uniq = $matches | ForEach-Object { $_.Value } | Select-Object -Unique
Write-Host "Found $($uniq.Count) matches:"
$uniq | Select-Object -First 30 | ForEach-Object { Write-Host "  $_" }
