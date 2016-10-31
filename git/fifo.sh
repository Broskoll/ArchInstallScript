#!/bin/bash
#wget -O fifo.sh goo.gl/2T0oQ4 && bash fifo.sh

sudo apt-get update
#sudo apt-get upgrade
echo -e "Root passwd : "
sudo passwd
sudo adduser --disabled-login --gecos 'Gogs' git
echo -e "Pi passwd : "
passwd pi
echo -e "Git passwd : "
passwd git
wget -O fifo2.sh goo.gl/WcDa8H
wget -O siso.sh goo.gl/o5OEc7
su root ~/fifo2.sh
