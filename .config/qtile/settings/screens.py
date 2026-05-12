# Multimonitor support
from libqtile import bar
from .theme import colors
from collections.abc import Callable
from libqtile.config import Output, Screen
from .widgets import primary_widgets  # , secondary_widgets


def status_bar(widgets):
    return bar.Bar(
        widgets, 25, background=colors["background"], padding=3, margin=[0, 0, 3, 0]
    )


fake_screens: list[Screen] | None = None
screens = [Screen(top=status_bar(primary_widgets)), Screen()]
generate_screens: Callable[[list[Output]], list[Screen]] | None = None
