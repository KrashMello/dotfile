#!/bin/sh
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CONFIG_KM="$XDG_CONFIG_HOME"/km
export CONFIG_EWW="$XDG_CONFIG_HOME"/eww
export CONFIG_KITTY="$XDG_CONFIG_HOME"/kitty
export CONFIG_ROFI="$XDG_CONFIG_HOME"/rofi
export CONFIG_QTILE="$XDG_CONFIG_HOME"/qtile
export XDG_CURRENT_DESKTOP=gnome

if [ -d "$XDG_CONFIG_KM/scripts" ]; then
  PATH="$PATH:$XDG_CONFIG_KM/scripts"
fi

loginctl enable-linger "$USER"

systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_CONFIG_HOME XDG_SESSION_TYPE GDK_BACKEND
dbus-update-activation-environment --systemd XDG_CURRENT_DESKTOP XDG_CONFIG_HOME XDG_SESSION_TYPE GDK_BACKEND

run() {
  if ! pgrep -x "$(basename "$1" | head -c 15)" 1>/dev/null; then
    "$@" &
  fi
}
# Constantes
WALLPAPER=$(/bin/cat "$XDG_CONFIG_KM"/.wallpaper)
THEME=$(jq -r '.theme' "$CONFIG_QTILE"/config.json)

"$HOME"/.screenlayout/layout.sh
swaybg -i "$WALLPAPER" &
swhkd -c "$CONFIG_QTILE/sxhkdrc" &
run swhks
cliphist wipe
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

# start all this to entry the system
dunst -config "$CONFIG_QTILE/themes/$THEME/dunstrc" &

(
  version=$(/bin/cat "$CONFIG_QTILE"/VERSION)
  actual_version=$(curl -s --max-time 5 https://raw.githubusercontent.com/KrashMello/dotfile/refs/heads/main/.config/qtile/VERSION)
  if [ -n "$actual_version" ] && [ "$version" != "$actual_version" ]; then
    notify-send "Actualización pendiente" "Los dotfiles tienen una nueva versión $actual_version"
  fi
) &

run kitty
