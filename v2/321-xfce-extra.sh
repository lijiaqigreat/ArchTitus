#!/usr/bin/env bash
set -e

PKGS=(
# 'gnome-system-monitor'
'baobab' # Disk Analyzer
'adobe-source-han-sans-otc-fonts' # Chinese fonts
'ibus-pinyin'
)
sudo pacman -S --noconfirm --needed ${PKGS[*]}
PKGS_YAY=(
'mint-themes'
'mint-y-icons'
'xfce4-panel-profiles'
'google-chrome'
)

yay -S --noconfirm ${PKGS_YAY[*]}

mkdir -p ~/.config/autostart/

# Autostart ibus
cat > ~/.config/autostart/ibus.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=ibus
Comment=Start IBus daemon
OnlyShowIn=Xfce;
Exec=ibus-daemon -d -x
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false
EOF

#MINT_THEME="Mint-Dark-Blue"
#xfconf-query -c xsettings -p /Net/ThemeName -s $MINT_THEME
#xfconf-query -c xsettings -p /Net/IconThemeName -s $MINT_THEME
##TODO
#xfce4-panel-profiles load $SCRIPT_DIR/v1.tar.bz2

echo -e "\nDone!\n"
exit
