#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
bash <(curl -L https://nixos.org/nix/install) --daemon
