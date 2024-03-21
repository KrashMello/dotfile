#!/bin/sh
#
function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}
PATH="$HOME/.config/qtile/scripts:$PATH"
# dimension wide
# xrandr --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 1280x0 --rotate normal --output DVI-I-1 --mode 1280x1024 --pos 0x56 --rotate normal
xrandr --output HDMI-1 --mode 1280x1024 --pos 0x404 --rotate normal --output HDMI-2 --off --output DP-1 --primary --mode 1920x1080 --pos 1280x0 --rotate normal --output HDMI-3 --off
# run polybar kmbar --config=$HOME/.config/qtile/polybar/config.ini
picom &
#feh --bg-fill ~/Imágenes/sakura.png
# start all this to entry the system
sxhkd -c $HOME/.config/qtile/sxhkdrc &
dunst -config "$HOME"/.config/qtile/dunstrc &
run variety &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
run blueberry-tray &
udiskie -t &
run volumeicon &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
kitty &

# notes &
