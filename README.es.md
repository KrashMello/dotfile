# Dotfiles

![km](./.config/qtile/assets/logo64x64_dark.png)

**_Idioma_**

- 🇪🇸 Español
- [🇺🇸 English](./README.md)

## Instalación (Arch)

Instala Qtile y las dependencias:

```bash
sudo pacman -S qtile pacman-contrib
yay -S nerd-fonts-ubuntu-mono
pip install psutil
```

Clona este repositorio y copia mis configuraciones:

```bash
git clone
cp -rf dotfiles/.config/* ~/.config
```

## Estructura

En el archivo `config.py` que es donde la mayoría suele poner toda su
configuración, yo solo tengo el _autostart_ y algunas variables como
_cursor_warp_.

```python
@hook.subscribe.startup_once
def autostart():
    subprocess.call([path.join(qtile_path, 'autostart.sh')])
```

Para cambiar lo que se lanza en el _autostart_ abre el archivo
`./autostart.sh`.

```bash

#!/bin/sh
#
function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}
PATH="$HOME/.config/qtile/scripts:$PATH"
# dimension wide
xrandr --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DVI-I-1 --mode 1280x1024 --pos 320x1080 --rotate normal
run polybar kmbar --config=$HOME/.config/qtile/polybar/config.ini
picom &
#feh --bg-fill ~/Imágenes/sakura.png
# start all this to entry the system
sxhkd -c $HOME/.config/qtile/sxhkdrc &
dunst -config "$HOME"/.config/qtile/dunstrc &
run variety &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
run blueberry-tray &
udiskie -t &
run volumeicon &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
kitty &

# notes &

```

![screen1](./screenshot/1.png)

Si quieres añadir o quitar atajos de teclado, abre `./settings/keys.py`.
Para añadir o quitar espacios de trabajos, debes modificar
`./settings/groups.py`. Finalmente, si quieres añadir nuevos _layouts_,
abre `./settings/layouts.py`, el resto de archivos no hace falta tocarlos.

![screen2](./screenshot/2.png)
![screen3](./screenshot/3.png)
![screen4](./screenshot/4.png)

## Temas

Para establecer un tema, mira los que hay disponibles en `./themes`, y
coloca su nombre en un archivo llamado `./config.json`:

```json
{
  "theme": "km"
}
```
