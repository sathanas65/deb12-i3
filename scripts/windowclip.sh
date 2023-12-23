maim --format=png --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png &
i3-msg mode "default" &
notify-send "Window clipped"
