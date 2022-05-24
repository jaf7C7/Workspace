#!/bin/sh
#
# If the target is a markdown file, automatically render it as html

exec 2>/tmp/log
set -x

echo 'Content-Type: text/html'
if [ -z "$QUERY_STRING" ] && [ -z "$W3M_CURRENT_LINK" ]; then
	echo 'W3m-control: BACK'
	echo 'W3m-control: GOTO_LINK'
	echo
	exit
fi
[ -z "$W3M_CURRENT_LINK" ] && W3M_CURRENT_LINK="$QUERY_STRING"
case "$W3M_CURRENT_LINK" in
	*.md)
		# Remove 'file:/?/?'
		target="${W3M_CURRENT_LINK#${W3M_CURRENT_LINK%%/[!/]*}}"
		if [ -e "$target" ]; then
			target="file:/cgi-bin/md2html.cgi?$target"
			echo "W3m-control: GOTO $target"
		fi
	;;
	*) echo "W3m-control: GOTO $W3M_CURRENT_LINK" ;;
esac
echo 'W3m-control: DELETE_PREVBUF'
echo

