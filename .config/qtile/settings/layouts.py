from libqtile import layout
from libqtile.config import Match
from .theme import colors


layout_conf = {
    "border_focus": colors["focus"][0],
    "border_width": 1,
    "margin": 4,
}

layouts = [
    layout.Max(),
    layout.Tile(**layout_conf),
]

layouts_maxtowide = [
    layout.MonadWide(**layout_conf),
    layout.Tile(**layout_conf),
    layout.Max(),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        # other float of google chrome
        Match(role="pop-up"),
        Match(wm_class="ark"),
        Match(wm_class="krunner"),
        Match(wm_class="gnome-calculator"),
        Match(wm_class="kalk"),
        Match(wm_class="Variety"),
        Match(wm_class="FloatTerm,kitty"),
        Match(wm_class="FloatTermAlacritty"),
        Match(wm_class="knotes"),
        Match(wm_class="pavucontrol"),
        Match(wm_class="Bitwarden"),
        Match(wm_class="merkuro-calendar"),
        Match(role="toolbox"),
        Match(wm_instance_class="DBeaver"),
        Match(wm_instance_class="firefox"),
        Match(wm_instance_class="PacketTracer"),
        Match(title="pinentry"),
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
        Match(wm_class="feh"),
        Match(func=lambda c: c.has_fixed_size()),
        Match(func=lambda c: c.has_fixed_ratio()),
    ],
    border_focus=colors["focus"][0],
)
