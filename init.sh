#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y

devbox() {
    sudo systemctl stop nix-daemon.service
    sudo systemctl disable nix-daemon.socket nix-daemon.service
    sudo systemctl daemon-reload

    items_deleted=(
        "/etc/bashrc"
        "/etc/bashrc.backup-before-nix"
        "/etc/profile.d/nix.sh"
        "/etc/profile.d/nix.sh.backup-before-nix"
        "/etc/profile.d/nix.sh.backup-before-nix"
        "/etc/zshrc"
        "/etc/zshrc.backup-before-nix"
        "/etc/bash.bashrc"
        "/etc/bash.bashrc.backup-before-nix"
        "/etc/nix"
        "/nix"
        "/var/root/.nix-profile"
        "/var/root/.nix-defexpr"
        "/var/root/.nix-channels"
        "/Users/simonbein/.nix-profile"
        "/Users/simonbein/.nix-defexpr"
        "/Users/simonbein/.nix-channels"
    )

# ファイルとディレクトリを順番に削除するループ
    for item in "${items_deleted[@]}"; do
        sudo rm -rf "$item"
    done

    for i in $(seq 1 32); do
      sudo userdel nixbld$i
    done
    sudo groupdel nixbld

    bash <(curl -L https://nixos.org/nix/install) --daemon
    curl -fsSL https://get.jetpack.io/devbox | bash
}
devbox

sudo apt-get install gh -y


curl -sS https://raw.githubusercontent.com/PorcoRosso85/shell/main/nvim.sh | bash
curl -sS https://raw.githubusercontent.com/PorcoRosso85/shell/main/docker.sh | bash
sudo rm ./y