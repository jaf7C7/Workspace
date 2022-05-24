#!/bin/sh
#
# Render markdown files as html for local browsing

file="${QUERY_STRING##*localhost}"
echo 'Content-type: text/html'
if [ ! -e "$file" ]; then
	case "$SERVER_SOFTWARE" in
		Lynx*)  echo "<p>$QUERY_STRING not found</p>" ;;
		w3m*) echo 'W3m-control BACK' ;;
	esac
fi
echo
pandoc -s -f markdown+smart -t html5 "$file" 2>/dev/null

