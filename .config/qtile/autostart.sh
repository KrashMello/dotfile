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
 xrandr --output DP1 --mode 1280x1024 --pos 0x562 --rotate normal --output HDMI1 --mode 1920x1080 --pos 1280x0 --rotate normal --output HDMI2 --off --output HDMI3 --off --output VIRTUAL1 --off
picom &
feh --bg-fill $HOME/Imágenes/background/wallhaven-1pwl61_1920x1080.png
# start all this to entry the system
sxhkd -c $HOME/.config/qtile/sxhkdrc &
dunst -config "$HOME"/.config/qtile/dunstrc &
# xss-lock -- i3lockmore -n --image-fill $HOME/Imágenes/background/surreal_art_by_thenumberoneai_dgfi3bl-fullview.jpg &
run variety &
run nm-applet &
run blueman-applet &
run pamac-tray &
# run xfce4-power-manager &
numlockx on &
udiskie -t &
run volumeicon &
variety &
blueman-applet &
kitty &
plank &
parcellite &
knotes &
setxkbmap latam

