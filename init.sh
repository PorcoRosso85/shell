#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
bash <(curl -L https://nixos.org/nix/install) --daemon
sudo apt-get install gh -y

sudo gh auth login

sudo gh repo clone PorcoRosso85/shell
bash ./nvim.sh
bash ./docker.sh