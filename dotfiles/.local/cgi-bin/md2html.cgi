#!/bin/sh
#
# `md2html.cgi`: Render markdown files as html for local browsing
#
# Depends: `pandoc`
# Environment: QUERY_STRING, ZETTELKAST

case "$QUERY_STRING" in
	zet:*) file="$ZETTELKAST/${QUERY_STRING#zet:}.md" ;;
	*) file="${QUERY_STRING#*://}" ;;
esac

echo 'Content-type: text/html'
echo

if [ ! -e "$file" ]; then
	echo "<p>404 not found: $file</p>"
	exit
fi

pandoc -s -f markdown+smart -t html5 "$file" 2>/dev/null

