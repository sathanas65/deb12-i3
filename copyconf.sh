#!/bin/bash
####
# This script is used to copy my config files over for use on reboot of installation.

cd
cd deb12-i3

cp -r scripts/ ~/
cp -r config/backgrounds/ ~/.config
cp -r config/i3/ ~/.config
cp -r config/i3blocks/ ~/.config
cp -r config/dunst/ ~/.config
cp -r config/chromium/ ~/.config
cp -r config/Brave-Browser/ ~/.config
cp -r config/terminator/ ~/.config
cp -r config/rofi/ ~/.config
cp -r config/volumeicon ~/.config
cp -r config/xfce4 ~/.config
#cp -r config/Brackets ~/.config
cp -r config/copyq ~/.config
cp -r config/galculator ~/.config
cp -r config/gtk-3.0 ~/.config
cp -r config/gtk-4.0 ~/.config
cp -r config/xfce4 ~/.config
#cp -r config/sublime-text ~/.config
cp -r .mozilla ~
cp -r config/konsole/ ~/.local/share
cp config/QtProject.conf ~/.config
cp config/kcalcrc ~/.config
cp config/konsolerc ~/.config
cp config/krusaderrc ~/.config
sudo cp -r config/Sweet-Dark-v40 /usr/share/themes
sudo cp -r candy-icons /usr/share/icons

chmod +x ~/.config/i3/autostart.sh
chmod +x ~/.config/i3blocks/cpu/cpu_info.sh
chmod +x ~/.config/i3blocks/battery/battery_info.sh

# make scripts executable
sudo chmod +x ~/scripts/*.sh


