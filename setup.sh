#!/bin/bash

set -u

if [ ! -d "$HOME/dotfiles" ]; then
    echo "Clone ArkArk/dotfiles into $HOME"
    exit 1
fi

DOT_FILES=(               \
    .Xmodmap              \
    .bash_profile         \
    .bashrc               \
    .gdbinit              \
    .gitconfig            \
    .inputrc              \
    .emmet/snippets.json   \
    .config/nvim/init.vim \
)

for file in ${DOT_FILES[@]}; do
    mkdir -p $(dirname $HOME/$file)
    ln -sni $HOME/dotfiles/files/$file $HOME/$file
done
