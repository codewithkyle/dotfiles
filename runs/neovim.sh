#!/usr/bin/env bash

git clone -b v0.10.2 https://github.com/neovim/neovim.git $HOME/software/neovim
sudo apt install cmake gettext lua5.1 liblua5.1-0-dev

cd $HOME/software/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
