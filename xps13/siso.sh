#!/bin/bash
#wget -O siso.sh goo.gl/bI4WaB && bash siso.sh

sudo wifi-menu
sudo netctl enable wlp2s0-MagicWifi
sudo netctl start wlp2s0-MagicWifi

echo -e "\n Update/Upgrade"
sudo pacman -Syu

echo -e "\n Install packages"
echo -e "Pacman"
sudo pacman -S `#comment` \
xf86-video-intel mesa \
xorg-server xorg-server-utils xorg-xinit \
linux-zen linux-zen-headers `#Kernel` \
xf86-input-synaptics xf86-input-libinput \
termite \
neovim \
firefox \
alsa-utils \
udiskie \
i3lock \
python python2 python-pip python2-pip \
android-tools \
mpv \
ranger \
feh \
zip unzip \
redshift \
htop \
slim \
scrot \
openssh \
rsync \
ntfs-3g \
unclutter \
xsel `#Copy` \
ruby \
npm \
powertop \
tlp \
zsh \
zsh-completions

echo -e "Yaourt"
yaourt -S \
i3-gaps-git \
broadcom-wl-dkms \
concalc \
lemonbar-git \
dmenu2 \
hsetroot \
searx \
zeronet \
#hget-git `#Better wget` \
kpcli `#Keepass` \
addic7ed-cli `#Subtitles`\
rtv \
plymouth \
oh-my-zsh-git \
rdcli

#echo -e "Npm"
#sudo npm install -g minimist request cheerio \

echo -e "\n Enabling Ssh"
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

echo -e "\n Enabling Zeronet
sudo systemctl enable zeronet

sudo echo "Section \"InputClass\"" >> /etc/X11/xorg.conf.d/50-libinput.conf
sudo echo "	Identifier \"touchpad\"" >> /etc/X11/xorg.conf.d/50-libinput.conf
sudo echo "	MatchProduct \"DLL0665:01 06CB:76AD Touchpad\"" >> /etc/X11/xorg.conf.d/50-libinput.conf
sudo echo "	Driver \"libinput\"" >> /etc/X11/xorg.conf.d/50-libinput.conf
sudo echo "	Option	\"Tapping\"	\"on\"" >> /etc/X11/xorg.conf.d/50-libinput.conf
sudo echo "	Option	\"AccelSpeed"	\"1\"" >> /etc/X11/xorg.conf.d/50-libinput.conf
sudo echo "EndSection" >> /etc/X11/xorg.conf.d/50-libinput.conf

sudo echo "options snd_hda_intel index=1,0" >> /etc/modprobe.d/alsa-base.conf

#Kernel
#Change "linux /vmlinuz-linux" to linux "/vmlinuz-linux-zen" 
#and "options ..." add "pcie_aspm=force quiet splash" before rw

#TO USE
convert -size 3200x1800 xc:#121212 wall.png
convert wall.png -gravity Center -fill gray85 -font Inconsolata -pointsize 128 -annotate 0 "Hi" welcome.png
#Get colors: https://www.imagemagick.org/script/color.php

#TO DO
#Plymouth
#EDIT : /etc/mkinitcpio.conf
#HOOKS="base udev plymouth [...] "
