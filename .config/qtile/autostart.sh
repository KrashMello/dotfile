#!/bin/sh
#
function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

# keymap
# setxkbmap latam
# systray volume
#volumeicon &
#udiskie -t &
# picom
 picom &
# imagen
#feh --bg-fill ~/Imágenes/rose_pine_shape.png 
#feh --bg-fill ~/Imágenes/sakura.png
# start all this to entry the system
run variety &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
udiskie -t &
run volumeicon &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
 
kitty &
notes &
