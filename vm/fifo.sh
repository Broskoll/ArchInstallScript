#!/bin/bash
#wget -O fifo.sh goo.gl/dY5yYf && bash fifo.sh

echo -e "\nArch Linux a VM"

echo -e "\nDevices"
lsblk
read -p "Enter the name of your interested path (Example : sda) : " sd

echo -e "\nPartition table"
echo -e "Remember : x > x > z > Y > Y"
read -p "Press enter to continue"
gdisk /dev/$sd
echo -e "Press "Enter" at new partition > 512MiB > EF00 > \"Linux Boot\""
echo -e "#Press "Enter" at new partition > 4GiB > 8200 > \"Linux Swap\""
echo -e "#Press "Enter" at new partition > Enter > Enter > \"Arch Linux\""
read -p "Press enter to continue"
cgdisk /dev/$sd

echo -e "\nFormat"
lsblk
sd1=$sd\1
echo -e "Format \"Boot\""
mkfs.fat -F32 /dev/$sd1
echo -e "Format \"Swap\""
sd2=$sd\2
mkswap /dev/$sd2
swapon /dev/$sd2
free -m
echo -e "Format \"Home\""
sd3=$sd\3
mkfs.ext4 /dev/$sd3

echo -e "Mount"
echo -e "Mount \"/mnt\""
mount /dev/$sd3 /mnt
mkdir /mnt/boot
mkdir /mnt/home
echo -e "Mount \"/mnt/boot\""
mount /dev/$sd1 /mnt/boot
echo -e "Mount \"/mnt/home\""
mount /dev/$sd3 /mnt/home

echo -e "\nMirrorlist"
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

echo -e "\nBase package"
pacstrap -i /mnt base base-devel

echo -e "\nFstab"
genfstab -U -p /mnt >> /mnt/etc/fstab

echo -e "\nLanguage"
read -p "Enter the id of your country (Example : en_US, fr_FR, de_DE, ...) : " lang
arch-chroot /mnt sed -i '/'\#$lang.UTF-8'/s/^#//' /etc/locale.gen
arch-chroot /mnt locale-gen
arch-chroot /mnt echo "LANG=$lang.UTF-8" > /mnt/etc/locale.conf

echo -e "\nTime"
arch-chroot /mnt ln -s /usr/share/zoneinfo/Europe/Paris > /mnt/etc/localtime
arch-chroot /mnt hwclock --systohc --utc

echo -e "\nHostname"
read -p "Enter a hostname : " hostnm
arch-chroot /mnt echo $hostnm > /mnt/etc/hostname
arch-chroot /mnt echo "127.0.1.1	$hostnm.localdomain     $hostnm" >> /mnt/etc/hosts

echo -e "\nPacman & Yaourt"
arch-chroot /mnt sed -i '/'multilib\]'/s/^#//' /etc/pacman.conf
arch-chroot /mnt sed -i '/\[multilib\]/ a Include = /etc/pacman.d/mirrorlist' /etc/pacman.conf
arch-chroot /mnt echo -e "[archlinuxfr]" >> /mnt/etc/pacman.conf
arch-chroot /mnt echo -e "SigLevel = Never" >> /mnt/etc/pacman.conf
arch-chroot /mnt echo -e "Server = http://repo.archlinux.fr/\$arch" >> /mnt/etc/pacman.conf
echo -e "Update \"Pacman\" \n"
arch-chroot /mnt pacman -Sy
echo -e "Install \"Yaourt\" \n"
arch-chroot /mnt pacman -S yaourt
echo -e "Install \"Bash-completion\" \n"
arch-chroot /mnt pacman -S bash-completion
echo -e "Install \"Iw\", \"Wpa_supplicant\" and \"Dialog\" \n"
arch-chroot /mnt pacman -S iw wpa_supplicant dialog

echo -e "\nUsers"
echo -e "Set root's password"
read -p "Press enter to continue"
arch-chroot /mnt passwd
echo -e "Creation of the user"
read -p "Enter a username : " usr
arch-chroot /mnt useradd -m -g users -G wheel,storage,power -s /bin/bash $usr
echo -e "Set user's password"
read -p "Press enter to continue"
arch-chroot /mnt passwd $usr

echo -e "\nVisudo"
arch-chroot /mnt sed -i '/%wheel ALL=(ALL) ALL/s/^# //' /etc/sudoers
arch-chroot /mnt sed -i '/%wheel ALL=(ALL) ALL/ a Defaults rootpw' /etc/sudoers

echo -e "\nBootctl"
arch-chroot /mnt bootctl install
arch-chroot /mnt echo -e "title Arch Linux" >> /mnt/boot/loader/entries/arch.conf
arch-chroot /mnt echo -e "linux /vmlinuz-linux" >> /mnt/boot/loader/entries/arch.conf
arch-chroot /mnt echo -e "initrd /initramfs-linux.img" >> /mnt/boot/loader/entries/arch.conf
arch-chroot /mnt echo -e "options root=/dev/$sd3 rw" >> /mnt/boot/loader/entries/arch.conf

read -p "Press enter to reboot"
umount -R /mnt
reboot
