from libqtile.config import Group, Match, Key
from libqtile.command import lazy
from .keys import mod, keys
from .layouts import layouts_maxtowide

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
    1: Group("   ", layout="monadtall", matches=[Match(wm_class=["Google-chrome","qutebrowser","vivaldi-stable"])]),
    2: Group("   ", layout="monadwide", layouts=layouts_maxtowide, matches=[Match(wm_class=["Alacritty","kitty"])]),
    3: Group("   ", layout="max", layouts=layouts_maxtowide, matches=[Match(wm_class=["code-oss","subl","code","Code"])]),
    4: Group("   ", layout="max", layouts=layouts_maxtowide, matches=[Match(wm_class=["pcmanfm","thunar","beekeeper-studio","blender","Inkscape"])]),
    5: Group("   ", matches=[Match(wm_class=["qtpad","Notes"])]),
    
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
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])
    
    # groups = [Group(i) for i in [
    #     "   ", "   ", "   ", "   ", "  ", "   ", "   ", "   ", "   ",
    # ]]

    # for i, group in enumerate(groups):
    #     actual_key = str(i + 1)
    #     keys.extend([
    #         # Switch to workspace N
    #         Key([mod], actual_key, lazy.group[group.name].toscreen()),
    #         # Send window to workspace N
    #         Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    #     ])
