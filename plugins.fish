#!/usr/bin/env fish

if ! type -q fisher
    echo "Installing fisher"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

fisher install jorgebucaran/nvm.fish