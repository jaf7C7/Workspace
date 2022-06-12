#!/bin/sh
#
# `w3medit.cgi`: Edit the current document, or edit the source file if it's a
#                cgi-generated page.
#
# Depends: `w3m`
# Environment: W3M_URL

# For use with custom 'zet' URI
file="${W3M_URL#zet:}"
file="${file#*cgi\?}"

echo 'Content-Type: text/html'

if [ -e "$file" ]; then
	echo "W3m-control: LOAD $file"
	echo 'W3m-control: DELETE_PREVBUF'
	echo 'W3m-control: EDIT'
	echo 'W3m-control: BACK'
else
	echo 'W3m-control: BACK'
	echo 'W3m-control: DELETE_PREVBUF'
	echo 'W3m-control: EDIT'
fi

echo

