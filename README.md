# Instagram get image

    lastinstagram.sh <account> 

Obtain last instagram image from an account. De best way to use this script is
with *cron*. Just add to your crontab file this line: 

    $ crontab -e 
    0 * * * * /elsewhere/lastinstagram.sh 

## Dependencies

You need

* phantomjs 
* mail 
* bash 
* cron

On linux machine « debian like » do 

    apt install phantomjs mailutils

*phantomjs is in sid*

## End

PiT, Pierre Bettens <pb@namok.be>                                    
[@pinkilla](http://twitter.com/pinkilla)

2015 july                                                                    
version 0.1                                                                     
                                                                                  
[![CC](cc-by-nc-sa-80x15.png)](http://creativecommons.org/licenses/by-nc-sa/4.0/deed.fr)


[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=Pinkilla&url=https://github.com/Pinkilla/instagramget&title=instagramget&language=&tags=github&category=software)



