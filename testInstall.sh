#!/bin/bash

# on error continue
set +e

# reset sudo clock every 60 seconds so you only have to enter password once
while true; do
    sudo -v
    sleep 60
done &

# firewall
sudo apt-get install -y ufw
sudo ufw enable

sudo apt-get update && sudo apt-get upgrade -y

# network manager
sudo apt-get install -y network-manager-gnome

# appearance managers
sudo apt-get install -y lxappearance picom 

# file managers
sudo apt-get install -y nemo
#sudo apt-get install -y thunar
#sudo apt-get install -y krusader
#sudo apt-get install -y nautilus

# terminal file search
#sudo apt-get install -y fzf

# terminal list directory (on steroids)
#sudo apt-get install -y exa

# settings interface
sudo apt-get install -y xfce4-settings xfce4-power-manager

# Network File Tools/System Events
sudo apt-get install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# terminal emulators
# terminator (dot files included)
sudo apt-get install -y terminator
# kitty (no dot files yet)
#sudo apt-get install -y kitty 
# konsole (required for out of box use of:
# Super + Shift + h for keymap and 
# Super + Shift + i for backup and edit i3 config and
# Super + n then s for nordvpn status)
sudo apt-get install -y konsole

# tmux - terminal multiplexer - runs in terminal and shell sessions run in tmux - excellent features
sudo apt-get install -y tmux

# hardware info
sudo apt-get install -y procinfo hwinfo hdparm lm-sensors psensor

# audio
sudo apt-get install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pulseeffects

# audio editor
#sudo apt-get install -y audacity

# terminal apps  
# leave these or the dashboard won't work, can disable dashboard in i3 workspace config
sudo apt-get install -y neofetch bpytop cmatrix
# these can be removed if you don't want them
sudo apt-get install -y htop glances figlet calc

# gui system monitor
sudo apt-get install -y gnome-system-monitor

# apt-get package manager front end
#sudo apt-get install -y synaptic

# enable non-free repos
sudo apt-get install -y software-properties-common apt-transport-https curl ca-certificates -y
echo | sudo apt-add-repository contrib non-free-firmware
sudo apt-get update && sudo apt-get upgrade -y

# create ~/.local/share/applications/ to support executables and snaps in Rofi
mkdir ~/.local/share/applications/

# printer support
#sudo apt-get install -y cups
#sudo systemctl enable cups

# bluetooth support
#sudo apt-get install -y bluez blueman
#sudo systemctl enable bluetooth

# document viewer
#sudo apt-get install -y evince
#sudo apt-get install -y okular

# ebook reader
#sudo apt-get install -y foliate

# comic reader
#sudo apt-get install -y mcomix

# calculator
#sudo apt-get install -y gnome-calculator
sudo apt-get install -y galculator

#sudo apt-get install -y mate-calc
#sudo apt-get install -y kcalc

# privacy browsers
# brave browser ($mod + b) NOT FOSS
# Note that there is a bug where brave fails to in initialize on the 1st launch. After a reboot it will work fine thereafter.
#wget -qO- https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/brave-browser-archive-keyring.gpg > /dev/null
#echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
#sudo apt-get update
#sudo apt-get install -y brave-browser

# librewolf browser
sudo apt-get update && sudo apt-get install extrepo -y
sudo extrepo enable librewolf
sudo apt-get update && sudo apt-get install librewolf -y

# tor browser
#sudo apt-get install -y torbrowser-launcher 

# mullvad browser
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
sudo apt-get update
sudo apt-get install mullvad-browser
#cp ~/mullvad-browser/start-mullvad-browser.desktop ~/.local/share/applications/

# non-privacy browsers
# Chromium is required for keybind Super + F1 to open nordvpn login page. 
# Or you can edit ~/scripts/nordlogin.sh to use another browser but nord login script fails in Brave and Librewolf, even with shields down.
#sudo apt-get install -y firefox-esr chromium

# background / image manager
sudo apt-get install -y feh

# image viewer
sudo apt-get install -y mirage

# app launcher ($mod + Space)
sudo apt-get install -y rofi

# auto numlock
sudo apt-get install -y numlockx

# notification daemon
sudo apt-get install -y dunst libnotify-bin

# user dialog
sudo apt-get install -y yad

# snap store (Supports installation of containerized apps)
sudo apt-get install -y snapd
sudo snap install core
# schedule snap updates weekly on Sunday between 2 and 4 am
sudo snap set core refresh.schedule=02:00-04:00

# gui text editor
# doom emacs - the geek is real but takes forever to install and is more than most people need
#sudo apt-get install -y emacs-gtk ripgrep
#rm -rf /home/$USER/.emacs.d/
#git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
#yes | .emacs.d/bin/doom install

# geany
sudo apt-get install -y geany

# sublime text (NOT FOSS)
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
#echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#sudo apt-get update
#sudo apt-get install -y sublime-text

# system management
# cockpit (admin web console)
#sudo apt-get install -y cockpit

# stacer (useful but abandoned by devs)
#sudo apt-get install -y stacer

# office apps
#sudo apt-get install -y libreoffice

# display settings
#sudo apt-get install -y arandr

# media player
sudo apt-get install -y vlc 

# non free codecs (NOT FOSS)
sudo apt-get install -y ttf-mscorefonts-installer libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly

# disk utilities
#sudo apt-get install -y gnome-disk-utility gsmartcontrol gparted

# clipboard manager
sudo apt-get install -y copyq

# notes manager
# zim (easy checkbox lists and much more)
#sudo apt-get install -y zim

# qownnotes (markdown stored as plain text, great features)
#SIGNED_BY='/etc/apt/keyrings/qownnotes.gpg'
#sudo mkdir -p "$(dirname "${SIGNED_BY}")"
#curl --silent --show-error --location http://download.opensuse.org/repositories/home:/pbek:/QOwnNotes/Debian_12/Release.key | gpg --dearmor | sudo tee "${SIGNED_BY}" > /dev/null
#sudo chmod u=rw,go=r "${SIGNED_BY}"
#SIGNED_BY='/etc/apt/keyrings/qownnotes.gpg'
#ARCHITECTURE="$(dpkg --print-architecture)"
#echo "deb [arch=${ARCHITECTURE} signed-by=${SIGNED_BY}] http://download.opensuse.org/repositories/home:/pbek:/QOwnNotes/Debian_12/ /" | sudo tee /etc/apt/sources.list.d/qownnotes.list > /dev/null
#sudo apt-get update
#sudo apt-get install -y qownnotes

# email client
#sudo apt-get install -y geary
#sudo apt-get install -y evolution
#sudo apt-get install -y thunderbird

# screenshots
sudo apt-get install -y maim xclip xdotool jq

# image editors (gimp is like Adobe Photoshop and pinta is like MS Paint)
#sudo apt-get install -y gimp

#sudo snap install pinta
#sudo cp /var/lib/snapd/desktop/applications/pinta_pinta.desktop ~/.local/share/applications/

# zip utilities
sudo apt-get install -y tar gzip

# backup manager
# timeshit gui front end for rsync
#sudo apt-get install -y timeshift
# duplicity - great CLI for cloud backup - supported by backblaze B2
#sudo apt-get install -y duplicity

# remote desktop client 
#anydesk (NOT FOSS)
#sudo apt-get install software-properties-common apt-transport-https dirmngr ca-certificates curl -y
#curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo gpg --dearmor | sudo tee /usr/share/keyrings/anydesk.gpg > /dev/null
#echo 'deb [signed-by=/usr/share/keyrings/anydesk.gpg] http://deb.anydesk.com/ all main' | sudo tee /etc/apt/sources.list.d/anydesk.list
#wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
#echo "deb http://deb.anydesk.com/ all main" sudo tee /etc/apt/sources.list.d/anydesk-stable.list
#sudo apt-get update
#sudo apt-get install -y anydesk

#teamviewer (NOT FOSS)
#sudo apt-get install -y policykit-1
#wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
#sudo dpkg -i teamviewer_amd64.deb || sudo apt --fix-broken install -y
#rm teamviewer_amd64.deb

# ftp server utility (best installed on server)
#sudo apt-get install -y vsftpd
#sudo ufw allow OpenSSH
#sudo ufw allow 20:21/tcp
#sudo ufw allow 20000:25000/tcp
# ftp client (midnight commander)
#sudo apt-get install -y mc

# gpg encryption manager
#sudo apt-get install -y kleopatra

# password manager
# keepass2 - mobile version but no syncing - passwords only stored locally - supports local database file syncing so you can manually sync devices by export/import of database
#sudo apt-get install -y keepass2

# bitwarden - (NOT FOSS) - great feautures - syncs across devices - passwords stored in cloud
#sudo snap install bitwarden
#sudo cp /var/lib/snapd/desktop/applications/bitwarden_bitwarden.desktop ~/.local/share/applications/

# 2fa app
# Google Authenticator (NOT FOSS)
#sudo apt-get install -y libpam-google-authenticator 
# Authpass
#sudo snap install authpass
#sudo cp /var/lib/snapd/desktop/applications/authpass_authpass.desktop ~/.local/share/applications/

# torrent client
#sudo apt-get install -y transmission

# signal encrypted messaging
#wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
#cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
#echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
#  sudo tee /etc/apt/sources.list.d/signal-xenial.list
#sudo apt-get update && sudo apt-get install -y signal-desktop

# screen recorder
#sudo apt-get install -y simplescreenrecorder
#sudo apt-get install -y kazam

# video editor
#sudo apt-get install -y kdenlive
#sudo apt-get install -y shotcut
#sudo snap install openshot-community --candidate
#sudo cp /var/lib/snapd/desktop/applications/openshot-community_openshot-community.desktop ~/.local/share/applications/

# video converter
#sudo apt-get install -y ffmpeg
#sudo apt-get install -y handbrake

# youtube downloader
#sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
#sudo chmod a+rx /usr/local/bin/youtube-dl

# simplified man pages
#sudo apt-get install -y tldr

# dev tools
# vscode ide (NOT FOSS)
#wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
#sudo install -D -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg
#sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
#sudo apt-get update
#sudo apt-get install -y code

# vscodium (Free/Libre Open Source Software Binaries of VS Code ide)
#wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
#    | gpg --dearmor \
#    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg 
#echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
#    | sudo tee /etc/apt/sources.list.d/vscodium.list
#sudo apt-get update && sudo apt-get install -y codium

# pycharm ide
#curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | gpg --dearmor | sudo tee /usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg > /dev/null
#echo "deb [signed-by=/usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg] http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com any main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null
#sudo apt-get update
#sudo apt-get install -y pycharm-community

# user directories (disable this if you want many things to not work. There will be weeping and gnashing of teeth)
xdg-user-dirs-update

# nordvpn (NOT FOSS)
# (i3 keybinds, autostart and scripts are included so no setup required. Will likely switch to mullvad soon)
#curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh -o nordvpn_install.sh
#sh nordvpn_install.sh
#sudo usermod -aG nordvpn $USER

# mullvad vpn (NOT FOSS)
# (i3 keybinds, autostart and scripts are not included so requires manual setup)
#sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
#echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
#sudo apt-get update
#sudo apt-get install -y mullvad-vpn

# personal finance
#sudo mkdir /var/lib/snapd/snap
#sudo mkdir /var/lib/snapd/snap/bin
#sudo snap install denaro
#sudo cp /var/lib/snapd/desktop/applications/denaro_denaro.desktop ~/.local/share/applications/

# postman API platform (NOT FOSS)
#sudo snap install postman
#sudo cp /var/lib/snapd/desktop/applications/postman_postman.desktop ~/.local/share/applications/
# postman CLI
#curl -o- "https://dl-cli.pstmn.io/install/linux64.sh" | sh

# bleachbit file shredder
#sudo apt-get -y install bleachbit

# Flatpak containerized apps platform
#sudo apt-get install -y flatpak
#sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# These are required for the theme and icons to work and i3bar to display correctly
sudo apt-get install -y libgtk-4-dev
sudo apt-get install -y fonts-noto-color-emoji 
git clone https://github.com/EliverLara/candy-icons

# kvm/qemu guest agent  YOU WANT THIS IF installing as kvm-qemu guest vm
sudo apt-get install -y spice-vdagent 

### hypervisor tools

# kvm/qemu (type 1 HV)
#sudo apt-get install -y virt-manager cockpit-machines cockpit-podman distrobox
# You can access cockpit console from browser at https://127.0.0.1:9090/
#sudo addgroup libvirt
#sudo addgroup kvm
#sudo usermod -aG libvirt $(whoami)
#sudo usermod -aG kvm $(whoami)

# virtualbox (type 2 HV)
#wget -O- -q https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmour -o /usr/share/keyrings/oracle_vbox_2016.gpg
#echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle_vbox_2016.gpg] http://download.virtualbox.org/virtualbox/debian bookworm contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
#sudo apt update
#sudo apt-get install -y virtualbox-7.0
# virtualbox extension pack
#wget https://download.virtualbox.org/virtualbox/7.0.10/Oracle_VM_VirtualBox_Extension_Pack-7.0.10.vbox-extpack
#echo y | sudo vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-7.0.10.vbox-extpack
#sudo usermod -a -G vboxusers $USER

### graphical user interface

# window manager
sudo apt-get install -y i3 i3blocks acpi-support

# display manager
sudo apt-get install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings


# import scripts and configs
sh ~/deb12-i3/copyconf.sh

# This makes lightdm greeter login screen set display to 1080p on kvm-qemu guest vm and sets the background for the login screen - 
# Keep these commented if installing on hardware. After first boot, you can modify display.sh value "Virtual-1" to your display output
# Get display outputs with $  xarandr -q
# Physical display outputs are HDMI-0, VGA-0, DP-0, DVI-D-0, HDMI-1, etc.
sudo cp deb12-i3/display.sh /usr/share/display.sh
sudo chown root:root /usr/share/display.sh
sudo chmod 775 /usr/share/display.sh
sudo cp deb12-i3/background.png /usr/share/background.png
sudo chown root:root /usr/share/background.png
sudo chmod 644 /usr/share/background.png
sudo cp deb12-i3/01_debian.conf /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf
sudo chown root:root /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf
sudo chmod 644 /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf
sudo cp deb12-i3/lightdm.conf /etc/lightdm/lightdm.conf
sudo chown root:root /etc/lightdm/lightdm.conf
sudo chmod 644 /etc/lightdm/lightdm.conf

sudo systemctl enable lightdm

# This allows checking firewall status without password - used in firewall scripts
echo "user ALL=(ALL) NOPASSWD: /usr/sbin/ufw status" | sudo tee /etc/sudoers.d/ufw-status
#sudo tee /etc/sudoers.d/ufw-status <<EOF
#user ALL=(ALL) NOPASSWD: /usr/sbin/ufw status
#EOF

sudo chmod 0440 /etc/sudoers.d/ufw-status

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get auto-remove -y

sudo reboot now
