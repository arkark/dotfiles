#!/usr/bin/env bash

set -u

if [ ! -d "$HOME/dotfiles" ]; then
    echo "Clone arkark/dotfiles into $HOME"
    exit 1
fi

DOT_PATHS=(                  \
    .bash_profile            \
    .bashrc                  \
    .hyper.js                \
    .gdbinit                 \
    .gitconfig               \
    .gitignore_global        \
    .inputrc                 \
    .imwheelrc               \
    .Xmodmap                 \
    .emmet/snippets.json     \
    .config/nvim             \
    .config/fish/config.fish \
    .config/starship.toml    \
)

for path in ${DOT_PATHS[@]}; do
    mkdir -p $(dirname $HOME/$path)
    ln -sni $HOME/dotfiles/home/$path $HOME/$path
done
