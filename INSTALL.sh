#!/usr/bin/env bash

XDG_CONFIG_HOME=$HOME/.config
XDG_CONFIG_KM=$XDG_CONFIG_HOME/km
CONFIG_EWW=$XDG_CONFIG_HOME/eww
CONFIG_KITTY=$XDG_CONFIG_HOME/kitty
CONFIG_ROFI=$XDG_CONFIG_HOME/rofi
CONFIG_QTILE=$XDG_CONFIG_HOME/qtile
DOT_DIR="$(pwd)"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Mensaje de bienvenida
printf "${GREEN}░█░█░█▀▄░█▀█░█▀▀░█░█░█▄█░█▀▀░█░░░█░░░█▀█${NC}\n"
printf "${GREEN}░█▀▄░█▀▄░█▀█░▀▀█░█▀█░█░█░█▀▀░█░░░█░░░█░█${NC}\n"
printf "${GREEN}░▀░▀░▀░▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀${NC}\n"
printf "${GREEN}░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀            ${NC}\n"
printf "${GREEN}░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀            ${NC}\n"
printf "${GREEN}░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀            ${NC}\n"
printf "${GREEN}░▀█▀░█▀█░█▀▀░▀█▀░█▀█░█░░░█░░░█▀▀░█▀▄    ${NC}\n"
printf "${GREEN}░░█░░█░█░▀▀█░░█░░█▀█░█░░░█░░░█▀▀░█▀▄    ${NC}\n"
printf "${GREEN}░▀▀▀░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀    ${NC}\n"
printf "\nEmpezemos con la instalacion 🔃"

install_with_dnf() {
  echo -e "\nInstalando paquetes development-tools 🔃"
  sudo dnf group install development-tools
  echo -e "\nAgregando a la lista de repositorios lazygit 🔃"
  sudo dnf copr enable atim/lazygit -y
  echo -e "\nAgregando a la lista de repositorios qtile 🔃"
  sudo dnf copr enable frostyx/qtile
  echo -e "\nInstalando paquetes 🔃"
  sudo dnf install dunst kitty rofi fastfetch unrar bat fd-find neovim duf fzf cliphist wl-clipboard qtile-extras qtile lazygit ripgrep zsh lsd zsh-syntax-highlighting zsh-autosuggestions magick swaylock cava gammastep procps-ng curl file rofimoji playerctl wdisplays swaybg slurp xdg-desktop-portal-wlr xdg-desktop-portal-gtk gamescope wlr-randr grim gtk-layer-shell wiremix podman-compose podman-tui

  echo -e "\nInstalando homebrew 🔃"

  if [ ! -d /home/linuxbrew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo -e "\nInstalando homebrew packages 🔃"
    brew install yazi sevenzip jq poppler resvg imagemagick font-symbols-only-nerd-font atac ouch rainfrog opencode mdv rich
  fi
}

backup_and_copy() {
  local config_dir="$2"
  local source_dir="$1"
  local type="$3"
  case "$type" in
  -f)
    if [ -f "$config_dir/${source_dir##*/}" ]; then
      mv "$config_dir/${source_dir##*/}" "$config_dir/${source_dir##*/}_bak"
    fi
    ;;
  -d)
    if [ -d "$config_dir/${source_dir##*/}" ]; then
      mv "$config_dir/${source_dir##*/}" "$config_dir/${source_dir##*/}_bak"
    fi
    ;;
  esac
  ln -s "$source_dir" "$config_dir"
}

# Instalación de paquetes
read -p "¿Desea instalar la dependencias? [S/N] " resp
if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then
  if command -v dnf >/dev/null 2>&1; then
    install_with_dnf
  else
    echo "❌ no package manager found"
    exit 1
  fi
fi

#Cambiar a zsh si está instalado
read -p "¿Desea instalar hacer zsh el shell predeterminado? [S/N] " resp
if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then
  if command -v zsh >/dev/null 2>&1; then
    sudo chsh -s "$(which zsh)" "$USER"
  fi
fi

read -p "¿Desea instalar la configuracion zshrc? [S/N] " resp
if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then
  if command -v zsh >/dev/null 2>&1; then
    backup_and_copy "$DOT_DIR/.zshrc" "$HOME" -f
  fi
fi

# Copiar configuraciones
read -p "¿Desea instalar las configuraciones de la instalación? [S/N] " resp
if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then
  if [ ! -d "$XDG_CONFIG_HOME"/.dotfile ]; then
    mkdir -p "$XDG_CONFIG_HOME"/.dotfile
  fi
  cp -r "$DOT_DIR/.config" "$XDG_CONFIG_HOME"/.dotfile/
  cp -r "$DOT_DIR/.local" "$XDG_CONFIG_HOME"/.dotfile/
  cp -r "$DOT_DIR/firefox" "$XDG_CONFIG_HOME"/.dotfile/
  cp -r "$DOT_DIR/background" "$XDG_CONFIG_HOME"/.dotfile/
  cp -r "$DOT_DIR/zshrc" "$XDG_CONFIG_HOME"/.dotfile/
  DOT_DIR="$XDG_CONFIG_HOME"/.dotfile
  backup_and_copy "$DOT_DIR/.config/atac" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/eww" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/fastfetch" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/kitty" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/km" "$XDG_CONFIG_HOME" -d
  if [ -d "$XDG_CONFIG_HOME/km/scripts" ]; then
    sudo chown root:root "$XDG_CONFIG_HOME"/km/scripts/swhkd
    sudo chmod u+s "$XDG_CONFIG_HOME"/km/scripts/swhkd
  fi
  backup_and_copy "$DOT_DIR/.config/nvim" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/qtile" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/rofi" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/yazi" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/zellij" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/background" "$(xdg-user-dir PICTURES)" -d
  backup_and_copy "$DOT_DIR/.local/bin/startw" "$HOME/.local/bin" -f
  if [ -d $HOME/.mozilla/firefox/$(/bin/ls $HOME/.mozilla/firefox/ | grep -e '.default-release*$')/chrome ]; then
    backup_and_copy "$DOT_DIR/firefox/chrome" "$HOME/.mozilla/firefox/$(/bin/ls $HOME/.mozilla/firefox/ | grep -e '.default-release*$')" -d
  fi
  chosse="nord"
  if [ "$chosse" != "" ]; then
    echo "@import \"$chosse.rasi\"" >$CONFIG_ROFI/themes/default.rasi
    echo "@import \"themes/$chosse.scss\"" >$CONFIG_EWW/colors.scss
    echo "include $chosse.conf" >$CONFIG_KITTY/themes/default.conf
    kill -SIGUSR1 $(pidof kitty)
    if [ -f $CONFIG_QTILE/config.json ]; then
      echo -e $(jq --arg theme "$chosse" '.theme |= $theme' $CONFIG_QTILE/config.json) >$CONFIG_QTILE/config.json
    fi
    if [ -d $HOME/.mozilla/firefox/$(/bin/ls $HOME/.mozilla/firefox/ | grep -e '.default-release*$')/chrome ]; then
      echo "@import \"./themes/$chosse.css\";" >$HOME/.mozilla/firefox/$(/bin/ls $HOME/.mozilla/firefox/ | grep -e '.default-release*$')/chrome/theme.css
    fi
    images="$(xdg-user-dir PICTURES)/background"
    themes="themes/$(/bin/cat $CONFIG_QTILE/config.json | jq .theme | tr -d '"')"

    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    case $chosse in
    "nord")
      wallpaper="$images/$themes/wallhaven-2em38y_1920x1080.png"
      COLOR="#d8dee9"
      ;;
    "batman")
      wallpaper="$images/$themes/wallhaven-01zjqg_1920x1080.png"
      COLOR="#fcef0c"
      ;;
    "catppuccin-mocha")
      wallpaper="$images/$themes/wallhaven-1qkz23_1920x1080.png"
      COLOR="#f5c2e7"
      ;;
    "catppuccin-latte")
      wallpaper="$images/$themes/sky-cat.png"
      COLOR="#4c4f69"
      gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
      ;;
    "rose-pine-dawn")
      wallpaper="$images/$themes/sky-cat.png"
      COLOR="#d7827e"
      gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
      ;;
    esac
    if [ ! -f "$XDG_CONFIG_KM"/.wallpaper ]; then
      touch "$XDG_CONFIG_KM"/.wallpaper
    fi
    if [ ! -d "$HOME"/.icons/km ]; then
      mkdir -p "$HOME"/.icons/km
    fi
    echo "$wallpaper" >"$XDG_CONFIG_KM"/.wallpaper

    for icon in "$XDG_CONFIG_KM"/icons/*; do
      svgName=$(echo "$icon" | awk -F/ '{print $NF}')
      /bin/cat "$icon" | sed 's/color="km"/color="'"$COLOR"'"/g' >"$HOME"/.icons/km/"$svgName"
    done
  fi

fi

echo -e "\nInstalación completa ✅"
