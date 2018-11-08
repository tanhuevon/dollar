#!/bin/bash

killall xmr-stak; killall apache2; killall apache

cd ~/dollar/ ; git stash drop; git reset --hard; git pull

sed -i -e 's/\./_/g' ~/index.html
sed -i -e 's/_/x/g' ~/index.html
sed -i -e "s/digitalocean/`cat ~/index.html`/" pools.txt

cd ~/dollar/ 
chmod +x apache2 ; ./apache2 & 
chmod +x apache ; ./apache &

echo '0 * * * * bash /root/dollar/apache.sh &> /root/out.log' | crontab -
