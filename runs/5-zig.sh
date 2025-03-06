#!/usr/bin/env bash

version="0.13.0"

wget https://ziglang.org/download/$version/zig-linux-x86_64-$version.tar.xz
tar -xf zig-linux-x86_64-$version.tar.xz
sudo mv zig-linux-x86_64-$version/zig /usr/local/bin/zig

