#!/bin/sh
echo "hello my people welcome to km installer 😄"
if which yay >/dev/null 2>&1; then

	yay -Sy
	yay -S ttf-firacode-nerd xdotool xclip dunst sxhkd feh blueman variety pamac-aur udiskie volumeicon kitty plank parcellite arandr xrandr qtile-extras pavucontrol rofi neovim ranger fd ripgrep bat duf fzf neofetch fastfetch lazygit thunar maim ark unrar

elif which dnf >/dev/null 2>&1; then

	sudo dnf copr enable atim/lazygit -y
	sudo dnf install sxhkd feh dunst xclip maim kitty rofi neofetch unrar bat fd-find ranger neovim plank variety duf fastfetch fzf parcellite xclip qtile-extras qtile lazygit ripgrep zsh
else
	echo "❌ no package manager found"
fi

if which zsh >/dev/null 2>&1; then
	echo "add default shell zsh"
	sudo chsh -s $(which zsh) $USER
fi

if [ -d "$HOME/.config" ]; then
	echo "copy configuration"
	cp -r .config/* $HOME/.config
else
	echo "create ~/.config"
	mkdir ~/.config
	echo "copy configuration"
	cp -r .config/* $HOME/.config
fi

echo "✅ done"
