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

6. Install additional packages:

```
cd ~/ && git clone https://github.com/codewithkyle/linux-quickstart.git && cd ./linux-quickstart && sudo apt update && sudo apt upgrade -y && sudo add-apt-repository ppa:deadsnakes/ppa && sudo apt update && sudo apt install software-properties-common python-dev python-pip python3-dev python3-pip nodejs zsh -y && sudo chsh -s $(which zsh) && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

7. Install Go

```
wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz && sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz && rm ./go1.18.3.linux-amd64.tar.gm
```

8. Install Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

9. [Install NVM](https://github.com/nvm-sh/nvm#installing-and-updating)

10. Run this Command:

```
cp ./.zshrc ~/ && cp -r ./nvim ~/.config/ && cp ./.p10k.zsh ~/
```

11. Reboot terminal

12. `nvm install --lts`

13. `npm i -g tree-sitter-cli`

14. `vi .`

15. `:PackerSync` to install neovim packages

16. `:CheckHealth` to check neovim's status

17. `:q`
