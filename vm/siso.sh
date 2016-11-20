echo -e "Ethernet"
ip link
read -p "Enter the name of your interested path (Example : sda) : " sd
sudo systemctl enable dhcpcd@${eth}.service
sudo systemctl start dhcpcd@${eth}.service

echo -e "Update/Upgrade"
sudo pacman -Syu

echo -e "Install packages"
sudo pacman -S \
xf86-video-intel mesa \
xorg-server xorg-server-utils xorg-xinit \
termite \
sxhkd \
neovim \
alsa-utils \
udiskie \
python python2 python-pip python2-pip \
mutt \
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
w3m
yaourt -S phallus-fonts-git \
bdf-creep \
concalc \
lemonbar-git \
dmenu2 \
hsetroot
#Terminal xst
#yaourt -S xst-git

echo -e "Enable Ssh"
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

#Vim setup
#Vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd .config
mkdir nvim
cd nvim
touch init.vim
nano init.vim 
#Add this at the end of the file
    runtime! archlinux.vim

    set number
    filetype plugin on
    syntax on

    call plug#begin()
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    call plug#end()
#Inside nvim
:PlugInstall

#Login manager
sudo systemctl enable slim.service
sudo nano /etc/slim.conf
cd /usr/share/slim/themes/
sudo git clone https://github.com/naglis/slim-minimal.git


