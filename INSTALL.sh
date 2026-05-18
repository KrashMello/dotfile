#!/usr/bin/env bash

XDG_CONFIG_HOME=$HOME/.config
XDG_CONFIG_KM=$XDG_CONFIG_HOME/km
CONFIG_EWW=$XDG_CONFIG_HOME/eww
CONFIG_KITTY=$XDG_CONFIG_HOME/kitty
CONFIG_ROFI=$XDG_CONFIG_HOME/rofi
CONFIG_QTILE=$XDG_CONFIG_HOME/qtile
DOT_DIR="$(pwd)"

# Mensaje de bienvenida
echo "░█░█░█▀▄░█▀█░█▀▀░█░█░█▄█░█▀▀░█░░░█░░░█▀█"
echo "░█▀▄░█▀▄░█▀█░▀▀█░█▀█░█░█░█▀▀░█░░░█░░░█░█"
echo "░▀░▀░▀░▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀"
echo "░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀            "
echo "░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀            "
echo "░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀            "
echo "░▀█▀░█▀█░█▀▀░▀█▀░█▀█░█░░░█░░░█▀▀░█▀▄    "
echo "░░█░░█░█░▀▀█░░█░░█▀█░█░░░█░░░█▀▀░█▀▄    "
echo "░▀▀▀░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀    "
echo -e "\nEmpezemos con la instalacion 🔃"

install_with_yay() {
  yay -Sy
  yay -S ttf-firacode-nerd xdotool xclip dunst sxhkd feh blueman variety pamac-aur udiskie volumeicon kitty parcellite arandr xrandr qtile-extras pavucontrol rofi neovim ranger fd ripgrep bat duf fzf neofetch fastfetch lazygit thunar maim ark unrar
}

install_with_apt() {

  sudo apt install xserver-xorg xinit libpangocairo-1.0-0 curl sxhkd feh dunst xclip maim kitty rofi fastfetch unrar-free bat fd-find ranger neovim variety duf fzf qtile lazygit ripgrep zsh picom lsd zsh-syntax-highlighting zsh-autosuggestions i3lock cava redshift python3-pip python3-cffi python3-cairocffi python3-xcffib ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick pipx Mpdris2 iwd
  $HOME/.local/bin/uv tool update-shell
  source $HOME/.bashrc
  $HOME/.local/bin/uv tool install qtile
  pipx install qtile
  pipx inject qtile qtile-extras
  curl -LsSf https://astral.sh/uv/install.sh | sh

  local config_dir="/usr/share/xsessions/qtile.desktop"
  local source_dir="./qtile.desktop"
}

# Función para instalar paquetes usando dnf
install_with_dnf() {
  echo -e "\nInstalando paquetes development-tools 🔃"
  sudo dnf group install development-tools
  echo -e "\nAgregando a la lista de repositorios lazygit 🔃"
  sudo dnf copr enable atim/lazygit -y
  echo -e "\nAgregando a la lista de repositorios qtile 🔃"
  sudo dnf copr enable frostyx/qtile
  echo -e "\nInstalando paquetes 🔃"
  sudo dnf install dunst kitty rofi fastfetch unrar bat fd-find neovim duf fzf cliphist wl-clipboard qtile-extras qtile lazygit ripgrep zsh lsd zsh-syntax-highlighting zsh-autosuggestions magick swaylock cava gammastep procps-ng curl file rofimoji playerctl wdisplays swaybg slurp xdg-desktop-portal-wlr xdg-desktop-portal-gtk gamescope wlr-randr grim gtk-layer-shell

  echo -e "\nInstalando homebrew 🔃"

  if [ ! -d /home/linuxbrew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo -e "\nInstalando homebrew packages 🔃"
    brew install rainfrog
    brew install ouch
    brew install atac
    brew install yazi sevenzip jq poppler resvg imagemagick font-symbols-only-nerd-font
  fi
  # read -p "¿Desea instalar el desktop manager? [S/N] " resp
  # if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then
  #   local config_dir="/usr/share/xsessions/qtile.desktop"
  #   local source_dir="./qtile.desktop"
  #   if [ -d "$config_dir" ]; then
  #     sudo mv "$config_dir" "${config_dir}_bak"
  #   fi
  #   sudo cp -r "$source_dir" "$config_dir"
  # fi
}

# Función para respaldar y copiar configuraciones
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

read -p "¿Desea instalar la dependencias? [S/N] " resp
if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then
  # Instalación de paquetes
  if command -v yay >/dev/null 2>&1; then
    install_with_yay
  elif command -v dnf >/dev/null 2>&1; then
    install_with_dnf
  else
    echo "❌ no package manager found"
    exit 1
  fi
fi

#Cambiar a zsh si está instalado
read -p "¿Desea instalar la configuracion zshrc? [S/N] " resp
if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then
  if command -v zsh >/dev/null 2>&1; then
    backup_and_copy "$DOT_DIR/.zshrc" "$HOME" -f
  fi
fi

read -p "¿Desea instalar hacer zsh el shell predeterminado? [S/N] " resp
if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then
  if command -v zsh >/dev/null 2>&1; then
    sudo chsh -s "$(which zsh)" "$USER"
  fi
fi

# Copiar configuraciones
read -p "¿Desea instalar las configuraciones de la instalación? [S/N] " resp
if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then

  backup_and_copy "$DOT_DIR/.config/atac" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/eww" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/fastfetch" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/kitty" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/km" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/nvim" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/qtile" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/rofi" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/yazi" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/.config/zellij" "$XDG_CONFIG_HOME" -d
  backup_and_copy "$DOT_DIR/background" "$(xdg-user-dir PICTURES)" -d
  backup_and_copy "$DOT_DIR/.local/bin/startw" "$XDG_CONFIG_HOME/.local/bin" -d
  # backup_and_copy "$HOME/.mozilla/firefox/firefox-themes/userChrome.css" "./firefox/chrome/userChrome.css"
  #
fi
echo -e "\nInstalación completa ✅"
