
####
# This script is used to copy my config files over for use on reboot of installation.

cd
cd deb12-i3

cp -r config/backgrounds/ ~/.config
cp -r config/i3/ ~/.config
cp -r config/dunst/ ~/.config
cp -r config/terminator/ ~/.config
cp -r config/rofi/ ~/.config
chmod +x ~/.config/i3/autostart.sh
cd ~/.config/i3/
rm barhidden
rm config
cp barhiddenvm barhidden
cp configvm config
rm barhiddenvm
rm configvm