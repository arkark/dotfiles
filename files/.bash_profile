# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# golang
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# pip
USER_BASE_PATH=$(python -m site --user-base)
export PATH="$USER_BASE_PATH/bin:$PATH"

# selenium
export PATH="$HOME/app/selenium:$PATH"

# pkcrack
export PATH="$HOME/app/pkcrack-1.2.2/bin:$PATH"

# npm
export PATH="$HOME/.npm-global/bin:$PATH"

# n - https://github.com/tj/n
export N_PREFIX="$HOME/.n-prefix"
export PATH="$N_PREFIX/bin:$PATH"

# composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# less setting
# @require: source-highlight
export LESS=' -R '
export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"

# mcfly
#   https://github.com/cantino/mcfly
export PATH="$HOME/app/mcfly/target/release:$PATH"

# enhancd
#   https://github.com/b4b4r07/enhancd
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HOME=1

# pdfpc
export PATH="$HOME/app/pdfpc-4.3.2/build/bin:$PATH"

# flutter
export PATH="$HOME/app/flutter/bin:$PATH"

# dlang
export PATH="$HOME/dlang/dmd-2.089.0/linux/bin64:$PATH"

