#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y install bzip2 curl bash

cd "${HOME}"
bash <(curl https://nixos.org/nix/install)
mkdir -p ${HOME}/.nixpkgs
echo '{
  nix.binaryCaches = ["http://hydra.nixos.org/" "http://cache.nixos.org/"];
}' > ${HOME}/.nixpkgs/config.nix
