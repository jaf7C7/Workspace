#!/bin/sh
#
# Render markdown files as html for local browsing

file="${QUERY_STRING##*localhost}"
file="${file#*zet:}"

case "$file" in
	*.md) : ;;
	*) file="${file}.md" ;;
esac

echo 'Content-type: text/html'

if [ ! -e "$file" ]; then
	echo
	echo "<p>404 not found: $file</p>"
	exit
fi

echo

pandoc -s -f markdown+smart -t html5 "$file" 2>/dev/null

