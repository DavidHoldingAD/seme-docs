#requires -Version 4.0

[CmdletBinding()]
param (
)

$FilesMD = Get-ChildItem -Path $PSScriptRoot -Filter "*.md"
foreach ($FileMD in $FilesMD) {
	$FileDOCX = "${$FileMD.Name}.docx"
	Write-Host -Object "Converting `"$FileMD`" to DOCX..."
	pandoc.exe -s "$FileMD" -o "$FileDOCX"

	$FileHTML = "${$FileMD.Name}.html"
	Write-Host -Object "Converting `"$FileMD`" to HTML..."
	pandoc.exe -s "$FileMD" -o "$FileDOCX"
}
