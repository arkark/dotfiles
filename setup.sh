#!/usr/bin/env bash

set -u

if [ ! -d "$HOME/dotfiles" ]; then
    echo "Clone arkark/dotfiles into $HOME"
    exit 1
fi

DOT_PATHS=(                  \
    .gitconfig               \
    .inputrc                 \
    .imwheelrc               \
    .Xmodmap                 \
    .sage/init.sage          \
    .config/git              \
    .config/nvim             \
    .config/fish/config.fish \
    .config/starship.toml    \
)

for path in ${DOT_PATHS[@]}; do
    mkdir -p $(dirname $HOME/$path)
    ln -sni $HOME/dotfiles/home/$path $HOME/$path
done
