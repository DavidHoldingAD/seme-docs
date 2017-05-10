#!/bin/bash

# http://pandoc.org/installing.html

WORKING_DIR=`dirname $0`
DEPLOY_DIR="$WORKING_DIR/.deploy"

if [ -e "$DEPLOY_DIR" ]; then
	rm -rf "$DEPLOY_DIR"
fi

mkdir -p "$DEPLOY_DIR"

for FILE_MD in "$WORKING_DIR"/*.md; do
	echo "Converting \"$FILE_MD\" to DOCX..."
	FILE_DOCX=$DEPLOY_DIR/${FILE_MD%.*}.docx
	pandoc -f markdown_github+hard_line_breaks -s "$FILE_MD" -o "$FILE_DOCX" -t docx

	echo "Converting \"$FILE_MD\" to HTML..."
	FILE_HTML=$DEPLOY_DIR/${FILE_MD%.*}.html
	pandoc -f markdown_github+hard_line_breaks -s "$FILE_MD" -o "$FILE_HTML" -t html
done
