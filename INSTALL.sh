#!/bin/sh

# Mensaje de bienvenida
echo "hello my people welcome to km installer 😄"

# Función para instalar paquetes usando yay
install_with_yay() {
  yay -Sy
  yay -S ttf-firacode-nerd xdotool xclip dunst sxhkd feh blueman variety pamac-aur udiskie volumeicon kitty parcellite arandr xrandr qtile-extras pavucontrol rofi neovim ranger fd ripgrep bat duf fzf neofetch fastfetch lazygit thunar maim ark unrar
}

# Función para instalar paquetes usando dnf
install_with_dnf() {
  sudo dnf group install development-tools
  sudo dnf copr enable atim/lazygit -y
  sudo dnf copr enable frostyx/qtile
  sudo dnf copr enable lihaohong/yazi
  sudo dnf install sxhkd feh dunst xclip maim kitty rofi fastfetch unrar bat fd-find ranger neovim variety duf fzf xclipboard qtile-extras qtile lazygit ripgrep zsh picom lsd zsh-syntax-highlighting zsh-autosuggestions magick i3lock yazi xorg-x11-server-Xorg cava redshift procps-ng curl file

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zshrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  brew install rainfrog
  brew install ouch
  brew install atac

  local config_dir="/usr/share/xsessions/qtile.desktop"
  local source_dir="./qtile.desktop"
  if [ -d "$config_dir" ]; then
    sudo mv "$config_dir" "${config_dir}_bak"
  fi
  sudo cp -r "$source_dir" "$config_dir"
}

# Función para respaldar y copiar configuraciones
backup_and_copy() {
  local config_dir="$2"
  local source_dir="$1"

  if [ -d "$HOME"/"$source_dir" ]; then
    mv "$HOME"/"$source_dir" "$HOME"/"${source_dir}_bak"
  fi

  ln -s "$(pwd)"/"$source_dir" "$config_dir"
}

# Instalación de paquetes
if command -v yay >/dev/null 2>&1; then
  install_with_yay
elif command -v dnf >/dev/null 2>&1; then
  install_with_dnf
else
  echo "❌ no package manager found"
  exit 1
fi

Cambiar a zsh si está instalado
if command -v zsh >/dev/null 2>&1; then
  backup_and_copy "$HOME/.zshrc" "./.zshrc"
  sudo chsh -s "$(which zsh)" "$USER"
fi

# Copiar configuraciones
backup_and_copy ".config/nvim" "$HOME/.config/"
backup_and_copy ".config/qtile" "$HOME/.config/"
backup_and_copy ".config/kitty" "$HOME/.config/"
backup_and_copy ".config/rofi" "$HOME/.config/"
backup_and_copy ".config/picom" "$HOME/.config/"
backup_and_copy ".config/yazi" "$HOME/.config/"
backup_and_copy ".config/zellij" "$HOME/.config/"
backup_and_copy ".config/fastfetch" "$HOME/.config/"
backup_and_copy ".config/clipcat" "$HOME/.config/"
# backup_and_copy "$HOME/.mozilla/firefox/firefox-themes/userChrome.css" "./firefox/chrome/userChrome.css"
#
echo "✅ done"
