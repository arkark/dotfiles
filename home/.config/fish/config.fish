#!/usr/bin/env fish

if test -d $HOME/bin
    set -x PATH $HOME/bin $PATH
end

if test -d $HOME/.local/bin
    set -x PATH $HOME/.local/bin $PATH
end

if test -d $HOME/app/bin
    set -x PATH $HOME/app/bin $PATH
end

# pyenv (deprecated)
if test -d $HOME/.pyenv
    set -x PYENV_ROOT $HOME/.pyenv
    set -x PATH $PYENV_ROOT/bin $PATH
end
if type pyenv >/dev/null 2>&1
    pyenv init - | source
end

# uv (python)
if type uv >/dev/null 2>&1
    alias python="uv run python"
end

# rbenv
if test -d $HOME/.rbenv
    set -x PATH $HOME/.rbenv/bin $PATH
    rbenv init - | source
end

# Go
set -x GOPATH $HOME/.go
if test -d /usr/local/go/bin
    set -x PATH /usr/local/go/bin $PATH
end
if type go >/dev/null 2>&1
    set -x PATH $GOPATH/bin $PATH
end

# npm
if test -d $HOME/.npm-global/bin
    set -x PATH $HOME/.npm-global/bin $PATH
end

# n
#   https://github.com/tj/n
set -x N_PREFIX $HOME/.n-prefix
if test -d $N_PREFIX/bin
    set -x PATH $N_PREFIX/bin $PATH
end

# deno
if test -d $HOME/.deno/bin
    set -x PATH $HOME/.deno/bin $PATH
end

# pdfpc
#   https://github.com/pdfpc/pdfpc
if type pdfpc >/dev/null 2>&1
    # Disable auto detection of overlays
    alias pdfpc="pdfpc --disable-auto-grouping"
end

# starship
#   https://github.com/starship/starship
if type starship >/dev/null 2>&1
    starship init fish | source
end

# eza
#   https://github.com/eza-community/eza
if type eza >/dev/null 2>&1
    alias ls="eza"
    alias ll="eza --long --header --git"
    alias la="eza --long --header --git -a"
    alias l="eza"
    alias lt="eza --tree"
    alias llt="eza --long --header --git --tree"
    alias lat="eza --long --header --git -a --tree"
end

# bat
#   https://github.com/sharkdp/bat
if type bat >/dev/null 2>&1
    alias batp="bat -p"
    alias cat="bat -pp"
end

# mkdir + cd
function mkcd --description "mkdir + cd"
    mkdir $argv && cd $argv[-1]
end

# mksage
if type pyenv >/dev/null 2>&1 # (deprecated)
    function mksage --description "prepare for SageMath"
        mkdir .vscode && echo '{ "editor.formatOnSave": false }' >.vscode/settings.json && pyenv local system
    end
end
if type uv >/dev/null 2>&1
    # TODO
end

# cd in a git repository
function gcd --description "cd in a git repository"
    if git rev-parse --show-toplevel >/dev/null
        if test (count $argv) -le 1
            cd (git rev-parse --show-toplevel)"/$argv"
        else
            set_color red
            echo "Too many arguments"
            set_color normal
        end
    end
end

# open
if type kde-open >/dev/null 2>&1
    # for KDE
    alias open="kde-open"
end

# pbcopy/pbpaste
if type xsel >/dev/null 2>&1
    alias pbcopy="xsel --clipboard --input"
    alias pbpaste="xsel --clipboard --output"
end

# Convert mp4 to gif with gifski
#   https://github.com/ImageOptim/gifski
function mp42gif --description "Convert mp4 to gif with gifski"
    if test (count $argv) -ne 2
        echo "Usage: "
        echo "    mp42gif <INPUT_FILE> <OUTPUT_FILE>"
        return 1
    end
    set --local tmpdir (mktemp -d --tmpdir mp42gif.XXXXXXXXXX) && ffmpeg -i $argv[1] -an -r 30 $tmpdir/%04d.png && gifski -o $tmpdir/tmp.gif --fps 30 $tmpdir/*.png && gifsicle -i $tmpdir/tmp.gif -O3 --colors 256 -o $argv[2] && rm -r $tmpdir
end

# gsed
if test -d /usr/local/opt/gnu-sed/libexec/gnubin
    set -x PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
end

# xargs
if not man xargs | head -n 2 | grep BSD -q
    set -x XARGS_NO_RUN_IF_EMPTY --no-run-if-empty
end

# mouse speed
if type xinput >/dev/null 2>&1
    if xinput list | grep -q "Logitech MX Ergo"
        set mouse_speed 1.9
        xinput set-prop "pointer:Logitech MX Ergo" "Coordinate Transformation Matrix" $mouse_speed, 0, 0, 0, $mouse_speed, 0, 0, 0, 1
        set -e mouse_speed
    end
end

# utils
if type nvim >/dev/null 2>&1
    alias vim="nvim"
end

# shortcut commands
alias e="exit"
alias g="git"
alias k="kubectl"

# typo
alias gits="git s"
alias code.="code ."
alias ks="ls"
alias cd.="cd ."
alias cd..="cd .."

# fish settings
function fish_greeting
end
