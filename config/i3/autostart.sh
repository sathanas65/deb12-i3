#configure display
#xrandr --output Virtual-1 --mode 1920x1080
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

#enable picom to support transparency
picom -b &
dunst &
numlokx on &
nm-applet &
volumeicon &
copyq &

#configure backgroung
sh scripts/background.sh &
sleep 1
sh scripts/nordconnect.sh &
