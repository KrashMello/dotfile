#!/bin/sh

if command -v yay > /dev/null 2>&1; then
  yay -Sy
  yay -S ttf-firacode-nerd xdotool xclip dunst sxhkd feh blueman variety pamac-aur udiskie volumeicon kitty plank parcellite arandr xrandr qtile-extras pavucontrol rofi neovim ranger fd ripgrep bat duf fzf neofetch fastfetch lazygit thunar maim ark unrar 
else
  echo "you need to install yay to proceed with installation"
fi

if [  -d "$HOME/.config" ]; then
  echo "copy configuration"
  cp -r .config/* $HOME/.config
else
  echo "create ~/.config"
  mkdir ~/.config
  echo "copy configuration"
  cp -r .config/* $HOME/.config
fi
echo "done"
