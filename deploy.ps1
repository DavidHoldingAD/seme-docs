#requires -Version 4.0

[CmdletBinding()]
param (
)

$WorkingDir = $PSScriptRoot
$DeployDir = Join-Path -Path $WorkingDir -ChildPath ".deploy"

if (Test-Path -Path $DeployDir) {
	Remove-Item -Path $DeployDir -Recurse
}

New-Item -Path $DeployDir -ItemType Directory

$FilesMD = Get-ChildItem -Path $WorkingDir -Filter "*.md"
foreach ($FileMD in $FilesMD) {
	Write-Host -Object "Converting `"$FileMD`" to DOCX..."
	$FileDOCX = Join-Path -Path $DeployDir -ChildPath "$($FileMD.BaseName).docx"
	pandoc.exe -f markdown_github+hard_line_breaks -s "$FileMD" -o "$FileDOCX" -t docx

	Write-Host -Object "Converting `"$FileMD`" to HTML..."
	$FileHTML = Join-Path -Path $DeployDir -ChildPath  "$($FileMD.BaseName).html"
	pandoc.exe -f markdown_github+hard_line_breaks -s "$FileMD" -o "$FileHTML" -t html
}

$Directories = Get-ChildItem -Path $WorkingDir -Exclude ".*" | ?{ $_.PSIsContainer }
foreach ($Directory in $Directories) {
	Write-Host -Object "Copying directory `"$Directory`"..."
	Copy-Item -Path $Directory -Destination $DeployDir -Recurse
}
