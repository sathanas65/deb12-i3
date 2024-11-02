#!/bin/bash
####
# This script is used to copy my config files over for use on reboot of installation.

cp mullvad-browser.7z ~/
7z x ~/mullvad-browser.7z -o"$HOME/mullvad-browser"
rm ~/mullvad-browser.7z
cp mullvad.7z ~/mullvad-browser 
7z x ~/mullvad-browser/mullvad.7z -o"$HOME/mullvad-browser"
rm ~/mullvad-browser/mullvad.7z
cp -r ~/mullvad-browser/ ~/.mullvad-browser
rm -r ~/mullvad-browser/
cp -r ~/libreoffice/ ~/.config/

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

# import browser configs (optional - ensures dark theme and dark reader extension work out of the box)
cp -r config/chromium/ ~/.config
cp -r .mozilla ~
cp -r config/BraveSoftware/ ~/.config

# make scripts executable
chmod +x ~/.config/i3/autostart.sh
chmod +x ~/.config/i3blocks/cpu/cpu_info.sh
chmod +x ~/.config/i3blocks/battery/battery_info.sh
chmod +x ~/.config/i3blocks/weather/weather.sh
chmod +x ~/.config/i3blocks/weather/weather.py
sudo chmod +x ~/scripts/*.sh

# Check if Mirage is installed
if command -v mirage >/dev/null 2>&1; then
    echo "Mirage is installed. Setting it as the default image viewer."

    # Define the Mirage desktop entry file name
    MIRAGE_DESKTOP="mirage.desktop"

    # Set default applications for various image MIME types
    xdg-mime default "$MIRAGE_DESKTOP" image/jpeg
    xdg-mime default "$MIRAGE_DESKTOP" image/png
    xdg-mime default "$MIRAGE_DESKTOP" image/webp
    xdg-mime default "$MIRAGE_DESKTOP" image/gif
    xdg-mime default "$MIRAGE_DESKTOP" image/bmp
    xdg-mime default "$MIRAGE_DESKTOP" image/tiff

    echo "Default image viewer set to Mirage for JPEG, PNG, WebP, GIF, BMP, and TIFF."
else
    echo "Error: Mirage is not installed. Please install Mirage first using 'sudo apt-get install mirage'."
fi

# Check if VLC is installed
if command -v vlc >/dev/null 2>&1; then
    echo "VLC is installed. Setting it as the default media player."

    # Define the VLC desktop entry file name
    VLC_DESKTOP="vlc.desktop"

    # Set default applications for various video MIME types
    xdg-mime default "$VLC_DESKTOP" video/mp4
    xdg-mime default "$VLC_DESKTOP" video/x-matroska
    xdg-mime default "$VLC_DESKTOP" video/x-msvideo
    xdg-mime default "$VLC_DESKTOP" video/x-flv
    xdg-mime default "$VLC_DESKTOP" video/webm

    # Set default applications for various audio MIME types
    xdg-mime default "$VLC_DESKTOP" audio/mpeg
    xdg-mime default "$VLC_DESKTOP" audio/x-wav
    xdg-mime default "$VLC_DESKTOP" audio/x-flac
    xdg-mime default "$VLC_DESKTOP" audio/ogg
    xdg-mime default "$VLC_DESKTOP" audio/mp4

    echo "Default media player set to VLC for common video and audio file types."
else
    echo "Error: VLC is not installed. Please install VLC first using 'sudo apt-get install vlc'."
fi
