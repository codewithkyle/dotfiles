#!/usr/bin/env bash

tag="v1.1.2"

sudo apt install libgtk-4-dev libadwaita-1-dev git blueprint-compiler -y
git clone https://github.com/ghostty-org/ghostty
cd ghostty
git checkout $tag
zig build -Doptimize=ReleaseFast
sudo mv zig-out/bin/ghostty $HOME/.local/bin/ghostty
