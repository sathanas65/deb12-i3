if ! [ -f ~/.config/i3/barhidden ]; then
  cp ~/.config/i3/config ~/.config/i3/barhidden
  rm ~/.config/i3/config
  cp ~/.config/i3/barshown ~/.config/i3/config
  rm ~/.config/i3/barshown
  i3-msg reload
  i3-msg restart
fi
