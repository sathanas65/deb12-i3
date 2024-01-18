#!/bin/bash

check_status() {
    if [ $? -ne 0 ]; then
        echo "Error: Previous command failed"
    fi
}

# firewall
sudo apt-get install -y ufw
check_status
sudo ufw enable
check_status

sudo apt-get update && sudo apt-get upgrade -y
check_status

# network manager
sudo apt-get install -y network-manager-gnome
check_status

# appearance managers
sudo apt-get install -y lxappearance picom 
check_status

# file managers
sudo apt-get install -y thunar
check_status
#sudo apt-get install -y krusader
#check_status
#sudo apt-get install -y nautilus
#check_status

# file search
sudo apt-get install -y fzf
check_status

# list directory (on steroids)
sudo apt-get install -y exa
check_status

# settings interface
sudo apt-get install -y xfce4-settings xfce4-power-manager
check_status

# Network File Tools/System Events
sudo apt-get install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends
check_status

sudo systemctl enable avahi-daemon
check_status
sudo systemctl enable acpid
check_status

# terminal emulators
# terminator (dot files included)
sudo apt-get install -y terminator
check_status
# kitty (no dot files yet)
#sudo apt-get install -y kitty 
#check_status
# konsole (required for out of box use of:
# Super + Shift + h for keymap and 
# Super + Shift + i for backup and edit i3 config and
# Super + n then s for nordvpn status)
sudo apt-get install -y konsole
check_status

sudo -v

# tmux - terminal multiplexer - runs in terminal and shell sessions run in tmux - excellent features
sudo apt-get install -y tmux
check_status

# hardware info
sudo apt-get install -y procinfo hwinfo hdparm psensor
check_status

# audio
sudo apt-get install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pulseeffects
check_status

# audio editor
#sudo apt-get install -y audacity
#check_status

# terminal apps
sudo apt-get install -y neofetch htop glances figlet calc
check_status
# cmatrix gives you a matrix falling code terminal but crashes i3 in vm - works fine on host system
#sudo apt-get install -y cmatrix

# gui system monitor
sudo apt-get install -y gnome-system-monitor
check_status

# apt-get package manager front end
#sudo apt-get install -y synaptic
#check_status

# enable repos
sudo apt-get install -y software-properties-common apt-transport-https curl ca-certificates -y
check_status
echo | sudo apt-add-repository contrib non-free-firmware
check_status
sudo apt-get update && sudo apt-get upgrade -y
check_status

sudo -v

# create ~/.local/share/applications/ to support executables and snaps in Rofi
mkdir ~/.local/share/applications/
check_status

# printer support
#sudo apt-get install -y cups
#check_status
#sudo systemctl enable cups
#check_status

# bluetooth support
#sudo apt-get install -y bluez blueman
#check_status
#sudo systemctl enable bluetooth
#check_status

sudo -v

# document viewer
#sudo apt-get install -y evince
#check_status
#sudo apt-get install -y okular
#check_status

# ebook reader
#sudo apt-get install -y foliate
#check_status

# calculator
#sudo apt-get install -y gnome-calculator
#check_status
sudo apt-get install -y galculator
check_status
#sudo apt-get install -y mate-calc
#check_status
sudo apt-get install -y kcalc
check_status

# privacy browsers
# brave browser ($mod + b) NOT FOSS
# Note that there is a bug where brave fails to in initialize on the 1st launch. After a reboot it will work fine thereafter.
wget -qO- https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/brave-browser-archive-keyring.gpg > /dev/null
check_status
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
check_status
sudo apt-get update
check_status
sudo apt-get install -y brave-browser
check_status

sudo -v

# librewolf browser
distro=$(if echo "bookworm" | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)
check_status

wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg
check_status

sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF
check_status

sudo apt-get update
check_status
sudo apt-get install -y librewolf
check_status

sudo -v

# tor browser
sudo apt-get install -y torbrowser-launcher 
check_status

sudo -v

# mullvad browser
wget --content-disposition https://mullvad.net/en/download/browser/linux-x86_64/latest -P ~
check_status
# if you get an error that file doesn't exist, change below to match mullvad flename you can see by using ls command
tar -xvf mullvad-browser-linux-x86_64-13.0.7.tar.xz
check_status
cp ~/mullvad-browser/start-mullvad-browser.desktop ~/.local/share/applications/
check_status

sudo -v

# non-privacy browsers
# Chromium is required for keybind Super + F1 to open nordvpn login page. 
# Or you can edit ~/scripts/nordlogin.sh to use another browser but nord login script fails in Brave and Librewolf, even with shields down.
sudo apt-get install -y firefox-esr chromium
check_status

sudo -v

# background / image manager
sudo apt-get install -y feh
check_status

# app launcher ($mod + Space)
sudo apt-get install -y rofi
check_status

# auto numlock
sudo apt-get install -y numlockx
check_status

# notification daemon
sudo apt-get install -y dunst libnotify-bin
check_status
sudo apt-get install -y yad
check_status

# snap store (Supports installation of containerized apps)
sudo apt-get install -y snapd
check_status
sudo snap install core
check_status
# schedule snap updates daily between 2 and 4 am
sudo snap set core refresh.schedule=02:00-04:00
check_status
# schedule snap updates weekly on Sunday between 2 and 4 am
snap set core refresh.schedule=sun,02:00-04:00
check_status

sudo -v

# gui text editor
# doom emacs
#sudo apt-get install -y emacs-gtk ripgrep
#check_status
#rm -rf /home/$USER/.emacs.d/
#check_status
#git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
#yes | .emacs.d/bin/doom install
#check_status

#sudo -v

# geany
sudo apt-get install -y geany
check_status
# brackets
#sudo snap install brackets --classic
#check_status
#sudo cp /var/lib/snapd/desktop/applications/brackets_brackets.desktop ~/.local/share/applications/
#check_status

sudo -v

# sublime text
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
#check_status
#echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#check_status
#sudo apt-get update
#check_status
#sudo apt-get install -y sublime-text
#check_status

#sudo -v

# system management
# cockpit (admin web console)
sudo apt-get install -y cockpit
check_status
# stacer (useful but abandoned by devs)
#sudo apt-get install -y stacer

sudo -v

# office apps
#sudo apt-get install -y libreoffice
#check_status

#sudo -v

# display settings
#sudo apt-get install -y arandr
#check_status

# media player
sudo apt-get install -y vlc 
check_status

# non free codecs
sudo apt-get install -y ttf-mscorefonts-installer libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly
check_status

# disk utilities
#sudo apt-get install -y gnome-disk-utility gsmartcontrol gparted
#check_status

# clipboard manager
sudo apt-get install -y copyq
check_status

sudo -v

# notes manager
# zim (easy checkbox lists)
sudo apt-get install -y zim
check_status

sudo -v

# qownnotes (markdown stored as plain text, great features)
#SIGNED_BY='/etc/apt/keyrings/qownnotes.gpg'
#check_status
#sudo mkdir -p "$(dirname "${SIGNED_BY}")"
#check_status
#curl --silent --show-error --location http://download.opensuse.org/repositories/home:/pbek:/QOwnNotes/Debian_12/Release.key | gpg --dearmor | sudo tee "${SIGNED_BY}" > /dev/null
#check_status
#sudo chmod u=rw,go=r "${SIGNED_BY}"
#check_status

#SIGNED_BY='/etc/apt/keyrings/qownnotes.gpg'
#ARCHITECTURE="$(dpkg --print-architecture)"
#check_status
#echo "deb [arch=${ARCHITECTURE} signed-by=${SIGNED_BY}] http://download.opensuse.org/repositories/home:/pbek:/QOwnNotes/Debian_12/ /" | sudo tee /etc/apt/sources.list.d/qownnotes.list > /dev/null
#check_status
#sudo apt-get update
#check_status
#sudo apt-get install -y qownnotes
#check_status

#sudo -v

# email client
#sudo apt-get install -y geary
#check_status

#sudo -v

#sudo apt-get install -y evolution
#check_status

#sudo -v

#sudo apt-get install -y thunderbird
#check_status

#sudo -v

# screenshots
sudo apt-get install -y maim xclip xdotool jq
check_status

# image editors (gimp is like Adobe Photoshop and pinta is like MS Paint)
#sudo apt-get install -y gimp
#check_status

#sudo -v

#sudo snap install pinta
#check_status
#sudo cp /var/lib/snapd/desktop/applications/pinta_pinta.desktop ~/.local/share/applications/
#check_status

#sudo -v

# zip utilities
sudo apt-get install -y tar gzip
check_status

# backup manager
# timeshit gui front end for rsync
#sudo apt-get install -y timeshift
#check_status
# duplicity - great CLI for cloud backup - supported by backblaze B2
#sudo apt-get install -y duplicity
#check_status

#sudo -v

# remote desktop client
#anydesk
sudo apt-get install software-properties-common apt-transport-https dirmngr ca-certificates curl -y
check_status

curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo gpg --dearmor | sudo tee /usr/share/keyrings/anydesk.gpg > /dev/null
check_status
echo 'deb [signed-by=/usr/share/keyrings/anydesk.gpg] http://deb.anydesk.com/ all main' | sudo tee /etc/apt/sources.list.d/anydesk.list
check_status

wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" sudo tee /etc/apt/sources.list.d/anydesk-stable.list
check_status
sudo apt-get update
check_status
sudo apt-get install -y anydesk
check_status

sudo -v

#teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
check_status
sudo dpkg -i teamviewer_amd64.deb || sudo apt --fix-broken install -y
check_status
rm teamviewer_amd64.deb
check_status

#curl -fSsL https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/teamview.gpg > /dev/null
#echo "deb [arch=amd64 signed-by=/usr/share/keyrings/teamview.gpg] http://linux.teamviewer.com/deb stable main" | sudo tee /etc/apt/sources.list.d/teamviewer.list
#sudo apt-get install -y teamviewer

sudo -v

# ftp server utility (best installed on server)
#sudo apt-get install -y vsftpd
#check_status
#sudo ufw allow OpenSSH
#check_status
#sudo ufw allow 20:21/tcp
#check_status
#sudo ufw allow 20000:25000/tcp
#check_status
# ftp client (midnight commander)
sudo apt-get install -y mc
check_status

sudo -v

# gpg encryption manager
#sudo apt-get install -y kleopatra
#check_status

#sudo -v

# password manager
# keepass2 - mobile version but no syncing - passwords only stored locally - supports local database file syncing so you can manually sync devices by export/import of database
#sudo apt-get install -y keepass2
#check_status
# bitwarden - NOT FOSS - great feautures - syncs across devices - passwords stored in cloud
#sudo snap install bitwarden
#check_status

#sudo cp /var/lib/snapd/desktop/applications/bitwarden_bitwarden.desktop ~/.local/share/applications/
#check_status

#sudo -v

# 2fa app
#sudo apt-get install libpam-google-authenticator
#check_status
#sudo snap install authpass
#check_status
#sudo cp /var/lib/snapd/desktop/applications/authpass_authpass.desktop ~/.local/share/applications/
#check_status

#sudo -v

# torrent client
#sudo apt-get install -y transmission
#check_status

#sudo -v

# signal
#wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
#check_status
#cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
#check_status
#echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
#  sudo tee /etc/apt/sources.list.d/signal-xenial.list
#check_status

#sudo apt-get update && sudo apt-get install -y signal-desktop
#check_status

#sudo -v

# screen recorder
#sudo apt-get install -y simplescreenrecorder
#check_status
#sudo apt-get install -y kazam
#check_status

#sudo -v

# video editor
#sudo apt-get install -y kdenlive
#check_status

#sudo -v

#sudo apt-get install -y shotcut
#check_status

#sudo -v

#sudo snap install openshot-community --candidate
#check_status
#sudo cp /var/lib/snapd/desktop/applications/openshot-community_openshot-community.desktop ~/.local/share/applications/
#check_status

#sudo -v

# video converter
#sudo apt-get install -y ffmpeg
#check_status
#sudo apt-get install -y handbrake
#check_status

#sudo -v

# youtube downloader
#sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
#check_status
#sudo chmod a+rx /usr/local/bin/youtube-dl
#check_status

# simplified man pages
sudo apt-get install -y tldr
check_status

# dev tools
# vscode
#wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
#sudo install -D -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg
#sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
#sudo apt-get update
#sudo apt-get install -y code

sudo -v

# vscodium (Free/Libre Open Source Software Binaries of VS Code)
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
check_status
    
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
check_status

sudo apt-get update && sudo apt-get install -y codium
check_status

sudo -v

# pycharm
curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | gpg --dearmor | sudo tee /usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg > /dev/null
check_status
echo "deb [signed-by=/usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg] http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com any main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null
check_status
sudo apt-get update
check_status
sudo apt-get install -y pycharm-community
check_status

sudo -v

# user directories
xdg-user-dirs-update
check_status

sudo -v

# nordvpn (i3 keybinds, autostart and scripts are included so no setup required)
#curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh -o nordvpn_install.sh
#check_status
#sh nordvpn_install.sh
#check_status
#sudo usermod -aG nordvpn $USER
#check_status

#sudo -v

# mullvad vpn (i3 keybinds, autostart and scripts are not included so requires manual setup)
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
check_status
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
check_status
sudo apt-get update
check_status
sudo apt-get install -y mullvad-vpn
check_status

sudo -v

# personal finance
sudo mkdir /var/lib/snapd/snap
check_status
sudo mkdir /var/lib/snapd/snap/bin
check_status
sudo snap install denaro
check_status
sudo cp /var/lib/snapd/desktop/applications/denaro_denaro.desktop ~/.local/share/applications/
check_status

sudo -v

# postman
sudo snap install postman
check_status
sudo cp /var/lib/snapd/desktop/applications/postman_postman.desktop ~/.local/share/applications/
check_status
# postman CLI
curl -o- "https://dl-cli.pstmn.io/install/linux64.sh" | sh
check_status

sudo -v

sudo apt-get install -y flatpak
check_status
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
check_status

# kvm/qemu guest agent  YOU WANT THIS IF installing as kvm-qemu guest vm
sudo apt-get install -y spice-vdagent 
check_status

sudo -v

# hypervisor tools
# sudo apt-get install -y virt-manager cockpit-machines cockpit-podman distrobox
#check_status
# You can access cockpit console from browser at https://127.0.0.1:9090/
# sudo addgroup "$(whoami)" libvirt
#check_status
# sudo addgroup "$(whoami)" kvm
#check_status
# sudo usermod -aG libvirt “$(whoami)”
#check_status
# sudo usermod -aG kvm “$(whoami)”
#check_status

#sudo -v

# window manager
sudo apt-get install -y i3
check_status

sudo -v

# display manager
sudo apt-get install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
check_status

# import scripts and configs
sh ~/deb12-i3/copyconf.sh
check_status

#This makes lightdm set display to 1080p - YOU MUST modify display.sh value "Virtual-1" if installing on bare metal or possibly anything other than kvm-qemu guest vm
#Physical display outputs are HDMI-0, VGA-0, DP-0, DVD-D-0, HDMI-1, etc.
sudo cp deb12-i3/display.sh /usr/share/display.sh
check_status
sudo chown root:root /usr/share/display.sh
check_status
sudo chmod 775 /usr/share/display.sh
check_status
sudo cp deb12-i3/background.png /usr/share/background.png
check_status
sudo chown root:root /usr/share/background.png
check_status
sudo chmod 644 /usr/share/background.png
check_status
sudo cp deb12-i3/01_debian.conf /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf
check_status
sudo chown root:root /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf
check_status
sudo chmod 644 /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf
check_status
sudo cp deb12-i3/lightdm.conf /etc/lightdm/lightdm.conf
check_status
sudo chown root:root /etc/lightdm/lightdm.conf
check_status
sudo chmod 644 /etc/lightdm/lightdm.conf
check_status

sudo systemctl enable lightdm
check_status

echo 'user ALL=(ALL) NOPASSWD: /usr/sbin/ufw status' | sudo tee /etc/sudoers.d/ufw-status
check_status
sudo chmod 0440 /etc/sudoers.d/ufw-status
check_status

sudo apt-get update && sudo apt-get upgrade -y
check_status

sudo apt-get auto-remove -y
check_status

sudo reboot now
