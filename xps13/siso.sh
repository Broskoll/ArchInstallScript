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
xf86-video-intel mesa `#Core` \
xorg-server xorg-server-utils xorg-xinit \
#`linux-zen linux-zen-headers \`#Kernel\`` \
xf86-input-synaptics xf86-input-libinput `#Touchpad` \
termite `#Terminal` \
#tor \
transmission-cli `#Torrent cli` \
tmux `#Terminal multiplexer` \
neovim `#Text editor` \
firefox `#Browser` \
alsa-utils alsa-lib pusleaudio pulseaudio-alsa `#Sound` \
dunst `#Notification server` \
udiskie `#Automount` \
i3lock `#Lockscreen` \
python python2 python-pip python2-pip `#Python` \
android-tools `#ADB` \
mpv `#VLC` \
ranger w3m `#File manager` \
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
ntfs-3g `#Read and write ntfs` \
unclutter `#Hide the mouse` \
xsel `#Copy` \
ruby \
npm `#Magnet dependencie` \
powertop acpi tlp `#Battery` \
rofi `#Launcher` \
jdk8-openjdk java-openjfx `#Java` \
libreoffice-fresh `#Word processor` \
gimp `#Graphical editor` \ 
mutt `#Mail` \
youtube-dl `#Rtv dependencie` \
newsbeuter `#Rss` \
openvpn `#Vpn` \
intellij-idea-community-edition `#Java IDE` \
gtk-engine-murrine `#Gtk`

echo -e "Yaourt"
yaourt -S \
i3-gaps-git `#i3` \
broadcom-wl-dkms `#Wifi` \
concalc `#CLI calculator` \
libnotify-id `#Notifications` \
lemonbar-xft-git `#Bar` \
hsetroot `#Wallpaper` \
tmux-bash-completion `#Tmux tab completion` \
mopidy mopidy-spotify ncmpcpp mpc `#Spotify` \
zeronet-git `#Decentralize internet` \
#hget-git `#Better wget` \
kpcli `#Keepass` \
searx-git `#Searx server`
addic7ed-cli `#Subtitles` \
rtv `#Reddit` \
aseprite `#Pixel-art` \
rdcli `#Real-debrid` \
adwaita-compact-gtk-theme `#Gtk` \
torrentflix \
mullvad

#echo -e "Npm"
#sudo npm install -g minimist request cheerio \

echo -e "\n Enabling Ssh"
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

echo -e "\n Enabling Zeronet"
sudo systemctl enable zeronet

echo -e "\n Enabling Searx"
sudo systemctl enable searx

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
#and "options ..." add "pcie_aspm=force #quiet splash" before rw

#Plymouth
#EDIT : /etc/mkinitcpio.conf
#HOOKS="base udev plymouth [...] "
#sudo rm /usr/share/plymouth/themes/spinner/anim*
#sudo rm /usr/share/plymouth/themes/spinner/thro*
#sudo cp thehiwallpaper.png /usr/share/plymouth/themes/spinner/wallpaper.png #TODO
#sudo echo -e "[Daemon]" > /etc/plymouth/plymouthd.conf
#sudo echo -e "Theme=spinner" >> /etc/plymouth/plymouthd.conf 
#sudo echo -e "ShowDelay=1" >> /etc/plymouth/plymouthd.conf
#sudo echo -e "[Plymouth Theme]" > /usr/share/plymouth/themes/spinner/spinner.plymouth
#sudo echo -e "Name=Spinner" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
#sudo echo -e "Description=A simple custom theme." >> /usr/share/plymouth/themes/spinner/spinner.plymouth
#sudo echo -e "ModuleName=two-step" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
#sudo echo -e "" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
#sudo echo -e "[two-step]" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
#sudo echo -e "ImageDir=/usr/share/plymouth/themes/spinner" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
#sudo echo -e "ScriptFile=/usr/share/plymouth/themes/spinner/spinner.script" >> /usr/share/plymouth/themes/spinner/spinner.plymouth
#sudo echo -e "wallpaper_image = Image(\"wallpaper.png\");" > /usr/share/plymouth/themes/spinner/spinner.script
#sudo echo -e "screen_width = Window.GetWidth();" >> /usr/share/plymouth/themes/spinner/spinner.script
#sudo echo -e "screen_height = Window.GetHeight();" >> /usr/share/plymouth/themes/spinner/spinner.script
#sudo echo -e "resized_wallpaper_image = wallpaper_image.Scale(screen_width,screen_height);" >> /usr/share/plymouth/themes/spinner/spinner.script
#sudo echo -e "wallpaper_sprite = Sprite(resized_wallpaper_image);" >> /usr/share/plymouth/themes/spinner/spinner.script
#sudo echo -e "wallpaper_sprite.SetZ(-100);" >> /usr/share/plymouth/themes/spinner/spinner.script
#sudo convert -size 3200x1800 xc:black /usr/share/plymouth/themes/spinner/wall.png
#sudo convert /usr/share/plymouth/themes/spinner/wall.png -gravity Center -fill white -font Inconsolata -pointsize 128 -annotate 0 "Hi" /usr/share/plymouth/themes/spinner/wallpaper.png
#sudo cp /usr/share/plymouth/themes/spinner/wallpaper.png /usr/share/plymouth/themes/spinner/background-tile.png
#sudo cp /usr/share/plymouth/themes/spinner/wallpaper.png /usr/share/plymouth/themes/spinner/animation-0001.png

#Slim
#take the config /etc/slim.conf
sudo systemctl enable slim.service
#take the minimal folder /usr/share/slim/themes/minimal

#Sound
sudo echo "options snd_hda_intel index=1,0" > /etc/modprobe.d/alsa-base.conf
amixer -c 1 set SPO on
/etc/asound.conf #add this :
#pcm.dsp {
#    type plug
#    slave.pcm "dmix"
#}

sudo touch /etc/udev/rules.d/91-local.rules
#Add these to the file
#ACTION=="add",    ENV{XAUTHORITY}="/home/gawk/.Xauthority", ENV{NAME}=="*?", ENV{DISPLAY}=":0.0", ENV{ID_INPUT_KEYBOARD}=="1", RUN+="/home/gawk/.bin/kb/kbup", TEST=="power/control", ATTR{power/control}="on"
#ACTION=="remove", ENV{XAUTHORITY}="/home/gawk/.Xauthority", ENV{NAME}=="*?", ENV{DISPLAY}=":0.0", ENV{ID_INPUT_KEYBOARD}=="1", RUN+="/home/gawk/.bin/kb/kbdwn"

echo 'blacklist btusb' | sudo tee --append /etc/modprobe.d/blacklist.conf
echo 'blacklist uvcvideo' | sudo tee --append /etc/modprobe.d/blacklist.conf
#To enable : sudo modprobe btusb

sudo systemctl enable tlp.service 
sudo systemctl enable tlp-sleep.service
sudo systemctl disable systemd-rfkill.service
