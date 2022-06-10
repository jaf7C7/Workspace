#!/bin/sh
#
# Edit the current document, or edit the source file if it's a cgi-generated
# page.

file="${W3M_URL#zet:}"

echo 'Content-Type: text/html'
if [ -e "$file" ]; then
	echo "W3m-control: LOAD $file"
	echo 'W3m-control: EDIT'
	echo 'W3m-control: DELETE_PREVBUF'
fi

echo 'W3m-control: BACK'
echo 'W3m-control: EDIT'
echo

