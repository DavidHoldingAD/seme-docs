@ 2> nul
@echo off

chcp 65001

setlocal
setlocal EnableDelayedExpansion

rem http://pandoc.org/installing.html

set WORKING_DIR=%~dp0

for %%X in (%WORKING_DIR%*.md) do (
	echo Converting "!FILE_MD!" to DOCX...
	set FILE_DOCX=%%~nX.docx
	pandoc.exe -s "!FILE_MD!" -o "!FILE_DOCX!"

	echo Converting "!FILE_MD!" to HTML...
	set FILE_HTML=%%~nX.html
	pandoc.exe -s "!FILE_MD!" -o "!FILE_HTML!"
)
