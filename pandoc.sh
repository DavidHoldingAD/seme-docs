#!/bin/bash

pandoc -s "README.md" -o "README.docx"
pandoc -s "README.md" -o "README.html"
pandoc -s "Техническа спецификация.md" -o "Техническа спецификация.docx"
pandoc -s "Техническа спецификация.md" -o "Техническа спецификация.html"
pandoc -s "Издаване на транспортен сертификат.md" -o "Издаване на транспортен сертификат.docx"
pandoc -s "Издаване на транспортен сертификат.md" -o "Издаване на транспортен сертификат.html"
