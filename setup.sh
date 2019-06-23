#!/bin/bash

set -u

if [ ! -d "$HOME/dotfiles" ]; then
    echo "Clone dotfiles into $HOME"
    exit 1
fi

DOT_FILES=( .Xmodmap .bash_profile .bashrc .gdbinit .gitconfig .inputrc .powerline-shell.json .prettierignore emmet )

for file in ${DOT_FILES[@]}; do
    ln -sni $HOME/dotfiles/$file $HOME/$file
done

