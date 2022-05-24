#!/bin/sh
#
# Edit the current document, or edit the source file if it's a cgi-generated
# page.

echo 'Content-Type: text/html'
case "$W3M_FILENAME" in
	*.cgi) file="${W3M_URL#*${W3M_FILENAME}\?}" ;;
	*) file="$W3M_FILENAME" ;;
esac
if [ -e "$file" ]; then
	echo "W3m-control: LOAD $file"
	echo 'W3m-control: EDIT'
	echo 'W3m-control: DELETE_PREVBUF'
fi
echo 'W3m-control: BACK'
echo

