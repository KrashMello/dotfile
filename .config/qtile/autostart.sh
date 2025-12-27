#!/bin/sh
#
run() {
  if ! pgrep -x "$(basename "$1" | head -c 15)" 1>/dev/null; then
    "$@" &
  fi
}

#scripts
if [ -d "$HOME/.config/qtile/scripts" ]; then
  PATH="$HOME/.config/qtile/scripts:$PATH"
fi

# dimension wide
if [ -f "$HOME/.sceenlayout/layout.sh" ]; then
  bash -c "$HOME/.sceenlayout/layout.sh"
fi

picom &
if [ -f "$HOME/.fehbg" ]; then
  "$HOME/.fehbg"
fi
# start all this to entry the system
sxhkd -c "$HOME/.config/qtile/sxhkdrc" &
theme=$(jq -r '.theme' $HOME/.config/qtile/config.json)
dunst -config "$HOME/.config/qtile/themes/$theme/dunstrc" &
version=$(/bin/cat $HOME/.config/qtile/VERSION)
actual_version=$(curl -X GET https://raw.githubusercontent.com/KrashMello/dotfile/refs/heads/main/.config/qtile/VERSION)
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
