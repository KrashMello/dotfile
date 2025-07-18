# Multimonitor support
from libqtile.config import Screen
from libqtile import bar
from libqtile.log_utils import logger
from .theme import colors

# from .theme import colors
from .widgets import primary_widgets  # , secondary_widgets
import subprocess


def status_bar(widgets):
    return bar.Bar(
        widgets, 25, background=colors["background"], padding=3, margin=[0, 0, 3, 0]
    )


screens = [Screen(top=status_bar(primary_widgets),x=1280,y=0,width=1920,height=1080),Screen(x=0,y=0,width=1280,height=1080)]

xrandr = "xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l"

command = subprocess.run(
    xrandr,
    shell=True,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
)

if command.returncode != 0:
    error = command.stderr.decode("UTF-8")
    logger.error(f"Failed counting monitors using {xrandr}:\n{error}")
    connected_monitors = 1
else:
    connected_monitors = int(command.stdout.decode("UTF-8"))

# if connected_monitors > 1:
#     for _ in range(1, connected_monitors):
#         screens.append(Screen(top=status_bar(secondary_widgets)))
