# firewall
sudo apt install -y ufw
sudo ufw enable
read -p "Press any key to continue..."
-n1 -s

# user directories
xdg-user-dirs-update
read -p "Press any key to continue..."
-n1 -s

# window manager
sudo apt install -y i3
read -p "Press any key to continue..."
-n1 -s

# network manager
sudo apt install -y network-manager-gnome
read -p "Press any key to continue..."
-n1 -s

# Notification Daemon
sudo apt install -y dunst libnotify-bin
read -p "Press any key to continue..."
-n1 -s

# display manager
sudo apt install -y lightdm
sudo systemctl enable lightdm
read -p "Press any key to continue..."
-n1 -s

# display settings
sudo apt install -y arandr
read -p "Press any key to continue..."
-n1 -s

# terminal emulators
sudo apt install -y terminator konsole
read -p "Press any key to continue..."
-n1 -s

# admin web console
sudo apt install -y cockpit
read -p "Press any key to continue..."
-n1 -s

# background manager
sudo apt install -y feh
read -p "Press any key to continue..."
-n1 -s

# app launcher
sudo apt install -y rofi
read -p "Press any key to continue..."
-n1 -s

# appearance managers
sudo apt install -y lxappearance picom 
read -p "Press any key to continue..."
-n1 -s

# settings interface
sudo apt install -y xfce4-settings xfce4-power-manager
read -p "Press any key to continue..."
-n1 -s

# auto numlock
sudo apt install -y numlockx
read -p "Press any key to continue..."
-n1 -s

# file manager
sudo apt install -y thunar
read -p "Press any key to continue..."
-n1 -s

# advanced file manager
sudo apt install -y krusader
read -p "Press any key to continue..."
-n1 -s

# office apps
sudo apt install -y libreoffice
read -p "Press any key to continue..."
-n1 -s

# audio
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa
read -p "Press any key to continue..."
-n1 -s

# enable repos
sudo apt install -y software-properties-common apt-transport-https curl ca-certificates -y
sudo apt-add-repository contrib non-free-firmware -y
sudo apt update && sudo apt upgrade
read -p "Press any key to continue..."
-n1 -s

# non free codecs
sudo apt install -y ttf-mscorefonts-installer libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi
read -p "Press any key to continue..."
-n1 -s

# disk utilities
sudo apt install -y gnome-disk-utility gsmartcontrol gparted
read -p "Press any key to continue..."
-n1 -s

# gui text editor
sudo apt install -y geany
read -p "Press any key to continue..."
-n1 -s

# terminal apps
sudo apt install -y neofetch htop cmatrix glances figlet
read -p "Press any key to continue..."
-n1 -s

# screenshots
sudo apt install -y maim xclip xdotool copyq
read -p "Press any key to continue..."
-n1 -s

# snap store
sudo apt install -y snapd
sudo snap install -y core
read -p "Press any key to continue..."
-n1 -s

# image editors
sudo apt install -y gimp
sudo snap install -y pinta

# zip utilities
sudo apt install -y tar gzip
read -p "Press any key to continue..."
-n1 -s

# media player
sudo apt install -y vlc 
read -p "Press any key to continue..."
-n1 -s

# backup manager
sudo apt install -y timeshift
read -p "Press any key to continue..."
-n1 -s

# notification daemon
sudo apt install -y dunst libnotify-bin
read -p "Press any key to continue..."
-n1 -s

# gpg encryption manager
sudo apt install -y kleopatra
read -p "Press any key to continue..."
-n1 -s

# password manager
sudo apt install -y keepass2
read -p "Press any key to continue..."
-n1 -s

# brave browser
wget -qO- https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/brave-browser-archive-keyring.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
read -p "Press any key to continue..."
-n1 -s
sudo apt update
read -p "Press any key to continue..."
-n1 -s
sudo apt install -y brave-browser
read -p "Press any key to continue..."
-n1 -s

# librewolf browser
distro=$(if echo "bookworm" | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)

wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

read -p "Press any key to continue..."
-n1 -s

sudo apt update
sudo apt install librewolf -y

read -p "Press any key to continue..."
-n1 -s

# other browsers
sudo apt install -y firefox-esr chromium
read -p "Press any key to continue..."
-n1 -s

# printer support
#sudo apt install -y cups
#sudo systemctl enable cups

# bluetooth support
#sudo apt install -y bluez blueman
#sudo systemctl enable bluetooth

# import dot files
cp -rT ~/deb12-i3/config ~/.config
read -p "Press any key to continue..."
-n1 -s

# signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

read -p "Press any key to continue..."
-n1 -s

sudo apt update && sudo apt install -y signal-desktop

read -p "Press any key to continue..."
-n1 -s

# video editor
# sudo apt install -y kdenlive

# kvm/qemu guest agent
sudo apt install -y spice-vdagent
read -p "Press any key to continue..."
-n1 -s

# nordvpn
sudo sh <\(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh\)
read -p "Press any key to continue..."
-n1 -s
sudo usermod -aG nordvpn $USER
read -p "Press any key to continue..."
-n1 -s
sh ~/deb12-i3/nordconfig.sh
read -p "Press any key to continue..."
-n1 -s

# hypervisor tools
# sudo apt install -y virt-manager cockpit-machines cockpit-podman
# You can access cockpit console from browser at https://127.0.0.1:9090/
# sudo addgroup "$(whoami)" libvirt
# sudo addgroup "$(whoami)" kvm
# sudo usermod -aG libvirt “$(whoami)”
# sudo usermod -aG kvm “$(whoami)”


sudo apt auto-remove -y

sudo reboot now
