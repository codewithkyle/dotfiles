#!/usr/bin/env bash

version="0.16.0"

wget https://ziglang.org/download/$version/zig-linux-x86_64-$version.tar.xz
tar -xf zig-linux-x86_64-$version.tar.xz
mkdir $HOME/zig
mv zig-linux-x86_64-$version/zig $HOME/zig/zig
mv zig-linux-x86_64-$version/lib/ $HOME/zig/
ln -sf $HOME/zig/zig /usr/local/bin/zig
