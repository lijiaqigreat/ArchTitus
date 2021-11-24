#!/usr/bin/env bash
#-------------------------------------------------------------------------
#   █████╗ ██████╗  ██████╗██╗  ██╗████████╗██╗████████╗██╗   ██╗███████╗
#  ██╔══██╗██╔══██╗██╔════╝██║  ██║╚══██╔══╝██║╚══██╔══╝██║   ██║██╔════╝
#  ███████║██████╔╝██║     ███████║   ██║   ██║   ██║   ██║   ██║███████╗
#  ██╔══██║██╔══██╗██║     ██╔══██║   ██║   ██║   ██║   ██║   ██║╚════██║
#  ██║  ██║██║  ██║╚██████╗██║  ██║   ██║   ██║   ██║   ╚██████╔╝███████║
#  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝   ╚═╝    ╚═════╝ ╚══════╝
#-------------------------------------------------------------------------
set -e

SCRIPT_DIR="/root/ArchTitus"
cd $SCRIPT_DIR

# configure make to use all cores available
sh 2-parallel-make.sh
# sh 210-parallel-make.sh 8
sh 2-locale.sh

# Add sudo no password rights
sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

#Add parallel downloading
sed -i 's/^#Para/Para/' /etc/pacman.conf

#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# install packages and enable services
sh 2-pkgs.sh

# determine processor type and install microcode
sh 2-ucode.sh

# Graphics Drivers find and install
sh 2-graphics-driver.sh

# load configuration such as username
source install.conf

# setup new user
sh 2-add-user.sh

# setup grub
sh 2-grub.sh

# copy script to user home
mkdir -p /home/$username
mv $SCRIPT_DIR /home/$username/
chown -R $username: /home/$username/ArchTitus

