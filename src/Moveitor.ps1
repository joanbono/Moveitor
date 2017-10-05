<# 
.DESCRIPTION
    Creates a folder for each file and places the file into the folder
.REQUIRES
    Anything but love <3
.NOTES
    Name: Moveitor.ps1
    Author: Joan Bono <@joan_bono>
    Tested on Powershell v5.1
    Version: 1.0.0
.EXAMPLE
    .\Moveitor.ps1 -Folder C:\WAV_folder -Filetype wav
#>

Param(
    [Parameter(Mandatory=$True, Position=1)]
        [string]$Folder,
    [Parameter(Mandatory=$True)]
        [string]$Filetype
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$ErrorActionPreference = "SilentlyContinue"

$Extension=".$Filetype"

Get-ChildItem -File | 
Group-Object { $_.Name -replace '_.*' } | 
ForEach-Object {
    $dir = New-Item -Type Directory -Name $_.Name.Replace("$Extension","")
    $_.Group | Move-Item -Destination $dir
  }
