sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get clean
sudo dd if=/dev/zero of=/zerofile bs=1M
sudo rm -f /zerofile
sudo apt-get install qemu-guest-agent -y
sudo systemctl enable qemu-guest-agent
sudo systemctl start qemu-guest-agent
sudo rm -f /etc/ssh/ssh_host_*
sudo rm -f /etc/udev/rules.d/70-persistent-net.rules
sudo truncate -s 0 /etc/machine-id
sudo rm /var/lib/dbus/machine-id /var/lib/dbus/machine-id
history -c && history -w
sudo find /var/log -type f -exec truncate -s 0 {} \;
sudo rm -f ~/.bash_history
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*
sudo shutdown -h now

