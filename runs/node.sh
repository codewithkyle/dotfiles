#!/usr/bin/env bash

sudo apt install nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install --lts
npm i -g neovim
