#!/bin/bash
sudo apt-get update && sudo apt-get upgrade
bash <(curl -L https://nixos.org/nix/install) --daemon
