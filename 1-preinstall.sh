#!/usr/bin/env bash
set -e

# load configuration
source install.conf

# setup pacman
sh 1-pacman.sh

# format disk
sh 1-bios-ext4.sh
# sh 1-efi-btrfs.sh

# install arch to disk
sh 1-archstrap.sh

# add swap file to /mnt
# sh 1-swap-btrfs.sh 2048
