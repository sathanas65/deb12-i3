#configure display
xrandr --output Virtual-1 --mode 1920x1080

#enable picom to support transparency
picom -b &

numlokx on &
nm-applet &
volumeicon &

#configure backgroung
feh --bg-fill .config/backgrounds/japan-sunset-purple-evening-4k-5m.jpg


