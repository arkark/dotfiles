#!/usr/bin/env fish

if ! test -d $HOME/dotfiles
    echo "Clone arkark/dotfiles into $HOME"
    exit 1
end

# npm
# yarn
# rustup
# cargo
# aws-cli

# docker
if type docker >/dev/null 2>&1
    echo -e "\e[36m ~/.config/fish/completions/docker.fish\e[0m"
    curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish \
        && echo -e "\e[32m-> succeeded\e[0m"
end

# docker-compose
if type docker-compose >/dev/null 2>&1
    echo -e "\e[36m ~/.config/fish/completions/docker-compose.fish\e[0m"
    curl -L https://raw.githubusercontent.com/docker/compose/v1.25.2/contrib/completion/fish/docker-compose.fish -o ~/.config/fish/completions/docker-compose.fish \
        && echo -e "\e[32m-> succeeded\e[0m"
end

# dub
if type dub >/dev/null 2>&1
    echo -e "\e[36m~/.config/fish/completions/dub.fish\e[0m"
    curl -L https://raw.githubusercontent.com/dlang/dub/v1.20.0/scripts/fish-completion/dub.fish -o ~/.config/fish/completions/dub.fish \
        && echo -e "\e[32m-> succeeded\e[0m"
end


# gradle
if type gradle >/dev/null 2>&1
    echo -e "\e[36m~/.config/fish/completions/gradle.fish\e[0m"
    curl -L https://raw.githubusercontent.com/fish-shell/fish-shell/3.1.0/share/completions/gradle.fish -o ~/.config/fish/completions/gradle.fish \
        && echo -e "\e[32m-> succeeded\e[0m"
end
