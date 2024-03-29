# Linux Quick Start Guide

1. Install build prerequisites

```
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
```

2. Clone neovim repo

```
cd ~/ && git clone https://github.com/neovim/neovim
```

3. Compile neovim

```
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
```

4. Install neovim

```
sudo make install
```

5. Cleanup

```
cd ../ && rm -rf ./neovim
```

6. Install Zsh

```
sudo apt install zsh nodejs -y && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

7. [Install NVM](https://github.com/nvm-sh/nvm#installing-and-updating)

8. Reboot terminal

9. Install additional packages:

```
cd ~/ && git clone https://github.com/codewithkyle/linux-quickstart.git && cd ./linux-quickstart
sudo apt update && sudo apt upgrade -y
sudo add-apt-repository ppa:deadsnakes/ppa && sudo apt update 
sudo apt install software-properties-common python3 python3-pip ripgrep -y
sudo chsh -s $(which zsh) 
```

10. [Install Go](https://go.dev/doc/install)

```
wget https://go.dev/dl/go1.x.x.linux-amd64.tar.gz && sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.x.x.linux-amd64.tar.gz && rm ./go1.x.x.linux-amd64.tar.gz
```

11. Install Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

12. Run this Command:

```
cp ./.zshrc ~/ && mkdir ~/.config/nvim && cp -r ./nvim/* ~/.config/nvim/ && cp ./gruvbox.zsh-theme ~/.oh-my-zsh/custom/themes/
```

12. Reboot terminal

13. `nvm install --lts`

14. `npm i -g neovim`

15. Install Packer

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

16. `vi ~/.config/nvim/lua/config/packer.lua`

17. `:so` 

18. `:PackerSync` to install neovim packages

19. `:CheckHealth` to check neovim's status

20. `:q`

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
```
