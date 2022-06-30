#!/bin/sh
#
# `w3medit.cgi`: Edit the current document, or edit the source file if it's a
#                cgi-generated page.
#
# Depends: `w3m`
# Environment: W3M_URL

case "$W3M_URL" in
	zet:*) file="$ZETTELKAST/${W3M_URL#zet:}" ;;
	file:*) file="${W3M_URL#file://}" ;;
esac


echo 'Content-Type: text/html'

if [ -e "$file" ]; then
	echo "W3m-control: LOAD $file"
	echo 'W3m-control: DELETE_PREVBUF'
	echo "W3m-control: GOTO_LINE $W3M_CURRENT_LINE"
	echo 'W3m-control: EDIT'
	echo 'W3m-control: BACK'
else
	echo 'W3m-control: BACK'
	echo 'W3m-control: DELETE_PREVBUF'
	echo 'W3m-control: EDIT'
fi

echo

