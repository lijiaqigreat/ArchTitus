#!/usr/bin/env bash
set -e
if [[ -d "/sys/firmware/efi" ]]; then
  # UEFI
  grub-install --efi-directory=/boot $DISK
else
  # BIOS
  grub-install $DISK
fi
grub-mkconfig -o /boot/grub/grub.cfg
