#!/bin/sh

# Mensaje de bienvenida
echo "hello my people welcome to km installer 😄"

# Función para instalar paquetes usando yay
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
  sudo dnf group install development-tools
  sudo dnf copr enable atim/lazygit -y
  sudo dnf copr enable frostyx/qtile
  sudo dnf copr enable lihaohong/yazi
  sudo dnf install sxhkd feh dunst xclip maim kitty rofi fastfetch unrar bat fd-find ranger neovim variety duf fzf xclipboard qtile-extras qtile lazygit ripgrep zsh picom lsd zsh-syntax-highlighting zsh-autosuggestions magick i3lock yazi xorg-x11-server-Xorg cava redshift procps-ng curl file power-profiles-daemon xorg-x11-xinit

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zshrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  brew install rainfrog
  brew install ouch
  brew install atac

  local config_dir="/usr/share/xsessions/qtile.desktop"
  local source_dir="./qtile.desktop"

  read -p "¿Desea instalar el desktop manager? [S/N] " resp
  if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then
    if [ -d "$config_dir" ]; then
      sudo mv "$config_dir" "${config_dir}_bak"
    fi
    sudo cp -r "$source_dir" "$config_dir"
  fi
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

#Cambiar a zsh si está instalado

read -p "¿Desea instalar la configuracion zshrc? [S/N] " resp
if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then
  if command -v zsh >/dev/null 2>&1; then
    backup_and_copy "$HOME/.zshrc" "./.zshrc"
    sudo chsh -s "$(which zsh)" "$USER"
  fi
fi

# Copiar configuraciones
read -p "¿Desea instalar las configuraciones de la instalación? [S/N] " resp
if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then

  backup_and_copy ".config/nvim" "$HOME/.config/"
  backup_and_copy ".config/qtile" "$HOME/.config/"
  backup_and_copy ".config/kitty" "$HOME/.config/"
  backup_and_copy ".config/rofi" "$HOME/.config/"
  backup_and_copy ".config/picom" "$HOME/.config/"
  backup_and_copy ".config/yazi" "$HOME/.config/"
  backup_and_copy ".config/zellij" "$HOME/.config/"
  backup_and_copy ".config/fastfetch" "$HOME/.config/"
  backup_and_copy ".config/clipcat" "$HOME/.config/"
  backup_and_copy "./background" "$(xdg-user-dir PICTURES)/"
  # backup_and_copy "$HOME/.mozilla/firefox/firefox-themes/userChrome.css" "./firefox/chrome/userChrome.css"
  #
fi
echo "✅ done"
