#!/usr/bin/env bash
set -e

PKGS=(
'xorg-server'
'xfce4'
'xfce4-goodies'
'lightdm' # Login Manager
'lightdm-gtk-greeter'
)
sudo pacman -S --noconfirm --needed ${PKGS[*]}
sudo systemctl enable lightdm

