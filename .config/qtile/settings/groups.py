

from libqtile.config import Group, Match, Key
from libqtile.command import lazy
from .keys import mod, keys
from .layouts import layouts_maxtowide

__groups = {
    1: Group("   ", layout="monadtall", matches=[Match(wm_class=["Google-chrome"])]),
    2: Group("   ", layout="monadwide", layouts=layouts_maxtowide, matches=[Match(wm_class=["Alacritty"])]),
    3: Group("   ", layout="max", layouts=layouts_maxtowide, matches=[Match(wm_class=["code-oss","subl"])]),
    4: Group("   ", layout="max", layouts=layouts_maxtowide, matches=[Match(wm_class=["pcmanfm","thunar"])]),
    5: Group("   ", matches=[Match(wm_class=["qtpad","Notes"])]),
    
}
groups = [__groups[i] for i in __groups]


def get_group_key(name):
    return [k for k, g in __groups.items() if g.name == name][0]


for i in groups:
    keys.extend([
        Key([mod], str(get_group_key(i.name)), lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        Key([mod, "shift"], str(get_group_key(i.name)),
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
    ])
    

