#configure display
#xrandr --output Virtual-1 --mode 1920x1080

#enable picom to support transparency
picom -b &

numlokx on &
nm-applet &
volumeicon &
copyq &

#configure backgroung
sh background.sh
