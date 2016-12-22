echo -e "\n Ethernet"
ip link
read -p "Enter the ethernet name : " eth
sudo systemctl enable dhcpcd@${eth}.service
sudo systemctl start dhcpcd@${eth}.service

echo -e "\n Update/Upgrade"
sudo pacman -Syu

echo -e "\n Install packages"
echo -e "Pacman"
sudo pacman -S `#comment` \
xf86-video-intel mesa \
xorg-server xorg-server-utils xorg-xinit \
linux-zen \
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
w3m \
bropages \
xsel \
qutebrowser \
ruby \
zsh \
zsh-completions
echo -e "Yaourt"
yaourt -S phallus-fonts-git \
bdf-creep \
concalc \
lemonbar-git \
dmenu2 \
hsetroot \
arch-wiki-man \
wiki \
searx \
nodejs-how2 \
hget-git \
nodejs-tldr \
micro \
min-browser-bin \
kpcli \
megatools \
subliminal-git \
termfeed-git \
buku \
rtv \
khal \
oh-my-zsh-git
echo -e "Npm"
npm install -g magnet-cli \
tvcl \
rdcli
echo -e "Gem"
gem install tod-gem
#Terminal xst
#yaourt -S xst-git

echo -e "\n Enable Ssh"
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
