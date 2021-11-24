set -e
echo "-------------------------------------------------"
echo "Setting up mirrors for optimal download          "
echo "-------------------------------------------------"

iso=$(curl -4 ifconfig.co/country-iso)
timedatectl set-ntp true
sed -i 's/^#Para/Para/' /etc/pacman.conf
PKGS=(
'reflector'
'rsync'
'grub'
'pacman'
'btrfs-progs'
)
pacman --noconfirm --needed -S $(PKGS[*])

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector -a 48 -c $iso -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
