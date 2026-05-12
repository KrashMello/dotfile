#!/bin/sh

run() {
  if ! pgrep -x "$(basename "$1" | head -c 15)" 1>/dev/null; then
    "$@" &
  fi
}

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  wlr-randr --output HDMI-A-1 --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-2 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-3 --off
  wallpaper=$(/bin/cat "$HOME"/.wallpaper)
  swaybg -i "$wallpaper" &
  swhks &
  swhkd -c "$HOME/.config/qtile/sxhkdrc" &
  cliphist wipe
  wl-paste --type text --watch cliphist store &
  wl-paste --type image --watch cliphist store &
elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
  sxhkd -c "$HOME/.config/qtile/sxhkdrc" &
  xrandr --output HDMI-1 --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-2 --off --output DP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-3 --off
  picom &
  run nm-applet &
  run blueman-applet &
  numlockx on &
  udiskie -t &
  blueman-applet &
  clipcatd &
  if [ -f "$HOME/.fehbg" ]; then
    "$HOME/.fehbg"
  fi
else
  echo "Tipo de sesión no gráfica o desconocido: $XDG_SESSION_TYPE"
fi

# start all this to entry the system
theme=$(jq -r '.theme' $HOME/.config/qtile/config.json)
dunst -config "$HOME/.config/qtile/themes/$theme/dunstrc" &
(
  version=$(/bin/cat $HOME/.config/qtile/VERSION)
  actual_version=$(curl -s --max-time 5 https://raw.githubusercontent.com/KrashMello/dotfile/refs/heads/main/.config/qtile/VERSION)
  if [ -n "$actual_version" ] && [ "$version" != "$actual_version" ]; then
    notify-send "Actualización pendiente" "Los dotfiles tienen una nueva versión $actual_version"
  fi
) &
kitty &
