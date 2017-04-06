@ 2> nul
@echo off

chcp 65001

pandoc.exe -s "README.md" -o "README.docx"
pandoc.exe -s "README.md" -o "README.html"
pandoc.exe -s "Техническа спецификация.md" -o "Техническа спецификация.docx"
pandoc.exe -s "Техническа спецификация.md" -o "Техническа спецификация.html"
pandoc.exe -s "Издаване на транспортен сертификат.md" -o "Издаване на транспортен сертификат.docx"
pandoc.exe -s "Издаване на транспортен сертификат.md" -o "Издаване на транспортен сертификат.html"
