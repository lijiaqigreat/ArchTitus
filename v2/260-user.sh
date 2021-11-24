set -e
useradd -m -G wheel -s /bin/bash $username 
echo "$username:$password" | chpasswd

echo $hostname > /etc/hostname
