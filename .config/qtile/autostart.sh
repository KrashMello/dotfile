#!/bin/sh
#
run() {
  if ! pgrep -x "$(basename "$1" | head -c 15)" 1>/dev/null; then
    "$@" &
  fi
}
PATH="$HOME/.config/qtile/scripts:$PATH"
# dimension wide
xrandr --output HDMI-1 --mode 1920x1080 --pos 1920x85 --rotate normal --output HDMI-2 --off --output DP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-3 --off
picom &
feh --bg-fill "$HOME/Imágenes/background/km_background.png"
# start all this to entry the system
sxhkd -c "$HOME/.config/qtile/sxhkdrc" &
dunst -config "$HOME/.config/qtile/dunstrc" &
# xss-lock -- i3lockmore -n --image-fill $HOME/Imágenes/background/surreal_art_by_thenumberoneai_dgfi3bl-fullview.jpg &
run variety &
run nm-applet &
run blueman-applet &
numlockx on &
udiskie -t &
blueman-applet &
kitty &
clipcatd &
