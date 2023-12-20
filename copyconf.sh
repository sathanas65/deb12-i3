#!/bin/bash
####
# This script is used to copy my config files over for use on reboot of installation.

cd
cd deb12-i3

cp -r config/backgrounds/ ~/.config
cp -r config/i3/ ~/.config
cp -r config/dunst/ ~/.config
cp -r config/terminator/ ~/.config
cp -r config/rofi/ ~/.config
cp -r config/konsole/ ~/.local/share
chmod +x ~/.config/i3/autostart.sh
cd ~/.config/i3/
rm configvm

