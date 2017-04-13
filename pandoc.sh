#!/bin/bash

# http://pandoc.org/installing.html

WORKING_DIR=`dirname $0`
OUTPUT_DIR="$WORKING_DIR/.output"

if [ -e "$OUTPUT_DIR" ]; then
	rm -rf "$OUTPUT_DIR"
fi

mkdir -p "$OUTPUT_DIR"

for FILE_MD in "$WORKING_DIR"/*.md; do
	echo "Converting \"$FILE_MD\" to DOCX..."
	FILE_DOCX=$OUTPUT_DIR/`basename "$FILE_MD" .md`
	pandoc -s "$FILE_MD" -o "$FILE_DOCX" -t docx

	echo "Converting \"$FILE_MD\" to HTML..."
	FILE_HTML=$OUTPUT_DIR/`basename "$FILE_MD" .html`
	pandoc -s "$FILE_MD" -o "$FILE_HTML" -t html
done
