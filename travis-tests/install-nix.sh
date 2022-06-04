#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y install bzip2 curl bash

cd "${HOME}"
set +x
sudo install -d -m755 -o $(id -u) -g $(id -g) /nix
curl -L https://nixos.org/nix/install | sh
. /home/user/.nix-profile/etc/profile.d/nix.sh
echo "Installation done!"
nix --version
tree "${HOME}"/.n*
mkdir -p ${HOME}/.nixpkgs
echo '{
  nix.binaryCaches = ["http://hydra.nixos.org/" "http://cache.nixos.org/"];
}' > ${HOME}/.nixpkgs/config.nix
