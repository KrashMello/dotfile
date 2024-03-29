from libqtile.config import Group, Match, Key
from libqtile.command import lazy
from .keys import mod, keys
from .layouts import layouts_maxtowide, layouts

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons: 
# nf-fa-firefox, 
# nf-fae-python, 
# nf-dev-terminal, 
# nf-fa-code, 
# nf-oct-git_merge, 
# nf-linux-docker,
# nf-mdi-image, 
# nf-mdi-layers
__groups = {
    1: Group("   ", layout="monadtall", matches=[Match(wm_class=["Navigator", "Firefox", "Vivaldi-stable", "Vivaldi-snapshot", "Chromium", "Google-chrome", "Brave", "Brave-browser", "navigator", "firefox", "vivaldi-stable", "vivaldi-snapshot", "chromium", "google-chrome", "brave", "brave-browser", "min", "Min" ])]),
    2: Group("   ", layout="monadwide", layouts=layouts, matches=[Match(wm_class=["Alacritty","kitty"])]),
    3: Group("   ", layout="max", layouts=layouts_maxtowide, matches=[Match(wm_class=["code-oss","subl","code","Code"])]),
    4: Group(" 󱂛 ", layout="monadtall", layouts=layouts, matches=[Match(wm_class=["insomnia", "Insomnia","postman", "Postman","qutebrowser", "qutebrowser"])]),
    5: Group("   ", layout="monadwide", layouts=layouts_maxtowide, matches=[Match(wm_class=["docker desktop", "Docker Desktop","github desktop", "GitHub Desktop","DBeaver", "DBeaver", "beekeeper-studio", "GitAhead"])]),
    6: Group("   ", layout="max", layouts=layouts_maxtowide, matches=[Match(wm_class=["Thunar", "Nemo", "Caja", "Nautilus", "org.gnome.Nautilus", "Pcmanfm", "Pcmanfm-qt", "thunar", "nemo", "caja", "nautilus", "org.gnome.nautilus", "pcmanfm", "pcmanfm-qt","file-roller", "File-roller"])]),
    7: Group(" 󰋩  ", layout="max", layouts=layouts_maxtowide, matches=[Match(wm_class=["blender","Inkscape"])]),
    8: Group(" 󰊗  ", layout="monadwide", layouts=layouts_maxtowide, matches=[Match(wm_class=["steam","game.exe", "mtga.exe", "spotify", "Spotify" ])]),
    9: Group("   ",layout="monadwide", layouts=layouts_maxtowide, matches=[Match(wm_class=["qtpad","Notes","slack", "Slack","notion-app", "notion-app","telegram-desktop", "TelegramDesktop","whatsapp-nativefier-d40211", "whatsapp-nativefier-d40211","franz", "Franz", "Mail", "thunderbird"])]),
    # 10: Group("   ",layout="monadwide", layouts=layouts_maxtowide, matches=[Match(wm_class=[])]),
}
groups = [__groups[i] for i in __groups]


def get_group_key(name):
    return [k for k, g in __groups.items() if g.name == name][0]


for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], str(get_group_key(i.name)), lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1+shift+letter of group = switch to & move focused window to group
        Key([mod, "shift"], str(get_group_key(i.name)),
            lazy.window.togroup(i.name, switch_group=False),
            desc="Switch to & move focused window to group {}".format(i.name)),
            ])

 
