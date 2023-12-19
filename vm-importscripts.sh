cp ~/deb12-i3/nordconnect.sh ~/nordconnect.sh
cp ~/deb12-i3/norddouble.sh ~/norddouble.sh
cp ~/deb12-i3/nordpause.sh ~/nordpause.sh
cp ~/deb12-i3/nordpnp.sh ~/nordpnp.sh
cp ~/deb12-i3/nordresume.sh ~/nordresume.sh
cp ~/deb12-i3/i3config.sh ~/i3config.sh
cp ~/deb12-i3/keymap.txt ~/keymap.txt

## This makes lightdm set virtual display to 1080p
sudo cp ~/deb12-i3/virtual-display.sh /usr/share/virtual-display.sh
sudo cp ~/deb12-i3/lightdm.conf /etc/lightdm/lightdm.conf
sudo chmod +x /usr/share/virtual-display.sh
sudo chmod +x /etc/lightdm/lightdm.conf

## This adds scripts to toggle between single and dual 1080p virtual displays (Super+u for single, Super+y for dual)
cp ~/deb12-i3/vm-dual-display.sh ~/vm-dual-display.sh
cp ~/deb12-i3/vm-single-display.sh ~/vm-single-display.sh
