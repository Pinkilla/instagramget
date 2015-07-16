#!/bin/bash

USER=mazaurette

# Init. current and previous file must
if [ ! -f current ]; then 
	echo 0 > current
fi

if [ ! -f previous ]; then
	echo 1 > previous
fi

/usr/bin/diff current previous > /dev/null
if [ $? -eq 1 ]; then
	echo "différents"
	/usr/bin/phantomjs --ssl-protocol=any instagram-getlastimageurl.js $USER \
		> current
	/usr/bin/wget --directory-prefix img $(/bin/cat current)
	/bin/cp current previous
fi

