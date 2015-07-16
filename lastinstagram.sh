#!/bin/bash

USER=mazaurette

# Init. current and previous file must

/usr/bin/diff current previous > /dev/null
if [ $? -eq 1 ]; then
	echo "différents"
	/bin/cp current previous
	/usr/bin/phantomjs --ssl-protocol=any instagram-getlastimageurl.js $USER \
		> current
	/usr/bin/wget --directory-prefix img $(/bin/cat current)
fi

