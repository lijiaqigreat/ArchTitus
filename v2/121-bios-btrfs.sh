#!/usr/bin/env bash
set -e
mkdir -p /mnt

sgdisk -Z ${DISK} # zap all on disk
sgdisk -a 2048 -o ${DISK} # new gpt disk 2048 alignment
# create partitions
sgdisk -n 1::-0 --typecode=1:8300 --change-name=1:'ROOT' ${DISK} # partition 1 (Root), default start, remaining

echo -e "\nCreating Filesystems...\n$HR"

if [[ ${DISK} =~ "nvme" ]]; then
mkfs.btrfs -L "ROOT" "${DISK}p1" -f
mount -t btrfs "${DISK}p1" /mnt
else
mkfs.btrfs -L "ROOT" "${DISK}1" -f
mount -t btrfs "${DISK}1" /mnt
fi
# ls /mnt | xargs btrfs subvolume delete
btrfs subvolume create /mnt/@
umount /mnt
mount -t btrfs -o subvol=@ -L ROOT /mnt
