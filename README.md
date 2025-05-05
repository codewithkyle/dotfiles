# Install

Start by running `./run.sh` to install packages and software.

Then run `./dev-env.sh` to configure the environment.

> **Note**: the dev environment setup currently uses the "Berkeley Mono Variable" font which is not provided by this repo. Download the font and place in the `Berkeley-Mono/` directory as `Berkeley-Mono-Variable.otf` before running the `./dev-env.sh` script.

# Windows Terminal Settings

1. Open Settings -> Color Schemes

2. Edit JSON file

3. Add to `schemes` section:

```json
{
    "background": "#282828",
    "black": "#0C0C0C",
    "blue": "#458588",
    "brightBlack": "#767676",
    "brightBlue": "#83A598",
    "brightCyan": "#8EC07C",
    "brightGreen": "#B8BB26",
    "brightPurple": "#D3869B",
    "brightRed": "#FB4934",
    "brightWhite": "#EBDBB2",
    "brightYellow": "#FABD2F",
    "cursorColor": "#FFFFFF",
    "cyan": "#689D6A",
    "foreground": "#EBDBB2",
    "green": "#98971A",
    "name": "gruvbox",
    "purple": "#B16286",
    "red": "#CC241D",
    "selectionBackground": "#FFFFFF",
    "white": "#A89984",
    "yellow": "#D79921"
}
