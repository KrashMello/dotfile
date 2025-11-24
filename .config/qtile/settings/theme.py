from os import path
import json

from .path import qtile_path


def load_theme():
    theme = "dark-grey"

    config = path.join(qtile_path, "config.json")
    if path.isfile(config):
        with open(config) as f:
            theme = json.load(f)["theme"]
    else:
        with open(config, "w") as f:
            f.write(f'{{"theme": "{theme}"}}\n')

    theme_file = path.join(qtile_path, "themes", theme, "colors.json")
    if not path.isfile(theme_file):
        raise Exception(f'"{theme_file}" does not exist')

    with open(path.join(theme_file)) as f:
        return json.load(f)


def load_groups():
    config = path.join(qtile_path, "config.json")
    with open(path.join(config)) as f:
        return json.load(f)["groups"]


if __name__ == "settings.theme":
    colors = load_theme()
    groups = load_groups()
