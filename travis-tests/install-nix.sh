#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y install bzip2 curl bash

cd "${HOME}"
set +x
bash <(curl https://nixos.org/nix/install)
echo "Installation done!"
nix --version
tree "${HOME}"/.n*
mkdir -p ${HOME}/.nixpkgs
echo '{
  nix.binaryCaches = ["http://hydra.nixos.org/" "http://cache.nixos.org/"];
}' > ${HOME}/.nixpkgs/config.nix
