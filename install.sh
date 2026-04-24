#!/bin/bash
set -x


# uv

curl -LsSf https://astral.sh/uv/install.sh | sh

# mise

curl https://mise.run | sh
mise use -g tree-sitter

# bun

curl -fsSL https://bun.com/install | bash

# rustup cargo

curl https://sh.rustup.rs -sSf | sh

# dependencies

sudo apt-get install luarocks xsel
sudo bun install --global yarn tree-sitter prettier pyright neovim spectral-language-server
cargo install remark stylua ripgrep fd-find typos-cli bob-nvim
uv install pynvim black isort ruff mypy ty

# nvim

bob install nightly
bob install latest

# font install

cd /tmp

wget "https://github.com/yuru7/moralerspace/releases/download/v2.0.0/MoralerspaceHWJPDOC_v2.0.0.zip"
unzip -D MoralerspaceHWJPDOC_v2.0.0.zip
mkdir -p ~/.fonts
cp MoralerspaceHWJPDOC_v2.0.0/*.ttf ~/.fonts/
fc-cache -v

rm -f ./MoralerspaceHWJPDOC_*.zip
rm -rf ./MoralerspaceHWJPDOC_*
