#!/bin/bash

USER=default
MAIL=pb@namok.be
MESSAGE="Instagam image from awesome person"

# Init. current and previous file must
if [ ! -f current ]; then 
	echo 0 > current
fi

if [ ! -f previous ]; then
	echo 1 > previous
fi

/usr/bin/phantomjs --ssl-protocol=any instagram-getlastimageurl.js $USER \
	> httpfile
/usr/bin/perl -pe 's/^http.*\/(.+)\.jpg.*$/$1\.jpg/' httpfile > current
/usr/bin/diff current previous > /dev/null
if [ $? -eq 1 ]; then
    NAME=$(/bin/cat current)
	/usr/bin/wget --output-document=img/$NAME $(/bin/cat httpfile)
	/bin/cp current previous
	
	# Send by mail
    echo "Plop" | /usr/bin/mail -s "$MESSAGE" -A img/$NAME $MAIL

fi

