#!/bin/bash
set -x

cd ~/.config/nvim

# dependencies
sudo apt-get install luarocks
sudo npm install --global yarn tree-sitter prettier pyright
cargo install tree-sitter-cli remark stylua ripgrep fd-find typos-cli

# font install
HAKUGEN_VER="v2.8.0"
wget "https://github.com/yuru7/HackGen/releases/download/${HAKUGEN_VER}/HackGen_NF_${HAKUGEN_VER}.zip"
unzip -D HackGen_NF_${HAKUGEN_VER}.zip
mkdir -p ~/.fonts
cp HackGen_NF_${HAKUGEN_VER}/*.ttf ~/.fonts/
fc-cache -v

rm -f ./HackGen_*.zip
rm -rf ./HackGen_*
