set -e
read -p "Enter username (default: forrest): " username
username=${username:-forrest}
read -p "Enter hostname (default: $username-arch): " hostname
hostname=${hostname:-"$username-arch"}
lsblk
read -p "Please enter disk to work on (default: /dev/vda): " DISK
DISK=${DISK:-/dev/vda}
cat > install.conf <<EOF
username=$username 
password=1234
hostname=$hostname
DISK=$DISK
EOF
echo ""
cat install.conf
echo "THIS WILL FORMAT AND DELETE ALL DATA ON THE DISK"
read -p "are you sure you want to continue (Y/n):" formatdisk
case $formatdisk in
""|y|Y|yes|Yes|YES)
  echo "Continuing..."
  exit
  ;;
*)
  echo "Exiting..."
  exit 1
;;
esac
