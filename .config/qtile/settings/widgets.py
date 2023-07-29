# from libqtile import widget
from qtile_extras import widget
from .theme import colors
from libqtile import bar
from qtile_extras.widget.decorations import RectDecoration
# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)


def base(fg='text', bg='dark'):
    return {
        'foreground': colors[fg],
        'background': colors[bg],
    }


def separator():
    return widget.sep(**base(), linewidth=0, padding=5)


def spacer(length=bar.STRETCH):
    return widget.Spacer(length=length, background='#00000000')


def icon(fg='text', bg='dark', fontsize=16, text="?", decorations=[]):
    return widget.TextBox(
        foreground=colors[fg],
        background=bg,
        fontsize=fontsize,
        text=text,
        padding=12,
        decorations=decorations,
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),

        text=" ",
        width=55,
        fontsize=25,
        padding=24
    )


def powerline_mirror(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),

        text=" ",
        width=60,
        fontsize=30,
        padding=-1
    )


def corner_left(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),

        text=" ",
        fontsize=50,
        padding=-5
    )


def corner_right(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),

        text=" ",
        fontsize=50,
        padding=-5
    )


decor_group = {
    "decorations": [
        RectDecoration(colour=colors['primary'],
                       filled=True, group=True, radius=11),
    ],
}

decor_groupbox = {
    "decorations": [
        RectDecoration(colour=colors['primary'], radius=11,
                       filled=True, ),
    ],
    "padding": 18
}


def workspaces():
    return [
        widget.GroupBox(
            background="#00000000",
            font='UbuntuMono Nerd Font',
            fontsize=14,
            margin_y=2,
            margin_x=10,
            padding_y=6,
            padding_x=0,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='text',
            urgent_alert_method='text',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['focus'],
            other_screen_border=colors['primary'],
            disable_drag=True,
            **decor_groupbox
        ),
    ]


primary_widgets = [
    widget.LaunchBar(default_icon='/home/krashmello/.config/qtile/assets/logo64x64_dark.png',
                     progs=[('rofy', 'rofi -show drun')], padding=5),
    spacer(length=15),
    *workspaces(),
    spacer(),

    icon(bg="#00000000", fg='focus', fontsize=14, text=' ', **decor_group),
    widget.CheckUpdates(
        background=colors['primary'],
        colour_have_updates=colors['urgent'],
        colour_no_updates=colors['text'],
        no_update_string='0',
        display_format='{updates}',
        update_interval=1800,
        custom_command='checkupdates', **decor_group

    ),
    widget.Sep(**base(bg='primary'), linewidth=0, padding=5, **decor_group
               ),
    icon(bg="#00000000", fg='focus', fontsize=14, text=' ', **decor_group
         ),
    widget.CPU(**base(bg='primary', fg='text'), fontsize=14, format='{load_percent}% ', **decor_group
               ),
    icon(bg="#00000000", fg='focus', fontsize=14, text=' ', **decor_group
         ),
    widget.Memory(**base(bg='primary', fg='text'), fontsize=14, format='{MemUsed: .0f}{mm} ', **decor_group
                  ),
    icon(bg="#00000000", fg='focus', fontsize=14, text=' ', **decor_group
         ),
    widget.Clock(background="#00000000", foreground=colors['text'], fontsize=14, format='%d/%m/%Y ', **decor_group
                 ), 
    icon(bg="#00000000", fg='focus', fontsize=14, text=' ', **decor_group
         ),
    widget.Clock(background="#00000000", foreground=colors['text'], format='%I:%M %p ',**decor_group
    ),
    widget.Systray(background='#00000000', padding=5),
    # corner_right('dark', 'primary'),

]

secondary_widgets = [
    widget.LaunchBar(default_icon='/home/krashmello/.config/qtile/assets/logo64x64_dark.png',
                     progs=[('rofy', 'rofi -show drun')]),
    spacer(length=15),
    *workspaces(),
    spacer(),

    icon(bg="#00000000", fg='focus', fontsize=14, text=' ', **decor_group),
    widget.CheckUpdates(
        background=colors['primary'],
        colour_have_updates=colors['urgent'],
        colour_no_updates=colors['text'],
        no_update_string='0',
        display_format='{updates}',
        update_interval=1800,
        custom_command='checkupdates', **decor_group

    ),
    widget.Sep(**base(bg='primary'), linewidth=0, padding=5, **decor_group
               ),
    icon(bg="#00000000", fg='focus', fontsize=14, text=' ', **decor_group
         ),
    widget.CPU(**base(bg='primary', fg='text'), fontsize=14, format='{load_percent}% ', **decor_group
               ),
    icon(bg="#00000000", fg='focus', fontsize=14, text=' ', **decor_group
         ),
    widget.Memory(**base(bg='primary', fg='text'), fontsize=14, format='{MemUsed: .0f}{mm} ', **decor_group
                  ),
    icon(bg="#00000000", fg='focus', fontsize=14, text=' ', **decor_group
         ),
    widget.Clock(background="#00000000", foreground=colors['text'], fontsize=14, format='%d/%m/%Y ', **decor_group
                 ),
    widget.Systray(background='#00000000', padding=5),
]


widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
