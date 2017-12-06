#!/usr/bin/env bash

apt-get update
apt-get install -y sudo curl
useradd user
usermod -aG sudo user
mkdir /home/user
echo "user ALL=(ALL) NOPASSWD: ALL" | EDITOR='tee -a' visudo
bash << 'EOF'
set -e
set +x
shopt -s dotglob
mv * /home/user
chown -R user:user /home/user
su user -s /bin/bash -c "cd \$HOME; bash <(curl https://raw.githubusercontent.com/pallavagarwal07/NixCI/master/travis-tests/install-nix.sh)"
EOF
