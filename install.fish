#!/usr/bin/env fish

cd (dirname (status -f))

function install
    echo "Syncing files"
    rsync --exclude ".git/" \
        --exclude ".macos" \
        --exclude "keyboard" \
        --exclude "terminal" \
        --exclude "theme" \
        --exclude "install.fish" \
        --exclude "plugins.fish" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        -ah --no-perms . ~
    echo "Installing plugins"
    source plugins.fish
end

if test "$argv[1]" = "--force"
    install
else
    read -lP "This may overwrite existing files in your home directory. Are you sure? (y/N) " confirm
    switch $confirm
        case Y y
            install
        case '' N n
            exit
    end
end