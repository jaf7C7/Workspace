#!/bin/sh

echo 'Content-type: text/html'
echo ''
echo '<html>'
echo '<head><title>CGI Test</title></head>'
echo '<body>'
echo "<h1>Success!</h1><p>This page was served by $0</p>"

echo '<h6>Arguments</h6>'

for arg do
	echo "<li>$arg</li>";
done

echo '<h6>START ENV</h6>'

echo '<ul>'

set -- $(env|sort)

for arg do
	echo "<li>$arg</li>"
done

echo '</ul>'

echo '<h6>END ENV</h6>'

echo '</body>'
echo '</html>'
