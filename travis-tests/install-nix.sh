#!/usr/bin/env bash

# Assume originally running as root
sudo apt-get update
sudo apt-get -y install bzip2 sudo curl bash

cd "$HOME"
bash <(curl https://nixos.org/nix/install)
mkdir -p $HOME/.nixpkgs
echo '{
  nix.binaryCaches = ["http://hydra.nixos.org/" "http://cache.nixos.org/"];
}' > $HOME/.nixpkgs/config.nix
