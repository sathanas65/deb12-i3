maim --format=png --select /home/$USER/Pictures/screenshot-$(date -u +'%Y%m%d-%H%M%SZ')
i3-msg mode "default" &
notify-send "Selection saved"
