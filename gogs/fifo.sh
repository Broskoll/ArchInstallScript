#!/bin/bash
#wget -O fifo.sh goo.gl/RO8Aj2 && bash fifo.sh

sudo apt-get update
#sudo apt-get upgrade
echo -e "Root passwd : "
sudo passwd
echo -e "Pi passwd : "
passwd pi
wget https://raw.githubusercontent.com/Broskoll/Setup/master/gogs/fifo2.sh
su root ~/fifo2.sh
sudo apt-get install git
wget https://dl.gogs.io/gogs_latest_raspi2.zip
unzip gogs_latest_raspi2.zip
sudo cp /home/git/gogs/scripts/systemd/gogs.service /etc/systemd/system/
sudo systemctl enable gogs
sudo systemctl start gogs

#If config change
#https://gogs.io/docs/advanced/configuration_cheat_sheet
#custom/conf/app.ini
#sudo systemctl stop gogs
#sudo systemctl start gogs
