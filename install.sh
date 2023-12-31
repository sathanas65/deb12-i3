#!/bin/bash

# firewall
sudo apt install -y ufw
sudo ufw enable

# network manager
sudo apt install -y network-manager-gnome

# appearance managers
sudo apt install -y lxappearance picom 

# file managers
sudo apt install -y thunar
#sudo apt install -y krusader
#sudo apt install -y nautilus

# file search
sudo apt install -y fzf

# list directory (on steroids)
sudo apt install -y exa

# settings interface
sudo apt install -y xfce4-settings xfce4-power-manager

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# terminal emulators
sudo apt install -y terminator konsole tmux

# hardware info
sudo apt install -y procinfo hwinfo hdparm

# audio
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pulseeffects

# terminal apps
sudo apt install -y neofetch htop cmatrix glances figlet calc

# gui system monitor
sudo apt install -y gnome-system-monitor

# apt package manager front end
sudo apt install -y synaptic

# enable repos
sudo apt install -y software-properties-common apt-transport-https curl ca-certificates -y
echo | sudo apt-add-repository contrib non-free-firmware
sudo apt update && sudo apt upgrade -y

sudo -v

# printer support
sudo apt install -y cups
sudo systemctl enable cups

# bluetooth support
sudo apt install -y bluez blueman
sudo systemctl enable bluetooth

# calculator
#sudo apt install -y gnome-calculator
#sudo apt install -y galculator
sudo apt install -y mate-calculator
#sudo apt install -y kcalc

# brave browser ($mod + b) NOT FOSS
# Note that there is a bug where brave fails to in initialize on the 1st launch. After a reboot it will work fine thereafter.
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
sudo apt install -y librewolf

# tor browser
sudo apt install -y torbrowser-launcher 

# other browsers
# Chromium is required for keybind Super + F1 to open nordvpn login page. 
# Or you can edit ~/scripts/nordlogin.sh to use another browser but nord login script fails in Brave and Librewolf, even with shields down.
sudo apt install -y firefox-esr chromium

sudo -v

# background / image manager
sudo apt install -y feh

# app launcher ($mod + Space)
sudo apt install -y rofi

# auto numlock
sudo apt install -y numlockx

# notification daemon (Untested)
sudo apt install -y dunst libnotify-bin

# snap store (Supports installation of containerized apps)
sudo apt install -y snapd
sudo snap install core

# gui text editor
sudo apt install -y geany
# notepad++ (FOSS Windows application, uses Wine to run on Linux) snap run notepad-plus-plus (command to launch)
#sudo snap install notepad-plus-plus 
# brackets
sudo snap install brackets --classic
# sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt-get install -y sublime-text

# system management
# cockpit (admin web console)
sudo apt install -y cockpit
# stacer (useful but abandoned by devs)
#sudo apt install -y stacer

# office apps
sudo apt install -y libreoffice

# display settings
sudo apt install -y arandr

# media player
sudo apt install -y vlc 

# non free codecs
sudo apt install -y ttf-mscorefonts-installer libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly

# disk utilities
sudo apt install -y gnome-disk-utility gsmartcontrol gparted

# clipboard manager
sudo apt install -y copyq

# notes manager
# zim (easy checkbox lists)
sudo apt install zim
# qownnotes (markdown stored as plain text, great features)
#SIGNED_BY='/etc/apt/keyrings/qownnotes.gpg'
#sudo mkdir -p "$(dirname "${SIGNED_BY}")"
#curl --silent --show-error --location http://download.opensuse.org/repositories/home:/pbek:/QOwnNotes/Debian_12/Release.key | gpg --dearmor | sudo tee "${SIGNED_BY}" > /dev/null
#sudo chmod u=rw,go=r "${SIGNED_BY}"

#SIGNED_BY='/etc/apt/keyrings/qownnotes.gpg'
#ARCHITECTURE="$(dpkg --print-architecture)"
#echo "deb [arch=${ARCHITECTURE} signed-by=${SIGNED_BY}] http://download.opensuse.org/repositories/home:/pbek:/QOwnNotes/Debian_12/ /" | sudo tee /etc/apt/sources.list.d/qownnotes.list > /dev/null
#sudo apt update
#sudo apt install qownnotes

# email client
sudo apt install -y geary
#sudo apt install -y evolution
#sudo apt install -y thunderbird

# screenshots
sudo apt install -y maim xclip xdotool

# image editors (gimp is like Adobe Photoshop and pinta is like MS Paint)
sudo apt install -y gimp
sudo snap install pinta

# zip utilities
sudo apt install -y tar gzip

# backup manager
sudo apt install -y timeshift

# remote desktop client
#anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
apt update
apt install -y anydesk

#teamviewer
curl -fSsL https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/teamview.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/teamview.gpg] http://linux.teamviewer.com/deb stable main" | sudo tee /etc/apt/sources.list.d/teamviewer.list
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/teamview.gpg] http://linux.teamviewer.com/deb stable main" | sudo tee /etc/apt/sources.list.d/teamviewer.list
sudo apt install -y teamviewer

# gpg encryption manager
sudo apt install -y kleopatra

# password manager
sudo apt install -y keepass2

# 2fa app
sudo apt install -y gnome-authenticator
#sudo snap install authpass
#sudo snap install authy

# torrent client
sudo apt install -y transmission

# signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

sudo apt update && sudo apt install -y signal-desktop

sudo -v

# screen recorder
sudo apt install -y simplescreenrecorder
#sudo apt install -y kazam

# video editor
sudo apt install -y kdenlive
#sudo apt install -y shotcut
#sudo snap install openshot-community --candidate

# video converter
sudo apt install -y ffmpeg
sudo apt install -y handbrake

# simplified man pages
sudo apt install -y tldr

# kvm/qemu guest agent
sudo apt install -y spice-vdagent 

# hypervisor tools
# sudo apt install -y virt-manager cockpit-machines cockpit-podman distrobox
# You can access cockpit console from browser at https://127.0.0.1:9090/
# sudo addgroup "$(whoami)" libvirt
# sudo addgroup "$(whoami)" kvm
# sudo usermod -aG libvirt “$(whoami)”
# sudo usermod -aG kvm “$(whoami)”

# dev tools
# vscode
#wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
#sudo install -D -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg
#sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
#sudo apt update
#sudo apt install -y code
# vscodium (Free/Libre Open Source Software Binaries of VS Code)
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
    
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt update && sudo apt install -y codium

# pycharm
curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | gpg --dearmor | sudo tee /usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg] http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com any main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null
sudo apt update
sudo apt install -y pycharm-community
# postman
snap install postman
# postman CLI
# curl -o- "https://dl-cli.pstmn.io/install/linux64.sh" | sh

# user directories
xdg-user-dirs-update

# nordvpn
curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh -o nordvpn_install.sh
sh nordvpn_install.sh
sudo usermod -aG nordvpn $USER

# window manager
sudo apt install -y i3

# display manager
sudo apt install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
sudo systemctl enable lightdm

# import scripts and configs for physical device (comment these out if you are installing on vm)
#sh ~/deb12-i3/copyconf.sh

# import scripts and configs for virtual machine guest (comment these out if you are installing on physical hardware)
sh ~/deb12-i3/vm-copyconf.sh
#This makes lightdm set virtual display to 1080p
sudo cp virtual-display.sh /usr/share/virtual-display.sh
sudo cp lightdm.conf /etc/lightdm/lightdm.conf
sudo chmod +x /usr/share/virtual-display.sh

sudo apt update && sudo apt upgrade -y

sudo apt auto-remove -y

sudo reboot now
