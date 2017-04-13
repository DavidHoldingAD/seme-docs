#requires -Version 4.0

[CmdletBinding()]
param (
)

$WorkingDir = $PSScriptRoot
$OutputDir = Join-Path -Path $WorkingDir -ChildPath ".output"

if (Test-Path -Path $OutputDir) {
	Remove-Item -Path $OutputDir -Recurse
}

New-Item -Path $OutputDir -ItemType Directory

$FilesMD = Get-ChildItem -Path $WorkingDir -Filter "*.md"
foreach ($FileMD in $FilesMD) {
	Write-Host -Object "Converting `"$FileMD`" to DOCX..."
	$FileDOCX = Join-Path -Path $OutputDir -ChildPath "$($FileMD.Name).docx"
	pandoc.exe -s "$FileMD" -o "$FileDOCX"

	Write-Host -Object "Converting `"$FileMD`" to HTML..."
	$FileHTML = Join-Path -Path $OutputDir -ChildPath  "$($FileMD.Name).html"
	pandoc.exe -s "$FileMD" -o "$FileHTML"
}
