#Wired
#Check internet connection
ip link
#We want the wired one here : enp3s0
sudo systemctl enable dhcpcd@enp3s0.service
sudo systemctl start dhcpcd@enp3s0.service

#Software
#Upgrade everything
sudo pacman -Syu
#Video dirvers
sudo pacman -S xf86-video-intel mesa
#Xorg
sudo pacman -S xorg-server xorg-server-utils xorg-xinit 
#Terminal termite
sudo pacman -S termite
#Sxhkd
sudo pacman -S sxhkd
#Neovim
sudo pacman -S neovim
#Sound
sudo pacman -S alsa-utils 
#Automount
sudo pacman -S udiskie
#Python
sudo pacman -S python python2 python-pip python2-pip
#Freebox
sudo pacman -S cifs-utils 
#Mail
sudo pacman -S mutt
#Android tools
sudo pacman -S android-tools
#Firefox
sudo pacman -S firefox 
#CLI Vlc
sudo pacman -S mpv 
#CLI file manager
sudo pacman -S ranger 
#CLI download
sudo pacman -S wget
#Image viewer
sudo pacman -S feh 
#Zip
sudo pacman -S zip unzip 
#F.lux
sudo pacman -S redshift
#Process viewer
sudo pacman -S htop
#Login manager
sudo pacman -S slim
#Print screen
sudo pacman -S scrot 
#Ssh
sudo pacman -S openssh 
#Gimp
sudo pacman -S gimp 
#Sync files
sudo pacman -S rsync
#Ntfs support
sudo pacman -S ntfs-3g
#Hide unused mouse
sudo pacman -S unclutter
#CLI browser
sudo pacman -S w3m
#Wmutils
yaourt -S wmutils-git
#Lemon font
yaourt -S phallus-fonts-git
#Creep font
yaourt -S bdf-creep
#Calculator
yaourt -S concalc 
#Lemonbar
yaourt -S lemonbar-git 
#Dmenu
yaourt -S dmenu2
#Solid color wallpaper
yaourt -S hsetroot
#Correct last command
yaourt -S thefuck
#Terminal xst
yaourt -S xst-git

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

#Bluetooth
sudo pacman bluez bluez-utils
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo hciconfig hci0 up #Without that bluetoothwtl won't work
bluetoothctl
#Start bluetooth everytime
sudo nano /etc/udev/rules.d/10-local.rules
    #Set bluetooth power up 
    ACTION=="add", KERNEL=="hci0", RUN+="/usr/bin/hciconfig hci0 up"

#Firefox
#Extensions
#   stylish
#   custom new tab
#   ghostery
#   HTTPS everywhere
#   ublock origin
#   tab groups
#   auto unload tabs
#Home page
#file:///home/gawk/.config/ffox/page/index.html

#Login manager
sudo systemctl enable slim.service
sudo nano /etc/slim.conf
cd /usr/share/slim/themes/
sudo git clone https://github.com/naglis/slim-minimal.git

#Ssh
sudo pacman -S openssh
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
#Local IP
hostname -i
