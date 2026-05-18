#!/bin/sh

run() {
  if ! pgrep -x "$(basename "$1" | head -c 15)" 1>/dev/null; then
    "$@" &
  fi
}
# Constantes

WALLPAPER=$(/bin/cat "$HOME"/.wallpaper)
THEME=$(jq -r '.theme' $HOME/.config/qtile/config.json)

wlr-randr --output HDMI-A-1 --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-2 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-3 --off
swaybg -i "$WALLPAPER" &
swhkd -c "$HOME/.config/qtile/sxhkdrc" &
swhks &
cliphist wipe
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

# start all this to entry the system
dunst -config "$HOME/.config/qtile/themes/$THEME/dunstrc" &

(
  version=$(/bin/cat $HOME/.config/qtile/VERSION)
  actual_version=$(curl -s --max-time 5 https://raw.githubusercontent.com/KrashMello/dotfile/refs/heads/main/.config/qtile/VERSION)
  if [ -n "$actual_version" ] && [ "$version" != "$actual_version" ]; then
    notify-send "Actualización pendiente" "Los dotfiles tienen una nueva versión $actual_version"
  fi
) &

run kitty &
