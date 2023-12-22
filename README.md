How to use these scripts:

1. Install Debian 12 but do not install any desktop environment. Only 'Standard Utilities' Should be selected during installation.
2. If you are installing on a device with wifi, it is easiest to use an ethernet connection during installation. 
   If you can't do that, you will need to edit /etc/network/interfaces after install or the network manager applet will show your
   wifi interface as unmanaged and you won't be able to connect to other networks, though the network you connected to during install
   will still work. If you do connect with wifi during installation, here are the post install steps to enable network manager to manage
   your wifi adapter:
   
     a) Open a terminal with Super + Enter and enter the following command:
   
        cd /etc/network
   
     b) Then enter:
   
         cp interfaces interfaces.backup
      This is a backup in case something gets messed up.
   
     c) Then enter:

         sudo nano interfaces
   
     d) Enter your password when prompted.
   
     e) Below the row '# The primary network interface' you will see something like 'allow-hotplug w1p3s0'. Leave this line, but delete
        or comment out everything below it, starting with 'iface'.
   
     f) Ctrl + s to save and ctrl + x to exit.
   
     g) Now enter:

         sudo systemctl restart networking
   
     h) Enter your password when prompted. Now you should be able to manage your wifi comnnections from the applet on the i3 taskbar.
   
     i) If something goes wrong here are the steps to revert:
   Enter:
   
         cd /etc/network
   Then enter:

         sudo rm interfaces
   
   Then enter:

         sudo cp interfaces.backup interfaces
   Finally, enter:
   
         sudo systemctl restart networking
   
3. Once your Debian 12 install is complete, login with your username and password.
4. Enter:

         sudo apt install -y git
   Enter your password when prompted. 
5. Then enter:

         git clone https://github.com/sathanas65/deb12-i3
6. Then enter:

         cd deb12-i3
7. Then enter:

         nano install.sh
8. Now you can review and edit the main install script. You can comment out lines by putting a hash(#) before them, and then they will not run.
9. By default, the options for installing as a kvm/qemu guest virtual machine are already selected. If you will be installing on a physical computer
    then you will need to comment out the following lines:
    
    a) 'sudo apt install -y spice-vdagent' on line 153
    
    b) 'sh ~/deb12-i3/vm-copyconf.sh' on line 182
    
    c) 'sudo cp virtual-display.sh /usr/share/virtual-display.sh' on line 184
    
    d) 'sudo cp lightdm.conf /etc/lightdm/lightdm.conf' on line 185
    
    e) 'sudo chmod +x /usr/share/virtual-display.sh' on line 186
    
    Then you will need to uncomment '#sh ~/deb12-i3/copyconf.sh' on line 179. Then Ctrl + s to save.
    
10. Once you are done selecting or deselecting packages to you liking, or adding some of your own, Ctrl + s to save & Ctrl + x to exit.
11. Now enter:

         sudo -v
    Enter your password if prompted.
12. Finally, enter:

         sh install.sh
13. Now just let the script run and it will reboot when finished. You should end up at the gui login screen.
14. Now you can login to i3. The only keybind you need to remember is Super + Shift + h for help. This will open a keybind map you can reference to
    get oriented. You can also access the keybind map with command:

          nano ~/scripts/keymap.txt

    Other easy and useful keybinds to learn right away are Super + Enter to open a terminal and Super + Space to open Rofi app launcher.
    Good luck and have fun!!!
