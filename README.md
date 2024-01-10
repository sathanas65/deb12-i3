This guide is detailed to enable Linux newcomers to get up and running quickly, with a minimum of headaches. How to use these scripts:

1. Install Debian 12 but do not install any desktop environment. Only 'Standard Utilities' Should be selected during installation.
2. If you are installing on a device with wifi, it is easiest to use an ethernet connection during installation. 
   If you can't do that, you will need to edit /etc/network/interfaces after install or the network manager applet will show your
   wifi interface as unmanaged and you won't be able to connect to other networks, though the network you connected to during install
   will still work. If you do connect with wifi during installation, here are the post install steps to enable network manager to manage
   your wifi adapter:
   
     a) Open a terminal with Super + Enter and enter the following command:
   
        cd /etc/network
   
     b) Then enter:
   
         sudo cp interfaces interfaces.backup
      Enter your password when prompted. This is a backup in case something gets messed up.
   
     c) Then enter:

         sudo nano interfaces
     d) Below the row '# The primary network interface' you will see something like 'allow-hotplug w1p3s0'. Leave this line, but delete
        or comment out everything below it, starting with 'iface'.
   
     e) Ctrl + s to save and ctrl + x to exit.
   
     f) Now enter:

         sudo systemctl restart networking
   
     g) Enter your password when prompted. Now you should be able to manage your wifi comnnections from the applet on the i3 taskbar.
   
     h) If something goes wrong here are the steps to revert:
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
6. Then enter:

         git clone https://github.com/sathanas65/deb12-i3
   
8. Then enter:

         cd deb12-i3
   
9. By default, the options for installing as a kvm/qemu guest virtual machine are already selected. If you will be installing on a physical computer
    then you will need to:

         nano install.sh

   Comment out line - 'sudo apt install -y spice-vdagent'
   Ctrl + s to save & Ctrl + x to exit.
   Then

          xrandr -q

    Note the outputs that say 'connected', then

          nano display.sh
    
    Change 'Virtual-1' to your single or left hand display output and 'Virtual-2' to your right hand display output.
    Valid values are HMDI-0, VGA-0, DP-0, DVD-I-0, HDMI-2, etc. If you aren't sure which is which just enter them in any order and sort it out later.
    Ctrl + s to save & Ctrl + x to exit.

          nano config/i3/config
   
   Comment out line 'include ~/.config/i3/config.d/vmguest.conf'
   Uncomment line '#include ~/.config/i3/config.d/baremetal.conf'
   Ctrl + s to save & Ctrl + x to exit.

         nano config/i3/config.d/baremetal.conf
   
   Replace the display outputs to match your hardware
   Ctrl + s to save & Ctrl + x to exit.

10. Now you can review and edit the main install script.

         nano install.sh

    You can comment out lines by putting a hash(#) before them, and then they will not run. Or uncomment any you want to run.
    
11. Once you are done selecting or deselecting packages to you liking, or adding some of your own, Ctrl + s to save & Ctrl + x to exit.
12. Now enter:

         sudo -v
    
    Enter your password if prompted.
13. Finally, enter:

         bash install.sh
    
14. Now just let the script run and it will reboot when finished. You should end up at the gui login screen.
15. Now you can login to i3. The only keybind you need to remember is Super + Shift + h for help. This will open a keybind map you can reference to
    get oriented. You can also access the keybind map with command:

          nano ~/scripts/keymap.txt

    Other easy and useful keybinds to learn right away are Super + Enter to open a terminal and Super + Space to open Rofi app launcher.
    
    Good luck and have fun!!!
