from libqtile import layout
from libqtile.config import Match
from .theme import colors



layout_conf = {
    'border_focus': colors['focus'][0],
    'border_width': 1,
    'margin': 4,
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
        # other float of google chrome
        Match(wm_class='crx_iojgbjjdoanmhcmmihbapiejfbbadhjd'),
        Match(role='pop-up'),
        Match(wm_class='ark'),
        # Match(wm_instance_class='google-chrome'),
        Match(wm_instance_class='DBeaver'),
        Match(wm_instance_class='PacketTracer'),
        Match(title='pinentry'),
        Match(wm_type="utility"),
        Match(wm_type="notification"),
        Match(wm_type="toolbar"),
        Match(wm_type="splash"),
        Match(wm_type="dialog"),
        Match(wm_class="file_progress"),
        Match(wm_class="confirm"),
        Match(wm_class="dialog"),
        Match(wm_class="download"),
        Match(wm_class="error"),
        Match(wm_class="notification"),
        Match(wm_class="splash"),
        Match(wm_class="toolbar"),
        Match(func=lambda c: c.has_fixed_size()),
        Match(func=lambda c: c.has_fixed_ratio()),
    ],
    border_focus=colors["focus"][0]
)
