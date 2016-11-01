sudo nano /etc/sudoers //add git user some rights
//sudo raspi-config //Expand filesystem, autologin in terminal and enable ssh
cd /etc/systemd/system/
sudo nano auto* //Change pi by git
mkdir usb
sudo nano /etc/fstab //add at the end : /dev/sda1 /home/git/usb vfat uid=git,gid=git,umask=0022,sync,auto,nosuid,rw,nouser 0 0
cd /home/git/usb/git.git
git init --bare
