#!/usr/bin/env bash
set -e

# get country
iso=$(curl -4 ifconfig.co/country-iso)
timedatectl set-ntp true
# enable parallel download
sed -i 's/^#Para/Para/' /etc/pacman.conf
PKGS=(
'reflector'
'rsync'
'grub'
'pacman'
'btrfs-progs'
)
pacman --noconfirm --needed -S ${PKGS[*]}

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo "Getting fastest mirror for pacman"
reflector -a 48 -c $iso -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
