#!/bin/bash

# http://pandoc.org/installing.html

WORKING_DIR=$0

for FILE_MD in "$WORKINGDIR"/*.md; do
	echo "Converting \"$FILE_MD\" to DOCX..."
	FILE_DOCX=`basename "$FILE_MD" .md`
	pandoc -s "$FILE_MD" -o "$FILE_DOCX"

	echo "Converting \"$FILE_MD\" to HTML..."
	FILE_HTML=`basename "$FILE_MD" .html`
	pandoc -s "$FILE_MD" -o "$FILE_HTML"
done
