#!/usr/bin/env bash

version="1.24.0"

wget https://go.dev/dl/go$version.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go$version.linux-amd64.tar.gz
rm ./go$version.linux-amd64.tar.gz
