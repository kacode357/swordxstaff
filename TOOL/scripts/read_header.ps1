$f = "D:\swordxstaff\game_assets\hybridclr\Assembly-CSharp.mv.bytes"
$bytes = [System.IO.File]::ReadAllBytes($f)
Write-Host "Length:" $bytes.Length
Write-Host "First 32 bytes hex:" ([BitConverter]::ToString($bytes, 0, 32))
Write-Host "First 32 bytes ASCII:" ([System.Text.Encoding]::ASCII.GetString($bytes, 0, 32))
