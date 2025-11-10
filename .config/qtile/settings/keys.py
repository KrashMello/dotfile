from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile import layout


mod = "mod4"

keys = [
    Key(key[0], key[1], *key[2:])
    for key in [
        # ------------ Window Configs ------------
        # Switch between windows in current stack pane
        ([mod], "Down", lazy.layout.down()),
        ([mod], "Up", lazy.layout.up()),
        ([mod], "Left", lazy.layout.left()),
        ([mod], "Right", lazy.layout.right()),
        ([mod], "j", lazy.layout.down()),
        ([mod], "k", lazy.layout.up()),
        ([mod], "h", lazy.layout.left()),
        ([mod], "l", lazy.layout.right()),
        # Change window sizes (MonadTall)
        # ([mod, "shift"], "Right", lazy.layout.grow()),
        # ([mod, "shift"], "Left", lazy.layout.shrink()),
        # ([mod, "shift"], "l", lazy.layout.grow()),
        # ([mod, "shift"], "h", lazy.layout.shrink()),
        # Toggle floating
        ([mod], "f", lazy.window.toggle_fullscreen()),
        ([mod, "shift"], "f", lazy.window.toggle_floating()),
        ([mod, "control"], "f", lazy.layout.flip()),
        # Move windows up or down in current stack
        ([mod, "shift"], "Down", lazy.layout.shuffle_down()),
        ([mod, "shift"], "Up", lazy.layout.shuffle_up()),
        ([mod, "shift"], "j", lazy.layout.shuffle_down()),
        ([mod, "shift"], "k", lazy.layout.shuffle_up()),
        # Toggle between different layouts as defined below
        ([mod], "Tab", lazy.next_layout()),
        ([mod, "shift"], "Tab", lazy.prev_layout()),
        # Kill window
        ([mod], "w", lazy.window.kill()),
        # Switch focus of monitors
        ([mod], "period", lazy.next_screen()),
        ([mod], "comma", lazy.prev_screen()),
        # Restart Qtile
        ([mod, "control"], "r", lazy.restart()),
        ([mod, "control"], "q", lazy.shutdown()),
        # ------------ App Configs ------------
        # lock screen
        # ([mod], "l", lazy.spawn("archlinux-logout")),
        # Menu
        ([mod], "space", lazy.spawn("rofi -show drun")),
        # Window Nav
        ([mod, "shift"], "space", lazy.spawn("rofi -show window")),
        # Browsers
        ([mod], "b", lazy.spawn("firefox")),
        # ([mod, "shift"], "b", lazy.window.bring_to_front()),
        ([mod, "shift"], "b", lazy.spawn("qutebrowser")),
        # text editor
        ([mod], "c", lazy.spawn("Code")),
        # ([mod, "shift"], "c", lazy.spawn("subl")),
        # File Explorer
        # ([mod], "e", lazy.spawn("Thunar")),
        # Terminal
        ([mod], "return", lazy.spawn("kitty")),
        # KeyLayout
        (["control"], "space", lazy.widget["keyboardlayout"].next_keyboard()),
        # Screenshot
        # ([mod], "s", lazy.spawn(" maim -u $HOME/Imágenes/Screenshot/km-%d_%m_%Y-%I-%M-%S.png")),
        # ([mod, "shift"], "s", lazy.spawn("sh ../screenshots --sel")),
        # ------------ Hardware Configs ------------
        # ------------ Hardware Configs ------------
        # Volume
        (
            [],
            "XF86AudioLowerVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
        ),
        (
            [],
            "XF86AudioRaiseVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
        ),
        ([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
        # Brightness
        ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
        ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    ]
]
