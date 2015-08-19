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
	> current
/usr/bin/diff current previous > /dev/null
if [ $? -eq 1 ]; then
	/usr/bin/wget --directory-prefix img $(/bin/cat current)
	/bin/cp current previous
	
	# Send by mail
    NAME=$(/bin/cat current)
    NAME=${NAME##*/}
    echo "Plop" | /usr/bin/mail -s $MESSAGE -A img/$NAME $MAIL

fi

