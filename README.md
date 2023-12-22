How to use these scripts:

1. Install Debian 12 but do not install any desktop environment. Only 'Standard Utilities' Should be selected during installation.
2. If you are installing on a device with wifi, it is easiest to use an ethernet connection during installation. 
   If you can't do that, you will need to edit /etc/network/interfaces after install or the network manager applet will show your
   wifi interface as unmanaged and you won't be able to connect to other networks, though the network you connected to during install
   will still work. If you do connect with wifi during installation, here are the post install steps to enable network manager to manage
   your wifi adapter:
   
     a) Open a terminal with Super + Enter.

   $ cd
   
     b) Type: 'cd /etc/network' and enter.
   
     c) Type: 'cp interfaces interfaces.backup' and enter. This is a backup in case something gets messed up.
   
     d) Type: 'sudo nano interfaces' and enter.
   
     e) Enter your password when prompted.
   
     f) Below the row '# The primary network interface' you will see something like 'allow-hotplug w1p3s0'. Leave this line, but delete
        or comment out everything below it, starting with 'iface'.
   
     g) Ctrl + s to save and ctrl + x to exit.
   
     h) Now type: 'sudo systemctl restart networking' and enter.
   
     i) Enter your password when prompted. Now you should be able to manage your wifi comnnections from the applet on the i3 taskbar.
   
     j) If something goes wrong you can enter the follwing commands to revert:
   
         1. 'cd /etc/network'
   
         2. 'sudo rm interfaces'
   
         3. 'sudo cp interfaces.backup interfaces'
   
         4. 'sudo systemctl restart networking'
   
4. Once your Debian 12 install is complete, login with your username and password.
5. Type: 'sudo apt install -y git' and enter. Then enter your password.
6. Type: 'git clone https://github.com/sathanas65/deb12-i3' and enter.
7. Type: 'cd deb12-i3' and enter.
8. Type: 'nano install.sh' and enter.
9. Now you can review and edit the main install script. You can comment out lines by putting a hash(#) before them, and then they will not run.
10. By default, the options for installing as a kvm/qemu guest virtual machine are already selected. If you will be installing on a physical computer
    then you will need to comment out the following lines:
    
    a) 'sudo apt install -y spice-vdagent' on line 153
    
    b) 'sh ~/deb12-i3/vm-copyconf.sh' on line 182
    
    c) 'sudo cp virtual-display.sh /usr/share/virtual-display.sh' on line 184
    
    d) 'sudo cp lightdm.conf /etc/lightdm/lightdm.conf' on line 185
    
    e) 'sudo chmod +x /usr/share/virtual-display.sh' on line 186
    
    Then you will need to uncomment '#sh ~/deb12-i3/copyconf.sh' on line 179. Then Ctrl + s to save.
    
12. Once you are done selecting or deselecting packages to you liking, or adding some of your own, Ctrl + s to save & Ctrl + x to exit.
13. Now enter: 'sudo -v' , enter, and enter your password if prompted.
14. Finally, enter: 'sh install.sh' and enter. Now just let the script run and it will reboot when finished. You should end up at the gui login screen.
15. Now you can login to i3. The only keybind you need to remember is Super + Shift + h for help. This will open a keybind map you can reference to
    get oriented. You can also access the keybind map with command 'nano ~/scripts/keymap.txt'. Good luck and have fun!
