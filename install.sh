#!/bin/bash
set -x

cd ~/.config/nvim

# dependencies
sudo apt-get install luarocks xsel
sudo bun install --global yarn tree-sitter prettier pyright neovim spectral-language-server
cargo install tree-sitter-cli remark stylua ripgrep fd-find typos-cli
pip install pynvim black isort ruff mypy
go install golang.org/x/tools/gopls@latest
# go install github.com/mattn/efm-langserver@latest # use LspInstall efm

# font install
HAKUGEN_VER="v2.8.0"
wget "https://github.com/yuru7/HackGen/releases/download/${HAKUGEN_VER}/HackGen_NF_${HAKUGEN_VER}.zip"
unzip -D HackGen_NF_${HAKUGEN_VER}.zip
mkdir -p ~/.fonts
cp HackGen_NF_${HAKUGEN_VER}/*.ttf ~/.fonts/
fc-cache -v

rm -f ./HackGen_*.zip
rm -rf ./HackGen_*
