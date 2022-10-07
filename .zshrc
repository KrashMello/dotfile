# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Created by newuser for 5.8.1
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Alias
alias cat='/usr/bin/bat'
alias df='/usr/bin/duf'
alias catn='/usr/bin/cat'
alias catnl='/usr/bin/bat --paging=never'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias purge="sudo pacman -Rns $(pacman -Qtdq) ; sudo fstrim -av"
alias rm-cache="yay -Sc && sudo pacman -Scc"
alias update="yay -Syu"
alias vim='nvim'
alias icat="kitty +kitten icat"
alias cdss="cd /home/krashmello/Documentos/Dev/simai-server"
alias mkt(){
	mkdir {nmap,content,exploits}
}
alias extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}
######## Extract part ########

extract () {
    if [ -f $1 ] ; then
            case $1 in
            *.tar.bz2)    tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.tar.xz)    tar xf $1      ;;
            *.bz2)        bunzip2 $1     ;;
            *.rar)        unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)        tar xvf $1     ;;
            *.tbz2)        tar xvjf $1    ;;
            *.tgz)        tar xvzf $1    ;;
            *.zip)        unzip $1       ;;
            *.Z)        uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)        echo "No se como descomprimir este '$1'..." ;;
            esac
    else
            echo "'$1' no es un archivo valido!"
    fi
 }


export EDITOR=nvim

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line       
bindkey "^[[3~" delete-char
#!/bin/sh
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P0403c58
  \e]P1ea6f91
  \e]P29bced7
  \e]P3f1ca93
  \e]P434738e
  \e]P5c3a5e6
  \e]P6eabbb9
  \e]P7faebd7
  \e]P86f6e85
  \e]P9ea6f91
  \e]PA9bced7
  \e]PBf1ca93
  \e]PC34738e
  \e]PDc3a5e6
  \e]PEeabbb9
  \e]PFffffff
  "
  # get rid of artifacts
  clear
fi

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
