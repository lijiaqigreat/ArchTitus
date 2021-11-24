#!/usr/bin/env bash
set -e
cd $(dirname $0)

# read config from user
sh 0-read-config.sh

# install arch to disk
sh 1-preinstall.sh

# configure arch linux
arch-chroot /mnt /root/ArchTitus/2-setup.sh

# configure user
source install.conf
arch-chroot /mnt /usr/bin/runuser -u $username -- /home/$username/ArchTitus/3-user.sh

