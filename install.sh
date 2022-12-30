#!/bin/bash
set -x

cd ~/.config/nvim

# dependencies
sudo apt-get install luarocks
sudo npm install --global yarn tree-sitter prettier pyright
cargo install tree-sitter-cli remark stylua ripgrep fd-find

# font install
HAKUGEN_VER = "v2.8.0"
wget "https://github.com/yuru7/HackGen/releases/download/${HAKUGEN_VER}/HackGen_${HAKUGEN_VER}.zip"
unzip -D HackGen_${HAKUGEN_VER}.zip
mkdir -p ~/.fonts
cp HackGen_${HAKUGEN_VER}/*.ttf ~/.fonts/
fc-cache -v

rm -f ./HackGen_*.zip
rm -rf ./HackGen_*
