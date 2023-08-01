#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
bash <(curl -L https://nixos.org/nix/install) --daemon
curl -fsSL https://get.jetpack.io/devbox | bash
sudo apt-get install gh -y


curl -sS https://raw.githubusercontent.com/PorcoRosso85/shell/main/nvim.sh | bash
curl -sS https://raw.githubusercontent.com/PorcoRosso85/shell/main/docker.sh | bash
