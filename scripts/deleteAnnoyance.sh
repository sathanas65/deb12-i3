#!/bin/bash

rm -r ~/.local/share/kwalletd
rm ~/.config/i3/autostart.sh
cp ~/.config/i3/autostart.sh.after ~/.config/i3/autostart.sh
rm ~/.config/i3/autostart.sh.after
rm ~/scripts/deleteAnnoyance.sh
