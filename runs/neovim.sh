#!/usr/bin/env bash

git clone -b v0.10.2 https://github.com/neovim/neovim.git $HOME/software/neovim
sudo apt install cmake gettext lua5.1 liblua5.1-0-dev ripgrep -y

cd $HOME/software/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
