from libqtile.config import Group, Match, Key
from libqtile.lazy import lazy
from .keys import mod, keys
from .layouts import layouts_maxtowide, layouts
from .theme import groups
import re

__groups = {}
for i, group in enumerate(groups):
    __groups[i + 1] = Group(
        group["name"],
        layout="max",
        layouts=layouts,
        matches=[Match(wm_class=re.compile(rf"^({group['matches']})$"))],
    )

groups = [__groups[i] for i in __groups]


def get_group_key(name):
    return [k for k, g in __groups.items() if g.name == name][0]


for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                str(get_group_key(i.name)),
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1+shift+letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                str(get_group_key(i.name)),
                lazy.window.togroup(i.name, switch_group=False),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )
