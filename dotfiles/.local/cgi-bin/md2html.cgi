#!/bin/sh
#
# `md2html.cgi`: Render markdown files as html for local browsing
#
# Depends: `pandoc`
# Environment: QUERY_STRING

file="$QUERY_STRING"

# For use with custom 'zet' scheme
file="${file#*//zet}" # lynx
file="${file#zet:}" # w3m

echo 'Content-type: text/html'
echo

if [ ! -e "$file" ]; then
	echo "<p>404 not found: $file</p>"
	exit
fi

pandoc -s -f markdown+smart -t html5 "$file" 2>/dev/null

