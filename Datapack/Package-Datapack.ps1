<#!
.SYNOPSIS
Packages the EurekaUtils Minecraft datapack as a distributable ZIP archive.

.DESCRIPTION
Minecraft requires pack.mcmeta and data/ to be at the root of a datapack ZIP,
not inside an additional EurekaUtils directory. This script creates that layout.
#>

[CmdletBinding()]
param(
    [string]$SourceDirectory = (Join-Path $PSScriptRoot 'EurekaUtils'),
    [string]$OutputDirectory = (Join-Path $PSScriptRoot 'dist')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$sourcePath = (Resolve-Path -LiteralPath $SourceDirectory).Path
$packMetadata = Join-Path $sourcePath 'pack.mcmeta'

if (-not (Test-Path -LiteralPath $packMetadata -PathType Leaf)) {
    throw "'$sourcePath' is not a datapack directory: pack.mcmeta is missing."
}

New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null
$outputPath = (Resolve-Path -LiteralPath $OutputDirectory).Path
$archivePath = Join-Path $outputPath 'EurekaUtils.zip'

# Archive the *contents* of the pack directory so pack.mcmeta is at ZIP root.
Push-Location -LiteralPath $sourcePath
try {
    $packContents = Get-ChildItem -Force | Select-Object -ExpandProperty Name
    if ($packContents.Count -eq 0) {
        throw "'$sourcePath' contains no files to package."
    }

    Compress-Archive -LiteralPath $packContents -DestinationPath $archivePath -CompressionLevel Optimal -Force
}
finally {
    Pop-Location
}

Write-Host "Created Minecraft datapack archive: $archivePath"
