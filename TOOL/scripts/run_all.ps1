# Script tong hop chay 1-click cho Sword x Staff
param([switch]$SkipDecompile, [switch]$Install)

$scriptsDir = $PSScriptRoot

if (-not $SkipDecompile) {
    & "$scriptsDir\0_merge_xapk.ps1"
    & "$scriptsDir\1_decompile.ps1"
}

& "$scriptsDir\2_apply_patches.ps1"
& "$scriptsDir\3_build_and_sign.ps1" -Install:$Install
