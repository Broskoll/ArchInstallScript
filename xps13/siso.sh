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
dunst \
udiskie \
i3lock `#Lockscreen` \
python python2 python-pip python2-pip `#Python` \
android-tools `#ADB` \
mpv `#VLC` \
ranger `#File manager` \
slim archlinux-themes-slim `#Login` \
feh `#Image viewer` \
zip unzip unrar `#Compression` \
redshift `#Flux` \
htop `#Sys info` \
xautolock `#Autolock` \
scrot `#Screenshots` \
openssh `#SSH` \
rsync `#Sync files` \
exfat-utils `#Mount exfat`
ntfs-3g \
unclutter `#Hide the mouse` \
xsel `#Copy` \
ruby \
npm \
powertop acpi \
tlp \
rofi \
zsh \
zsh-completions

echo -e "Yaourt"
yaourt -S \
i3-gaps-git \
broadcom-wl-dkms \
concalc \
lemonbar-xft-git \
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

#Plymouth
#EDIT : /etc/mkinitcpio.conf
#HOOKS="base udev plymouth [...] "
sudo rm /usr/share/plymouth/themes/spinner/anim*
sudo rm /usr/share/plymouth/themes/spinner/thro*
sudo cp thehiwallpaper.png /usr/share/plymouth/themes/spinner/wallpaper.png #TODO
sudo echo -e "[Daemon]" > /etc/plymouth/plymouthd.conf
sudo echo -e "Theme=spinner" >> /etc/plymouth/plymouthd.conf 
sudo echo -e "ShowDelay=1" >> /etc/plymouth/plymouthd.conf
sudo echo -e "[Plymouth Theme]" > /usr/share/plymouth/themes/spinner/spinner.plymouth
sudo echo -e "Name=Spinner" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
sudo echo -e "Description=A simple custom theme." >> /usr/share/plymouth/themes/spinner/spinner.plymouth
sudo echo -e "ModuleName=two-step" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
sudo echo -e "" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
sudo echo -e "[two-step]" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
sudo echo -e "ImageDir=/usr/share/plymouth/themes/spinner" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
sudo echo -e "ScriptFile=/usr/share/plymouth/themes/spinner/spinner.script" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
sudo echo -e "wallpaper_image = Image(\"wallpaper.png\");" > /usr/share/plymouth/themes/spinner/spinner.script
sudo echo -e "screen_width = Window.GetWidth();" >> /usr/share/plymouth/themes/spinner/spinner.script
sudo echo -e "screen_height = Window.GetHeight();" >> /usr/share/plymouth/themes/spinner/spinner.script
sudo echo -e "resized_wallpaper_image = wallpaper_image.Scale(screen_width,screen_height);" >> /usr/share/plymouth/themes/spinner/spinner.script
sudo echo -e "wallpaper_sprite = Sprite(resized_wallpaper_image);" >> /usr/share/plymouth/themes/spinner/spinner.script
sudo echo -e "wallpaper_sprite.SetZ(-100);" >> /usr/share/plymouth/themes/spinner/spinner.script
sudo convert -size 3200x1800 xc:black /usr/share/plymouth/themes/spinner/wall.png
sudo convert /usr/share/plymouth/themes/spinner/wall.png -gravity Center -fill white -font Inconsolata -pointsize 128 -annotate 0 "Hi" /usr/share/plymouth/themes/spinner/wallpaper.png
sudo cp /usr/share/plymouth/themes/spinner/wallpaper.png /usr/share/plymouth/themes/spinner/background-tile.png
sudo cp /usr/share/plymouth/themes/spinner/wallpaper.png /usr/share/plymouth/themes/spinner/animation-0001.png

#Slim
#take the config /etc/slim.conf
sudo systemctl enable slim.service
#take the minimal folder

#Sound
sudo echo "options snd_hda_intel index=1,0" > /etc/modprobe.d/alsa-base.conf
amixer -c 1 set SPO on
