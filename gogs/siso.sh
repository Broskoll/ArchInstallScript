#!/bin/bash

echo "/dev/sda1 /home/pi/usb vfat uid=git,gid=git,umask=0022,sync,auto,nosuid,rw,nouser 0 0" >> /etc/fstab
reboot
