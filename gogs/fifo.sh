#!/bin/bash
#wget -O fifo.sh goo.gl/RO8Aj2 && bash fifo.sh

sudo apt-get update
#sudo apt-get upgrade
echo -e "Root passwd : "
sudo passwd
echo -e "Pi passwd : "
passwd pi
wget https://raw.githubusercontent.com/Broskoll/Setup/master/gogs/siso.sh
wget https://raw.githubusercontent.com/Broskoll/Setup/master/gogs/tito.sh
su root ~/siso.sh
