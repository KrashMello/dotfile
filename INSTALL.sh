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
  sudo dnf copr enable atim/lazygit -y
  sudo dnf copr enable frostyx/qtile
  sudo dnf copr enable lihaohong/yazi
  sudo dnf install sxhkd feh dunst xclip maim kitty rofi fastfetch unrar bat fd-find ranger neovim variety duf fzf xclipboard qtile-extras qtile lazygit ripgrep zsh picom lsd zsh-syntax-highlighting zsh-autosuggestions magick i3lock yazi

  local config_dir="/usr/share/xsessions/qtile.desktop"
  local source_dir="./qtile.desktop"
  if [ -d "$config_dir" ]; then
    sudo mv "$config_dir" "${config_dir}_bak"
  fi
  sudo cp -r "$source_dir" "$config_dir"

}

# Función para respaldar y copiar configuraciones
backup_and_copy() {
  local config_dir="$1"
  local source_dir="$2"

  if [ -d "$config_dir" ]; then
    mv "$config_dir" "${config_dir}_bak"
  fi

  cp -r "$source_dir" "$config_dir"
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

# Cambiar a zsh si está instalado
if command -v zsh >/dev/null 2>&1; then
  backup_and_copy "$HOME/.zshrc" "./.zshrc"
  sudo chsh -s "$(which zsh)" "$USER"
fi

# Copiar configuraciones
backup_and_copy "$HOME/.config/nvim" "./.config/nvim"
backup_and_copy "$HOME/.config/qtile" "./.config/qtile"
backup_and_copy "$HOME/.config/kitty" "./.config/kitty"
backup_and_copy "$HOME/.config/rofi" "./.config/rofi"
backup_and_copy "$HOME/.config/picom" "./.config/picom"
backup_and_copy "$HOME/.config/yazi" "./.config/yazi"
backup_and_copy "$HOME/.config/zellij" "./.config/zellij"
backup_and_copy "$HOME/.config/neofetch" "./.config/neofetch"
backup_and_copy "$HOME/.config/clipcat" "./.config/clipcat"
backup_and_copy "$HOME/.mozilla/firefox/firefox-themes/userChrome.css" "./firefox/chrome/userChrome.css"

echo "✅ done"
