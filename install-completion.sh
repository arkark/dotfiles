#!/bin/bash

set -u

if [ ! -d "$HOME/dotfiles" ]; then
    echo "Clone ArkArk/dotfiles into $HOME"
    exit 1
fi

# docker
if type docker >/dev/null 2>&1; then
    echo -e "\e[36m/etc/bash_completion.d/docker\e[0m"
    sudo curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker \
        && echo -e "\e[32m-> succeeded\e[0m"
fi

# docker-compose
if type docker-compose >/dev/null 2>&1; then
    echo -e "\e[36m/etc/bash_completion.d/docker-compose\e[0m"
    sudo curl -L https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose \
        && echo -e "\e[32m-> succeeded\e[0m"
fi

# npm
if type npm >/dev/null 2>&1; then
    echo -e "\e[36m/etc/bash_completion.d/npm\e[0m"
    npm completion > tmp/npm-completion.bash \
        && sudo cp tmp/npm-completion.bash /etc/bash_completion.d/npm \
        && echo -e "\e[32m-> succeeded\e[0m"
fi

# yarn
if type yarn >/dev/null 2>&1; then
    echo -e "\e[36m/etc/bash_completion.d/yarn\e[0m"
    sudo curl -L https://raw.githubusercontent.com/dsifford/yarn-completion/master/yarn-completion.bash -o /etc/bash_completion.d/yarn \
        && echo -e "\e[32m-> succeeded\e[0m"
fi

# rustup
if type rustup >/dev/null 2>&1; then
    echo -e "\e[36m/etc/bash_completion.d/rustup\e[0m"
    rustup completions bash rustup > tmp/rustup-completion.bash \
        && sudo cp tmp/rustup-completion.bash /etc/bash_completion.d/rustup \
        && echo -e "\e[32m-> succeeded\e[0m"
fi

# cargo
if type rustup >/dev/null 2>&1 && type cargo >/dev/null 2>&1; then
    echo -e "\e[36m/etc/bash_completion.d/cargo\e[0m"
    rustup completions bash cargo > tmp/cargo-completion.bash \
        && sudo cp tmp/cargo-completion.bash /etc/bash_completion.d/cargo \
        && echo -e "\e[32m-> succeeded\e[0m"
fi

# dub
if type dub >/dev/null 2>&1; then
    echo -e "\e[36m/etc/bash_completion.d/dub\e[0m"
    sudo curl -L https://raw.githubusercontent.com/dlang/dub/765cf8ea8bec9b8da05e41e4987f1b37f02305bc/scripts/bash-completion/dub.bash -o /etc/bash_completion.d/dub \
        && echo -e "\e[32m-> succeeded\e[0m"
fi

# aws-cli
if type aws_completer > /dev/null 2>&1; then
    echo -e "\e[36m/etc/bash_completion.d/aws\e[0m"
    echo "complete -C '$(which aws_completer)' aws" | sudo tee /etc/bash_completion.d/aws > /dev/null \
        && echo -e "\e[32m-> succeeded\e[0m"
fi

