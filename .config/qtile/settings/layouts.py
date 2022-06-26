
from libqtile import layout
from libqtile.config import Match
from .theme import colors



layout_conf = {
    'border_focus': colors['focus'][0],
    'border_width': 1,
    'margin': 4
}

layouts = [
    layout.Max(),
    layout.MonadWide(**layout_conf),
    layout.MonadTall(**layout_conf),
]

layouts_maxtowide = [
           layout.MonadWide(**layout_conf),
           layout.Max(),
        ]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='ssh-askpass'),
        Match(title='branchdialog'),
        Match(title='pinentry'),
    ],
    border_focus=colors["focus"][0]
)
