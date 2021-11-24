#!/usr/bin/env bash
set -e
pacman -Sy --noconfirm

PKGS=(
'grub' # boot loader
'efibootmgr'
'networkmanager'

'htop'
'ncdu'

'base-devel'
'man-db'
'git'
'openssh'
'tmux'
'fzf'
'bash-completion'
)
sudo pacman -S --noconfirm --needed ${PKGS[*]}

systemctl enable NetworkManager
systemctl enable sshd
