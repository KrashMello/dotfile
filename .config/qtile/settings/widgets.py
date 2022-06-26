from libqtile import widget
from .theme import colors

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)

def spacer():
    return widget.Spacer()


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=4
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
      
	    text="",
        fontsize=25,
        padding=18
    )

def powerline_mirror(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
      
        text="",
        width=50,
        fontsize=25,
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


def workspaces(): 
    return [
      
      
        widget.GroupBox(
            **base(fg='dark',bg='primary'),
            font='UbuntuMono Nerd Font',
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=True,
            highlight_method='text',
            urgent_alert_method='text',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['focus'],
            other_screen_border=colors['primary'],
            disable_drag=True,
        ),
      
      
      
    ]

primary_widgets = [
    corner_left('dark', 'primary'),
    widget.Sep(padding=180, linewidth=0, **base(bg='primary',fg='primary')),
    *workspaces(),
    powerline_mirror('primary', 'dark'),
    spacer(),
    widget.Image(filename='~/.config/qtile/assets/center-logo.png'),
    spacer(),
  

    powerline('primary', 'dark'),

    icon(bg="primary",fg='secondary', text=' '), # Icon: nf-fa-download
    
    widget.CheckUpdates(
        background=colors['primary'],
        colour_have_updates=colors['urgent'],
        colour_no_updates=colors['light'],
        no_update_string='0',
        display_format='{updates}',
        update_interval=1800,
        custom_command='checkupdates',
    ),
   widget.Sep(**base(bg='primary'), linewidth=0, padding=5),
    widget.Sep(**base(bg='primary'), linewidth=0, padding=5),
    icon(bg="primary",fg='secondary', text=' '),
    widget.CPU(**base(bg='primary',fg='light'), format='{load_percent}% '),
    icon(bg="primary",fg='secondary', text=' '),
    widget.Memory(**base(bg='primary',fg='light'),format=' {MemUsed: .0f}{mm} '),  
    widget.Sep(**base(bg='primary'), linewidth=0, padding=5),
    icon(bg="primary",fg='secondary', text=' '),
    widget.Clock(**base(bg='primary', fg='light'), format='%d/%m/%Y '),
    icon(bg="primary",fg='secondary', text=' '),
    widget.Clock(**base(bg='primary', fg='light'), format='%I:%M %p '),
    widget.Sep(**base(bg='primary'), linewidth=0, padding=5),
    widget.Systray(background=colors['primary'], padding=5),
    widget.Sep(padding=6, linewidth=1, **base(bg='primary',fg='color1')),
    corner_right('dark', 'primary'),
    
]

secondary_widgets = [
    *workspaces(),

    separator(),

    powerline('primary', 'dark'),
    widget.StockTicker(),




    powerline('color2', 'primary'),
    widget.Pomodoro(),


    powerline('dark', 'color2'),
]



widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()