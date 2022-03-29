#!/bin/sh

# keymap
setxkbmap latam
# systray volume
volumeicon &

# picom
picom &
# imagen
feh --bg-fill ~/.config/qtile/assets/fondo.png

# start all this to entry the system

alacritty &
alacritty & 
#alacritty -e htop &
alacritty &
notes &
subl &
google-chrome-stable &
