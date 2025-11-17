#!/bin/sh
#
run() {
  if ! pgrep -x "$(basename "$1" | head -c 15)" 1>/dev/null; then
    "$@" &
  fi
}

#scripts
if [ -d "$HOME/.config/qtile/scripts/" ]; then
  PATH="$HOME/.config/qtile/scripts/:$PATH"
fi

# dimension wide
xrandr --output HDMI-1 --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-2 --off --output DP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-3 --off
picom &
if [ -f "$HOME/.fehbg" ]; then
  "$HOME/.fehbg"
fi
# start all this to entry the system
sxhkd -c "$HOME/.config/qtile/sxhkdrc" &
theme=$(/bin/cat ~/.config/qtile/config.json | sed -n 's/^[[:space:]]*\"theme\":[[:space:]]*\"\([^;]*\)\".*$/\1/p')
dunst -config "$HOME/.config/qtile/themes/$theme/dunstrc" &
version=$(cat $HOME/.config/qtile/VERSION)
actual_version=$(curl -X GET https://raw.githubusercontent.com/KrashMello/dotfile/refs/heads/main/VERSION)
if [ "$version" != "$actual_version" ]; then
  notify-send "Actualizacion pendiente" "Los dotfile tienen una nueva actualizacion $actual_version actualizar el repositorio"
fi
# xss-lock -- i3lockmore -n --image-fill $HOME/Imágenes/background/surreal_art_by_thenumberoneai_dgfi3bl-fullview.jpg &
# run variety &
run nm-applet &
run blueman-applet &
numlockx on &
udiskie -t &
blueman-applet &
kitty &
clipcatd &
