#!/bin/bash
#wget -O fifo.sh goo.gl/R4HqqD && bash fifo.sh

sudo apt-get update
sudo apt-get upgrade
echo -e "Root passwd : "
sudo passwd
sudo adduser git
echo -e "Pi passwd : "
passwd pi
echo -e "Git passwd : "
sudo passwd git
sudo apt-get install git
wget https://raw.githubusercontent.com/Broskoll/Setup/master/gogs/fifo2.sh
wget https://raw.githubusercontent.com/Broskoll/Setup/master/git/siso.sh
su root ~/fifo2.sh
