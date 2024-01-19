#configure display
#xrandr --output Virtual-1 --mode 1920x1080
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

#enable picom to support transparency
picom -b &
dunst -config ~/.config/dunst/dunstrc &
numlokx on &
nm-applet &
volumeicon &
copyq &
#psensor &

#configure backgroung
sh scripts/background.sh &
sleep 1
bash scripts/nordconnect.sh &
