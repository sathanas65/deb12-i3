#!/bin/bash
####
# This script is used to copy my config files over for use on reboot of installation.

sudo cp -r candy-icons /usr/share/icons
cd
cd deb12-i3

# import scripts
cp -r scripts/ ~/

# import backgrounds
cp -r config/backgrounds/ ~/.config

# import window manager and bar configs
cp -r config/i3/ ~/.config
cp -r config/i3blocks/ ~/.config

# import notification daemon config
cp -r config/dunst/ ~/.config

# import app launcher config (optional - ensures dark theme works out of the box)
cp -r config/rofi/ ~/.config

# import browser configs (optional - ensures dark theme and dark reader extension work out of the box)
cp -r config/chromium/ ~/.config
cp -r .mozilla ~
cp -r config/Brave-Browser/ ~/.config

# import terminal configs (optional - ensures dark theme and transparancy work out of the box)
cp -r config/terminator/ ~/.config
cp -r config/konsole/ ~/.local/share
cp config/konsolerc ~/.config

# import dashboard configs (optional - ensures dashboard works)
cp -r config/bpytop/ ~/.config
cp -r config/neofetch/ ~/.config
cp bashrc ~/.bashrc
source ~/.bashrc

# Import themes and themed configs
cp -r config/xfce4 ~/.config
cp -r config/gtk-3.0 ~/.config
cp -r config/gtk-4.0 ~/.config
cp config/QtProject.conf ~/.config
sudo cp -r config/Sweet-Dark-v40 /usr/share/themes
cp -r config/copyq ~/.config
cp -r config/galculator ~/.config
cp config/kcalcrc ~/.config
#cp config/krusaderrc ~/.config

#import editor configs - optional
#cp -r config/sublime-text ~/.config 
#cp -r config/Brackets ~/.config

# make scripts executable
chmod +x ~/.config/i3/autostart.sh
chmod +x ~/.config/i3blocks/cpu/cpu_info.sh
chmod +x ~/.config/i3blocks/battery/battery_info.sh
chmod +x ~/.config/i3blocks/weather/weather.sh
chmod +x ~/.config/i3blocks/weather/weather.py
sudo chmod +x ~/scripts/*.sh
