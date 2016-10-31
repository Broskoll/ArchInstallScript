sudo apt-get update
sudo apt-get upgrade
sudo passwd
su
echo "/dev/sda1 /home/git/usb vfat uid=git,gid=git,umask=0022,sync,auto,nosuid,rw,nouser 0 0" >> /etc/fstab
echo "git   ALL = NOPASSWD: ALL" >> /etc/sudoers
reboot
