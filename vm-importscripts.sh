
cd
cd ~/deb12-i3
cp nordconnect.sh ~/nordconnect.sh
chmod +x ~/nordconnect.sh
cp norddouble.sh ~/norddouble.sh
chmod +x ~/norddouble.sh
cp nordpause.sh ~/nordpause.sh
chmod +x ~/nordpause.sh
cp nordpnp.sh ~/nordpnp.sh
chmod +x ~/nordpnp.sh
cp nordresume.sh ~/nordresume.sh
chmod +x ~/nordresume.sh
cp i3config.sh ~/i3config.sh
chmod +x ~/i3config.sh
cp keymap.txt ~/keymap.txt
cp help.sh ~/help.sh
chmod +x ~/help.sh
cp background.sh ~/background.sh
chmod +x ~/background.sh
cp togglebar.sh ~/togglebar.sh
chmod +x ~/togglebar.sh

## This makes lightdm set virtual display to 1080p
sudo cp virtual-display.sh /usr/share/virtual-display.sh
sudo cp lightdm.conf /etc/lightdm/lightdm.conf
sudo chmod +x /usr/share/virtual-display.sh

## This adds scripts to toggle between single and dual 1080p virtual displays (Super+u for single, Super+y for dual)
cp vm-dual-display.sh ~/vm-dual-display.sh
chmod +x ~/vm-dual-display.sh
cp vm-single-display.sh ~/vm-single-display.sh
chmod +x ~/vm-single-display.sh
