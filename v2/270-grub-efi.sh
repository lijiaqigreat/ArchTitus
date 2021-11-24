set -e
grub-install --efi-directory=/boot /dev/vda
grub-mkconfig -o /boot/grub/grub.cfg
