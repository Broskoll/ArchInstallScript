#!/bin/bash
#wget -O siso.sh goo.gl/bI4WaB && bash siso.sh

#echo -e "\n Ethernet"
#ip link
#read -p "Enter the ethernet name : " eth
#sudo systemctl enable dhcpcd@${eth}.service
#sudo systemctl start dhcpcd@${eth}.service

echo -e "\n Update/Upgrade"
sudo pacman -Syu

echo -e "\n Install packages"
echo -e "Pacman"
sudo pacman -S `#comment` \
xf86-video-intel mesa \
xorg-server xorg-server-utils xorg-xinit \
linux-zen `#Kernel` \
termite \
neovim \
alsa-utils \
udiskie \
python python2 python-pip python2-pip \
android-tools \
mpv \
ranger \
wget \
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
zsh \
zsh-completions

echo -e "Yaourt"
yaourt -S \
broadcom-wl \
concalc \
lemonbar-git \
dmenu2 \
hsetroot \
searx \
zeronet \
hget-git `#Better wget` \
kpcli `#Keepass` \
subliminal-git `#Subtitles`\
rtv \
ruby-bropages \
oh-my-zsh-git

echo -e "Npm"
npm install -g magnet-cli \
rdcli

echo -e "\n Enabling Ssh"
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

echo -e "\n Enabling Zeronet
systemctl enable zeronet
