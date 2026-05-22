#!/bin/sh

run() {
  if ! pgrep -x "$(basename "$1" | head -c 15)" 1>/dev/null; then
    "$@" &
  fi
}
# Constantes
WALLPAPER=$(/bin/cat "$XDG_CONFIG_KM"/.wallpaper)
THEME=$(jq -r '.theme' $CONFIG_QTILE/config.json)

$HOME/.screenlayout/layout.sh
swaybg -i "$WALLPAPER" &
swhkd -c "$CONFIG_QTILE/sxhkdrc" &
run swhks
cliphist wipe
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

# start all this to entry the system
dunst -config "$CONFIG_QTILE/themes/$THEME/dunstrc" &

(
  version=$(/bin/cat $CONFIG_QTILE/VERSION)
  actual_version=$(curl -s --max-time 5 https://raw.githubusercontent.com/KrashMello/dotfile/refs/heads/main/.config/qtile/VERSION)
  if [ -n "$actual_version" ] && [ "$version" != "$actual_version" ]; then
    notify-send "Actualización pendiente" "Los dotfiles tienen una nueva versión $actual_version"
  fi
) &

run kitty
