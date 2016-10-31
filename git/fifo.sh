sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
sudo adduser --disabled-login --gecos 'Gogs' git
sudo nano /etc/sudoers
//Add : git   ALL = NOPASSWD: ALL
sudo su - git
wget https://dl.gogs.io/gogs_v0.9.97_raspi2.zip
unzip gogs_v0.9.97_raspi2.zip
sudo cp /home/git/gogs/scripts/systemd/gogs.service /etc/systemd/system/
sudo systemctl enable gogs
sudo systemctl start gogs
mkdir git
su
echo "/dev/sda1 /home/git/usb vfat uid=git,gid=git,umask=0022,sync,auto,nosuid,rw,nouser 0 0" >> /etc/fstab

//If config change
//https://gogs.io/docs/advanced/configuration_cheat_sheet
//custom/conf/app.ini
//sudo systemctl stop gogs
//sudo systemctl start gogs
