#!/bin/bash

sudo mkdir /home/git/usb/lifeup.git
cd /home/git/usb/lifeup.git
sudo git init --bare

wget http://http.debian.net/debian/pool/main/libg/libgit2/libgit2_0.24.1.orig.tar.gz

git clone git://git.2f30.org/stagit.git
cd stagit
