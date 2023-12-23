maim --format=png --select | xclip -selection clipboard -t image/png
i3-msg mode "default" &
notify-send "Selection clipped"
