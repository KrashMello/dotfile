#!/usr/bin/env bash

CLIPCAT_VERSION=$(basename $(curl -s -w %{redirect_url} https://github.com/xrelkd/clipcat/releases/latest))

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
  echo -e ̈́"\nInstalando paquetes development-tools 🔃"
  sudo dnf group install development-tools
  echo -e "\nAgregando lazygit 🔃"
  sudo dnf copr enable atim/lazygit -y
  echo -e "\nAgregando qtile 🔃"
  sudo dnf copr enable frostyx/qtile
  echo -e "\nInstalando paquetes 🔃"
  sudo dnf install sxhkd feh dunst xclip maim kitty rofi fastfetch unrar bat fd-find ranger neovim variety duf fzf xclipboard qtile-extras qtile lazygit ripgrep zsh picom lsd zsh-syntax-highlighting zsh-autosuggestions magick i3lock yazi xorg-x11-server-Xorg cava redshift procps-ng curl file power-profiles-daemon xorg-x11-xinit rofimoji

  echo -e "\nInstalando clipcat 🔃"
  curl -s -L -O https://github.com/xrelkd/clipcat/releases/download/${CLIPCAT_VERSION}/clipcat-${CLIPCAT_VERSION#v}-1.el7.x86_64.rpm
  sudo dnf install --assumeyes clipcat-${CLIPCAT_VERSION#v}-1.el7.x86_64.rpm
  rm clipcat-${CLIPCAT_VERSION#v}-1.el7.x86_64.rpm
  echo -e "\nInstalando homebrew 🔃"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [ ! -d /home/linuxbrew ]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo -e "\nInstalando homebrew packages 🔃"
    brew install rainfrog
    brew install ouch
    brew install atac
    brew install yazi sevenzip jq poppler resvg imagemagick font-symbols-only-nerd-font
  fi
  if [ ! -d "$HOME"/systemd/user ]; then
    echo -e "\nCreando directorio systemd/user 🔃"
    mkdir -p "$HOME"/systemd/user
    if [ ! -d "$HOME"/systemd/user/clipcat.service.d ]; then
      echo -e "\nCreando clipcat.service 🔃"
      touch clipcat.service
      echo -e "[Unit]\nDescription=Clipcat Daemon\nPartOf=graphical-session.target\n\n[Install]\nWantedBy=graphical-session.target\n\n[Service]\nExecStartPre=/bin/rm -f %t/clipcat/grpc.sock\nExecStart=/usr/bin/clipcatd --no-daemon --replace\nRestart=on-failure\nType=simple" >$HOME/systemd/user/clipcat.service
    fi
    echo -e "\nRelocando systemd 🔃"
    systemctl --user daemon-reload
    systemctl --user enable clipcat.service
    systemctl --user start clipcat.service
  fi
  read -p "¿Desea instalar el desktop manager? [S/N] " resp
  if [ "$resp" = "S" ] || [ "$resp" = "s" ]; then
    local config_dir="/usr/share/xsessions/qtile.desktop"
    local source_dir="./qtile.desktop"
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
echo -e "\nInstalación completa ✅"
