#!/bin/sh
#
# `w3mviewsrc.cgi`: View the source document of the current cgi-generated page,
#                   or the html source of the current web page.
#
# Depends: `w3m`
# Environment: W3M_URL

case "$W3M_URL" in
	zet:*) file="$ZETTELKAST/${W3M_URL#zet:}" ;;
	file:*) file="${W3M_URL#file://}" ;;
esac


echo 'Content-Type: text/html'
echo 'W3m-control: BACK'

if [ -e "$file" ]; then
	echo "W3m-control: LOAD $file"
else
	echo 'W3m-control: SOURCE'
fi

echo

