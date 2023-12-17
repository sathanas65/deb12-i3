# firewall
sudo apt install -y ufw
sudo ufw enable

# user directories
xdg-user-dirs-update

# window manager
sudo apt install -y i3

# network manager
sudo apt install -y network-manager-gnome

# Notification Daemon
sudo apt install -y dunst libnotify-bin

# display manager
sudo apt install -y lightdm
sudo systemctl enable lightdm

# display settings
sudo apt install -y arandr

# terminal emulators
sudo apt install -y terminator konsole

# admin web console
sudo apt install -y cockpit

# background manager
sudo apt install -y feh

# app launcher
sudo apt install -y rofi

# appearance managers
sudo apt install -y lxappearance picom 

# settings interface
sudo apt install -y xfce4-settings xfce4-power-manager

# auto numlock
sudo apt install -y numlockx

# file manager
sudo apt install -y thunar

# advanced file manager
sudo apt install -y krusader

# office apps
sudo apt install -y libreoffice

# audio
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa

# enable repos
sudo apt install -y software-properties-common apt-transport-https curl ca-certificates -y
sudo apt-add-repository contrib non-free-firmware -y
sudo apt update && sudo apt upgrade

# non free codecssudo apt install -y dunst libnotify-bin
sudo apt install -y ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi

# disk utilities
sudo apt install -y gnome-disk-utility gsmartcontrol gparted

# gui text editor
sudo apt install -y geany

# terminal apps
sudo apt install -y neofetch htop cmatrix glances figlet

# screenshots
sudo apt install -y maim xclip xdotool copyq

# snap store
sudo apt install -y snapd
sudo snap install -y core

# image editors
sudo apt install -y gimp
sudo snap install -y pinta

# zip utilities
sudo apt install -y tar gzip

# media player
sudo apt install -y vlc 

# backup manager
sudo apt install -y timeshift

# notification daemon
sudo apt install -y dunst libnotify-bin

# gpg encryption manager
sudo apt install -y kleopatra

# password manager
sudo apt install -y keepass2

# brave browser
wget -qO- https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/brave-browser-archive-keyring.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

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

sudo apt update
sudo apt install librewolf -y

# other browsers
sudo apt install -y firefox-esr chromium

# printer support
#sudo apt install -y cups
#sudo systemctl enable cups

# bluetooth support
#sudo apt install -y bluez blueman
#sudo systemctl enable bluetooth

# import dot files
cp -rT ~/deb12-i3/config ~/.config

# signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

sudo apt update && sudo apt install -y signal-desktop

# video editor
# sudo apt install -y kdenlive

# kvm/qemu guest agent
sudo apt install -y spice-vdagent 

# nordvpn
sudo sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
sudo usermod -aG nordvpn $USER
sh ~/deb12-i3/nordconfig.sh

# hypervisor tools
# sudo apt install -y virt-manager cockpit-machines cockpit-podman
# You can access cockpit console from browser at https://127.0.0.1:9090/
# sudo addgroup "$(whoami)" libvirt
# sudo addgroup "$(whoami)" kvm
# sudo usermod -aG libvirt “$(whoami)”
# sudo usermod -aG kvm “$(whoami)”


sudo apt auto-remove -y

sudo reboot now
