#!/usr/bin/env fish

# Enable 10ms timeout for key sequesces
# This is set to fix vim <ESC> recognition
set KEYTIMEOUT 1

# Preferred editor for local and remote sessions
if test -n "$SSH_CONNECTION"
    set VISUAL vi
else
    set VISUAL nvim
end

set EDITOR $VISUAL

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.config/fish/{path,aliases,functions,extra}.fish
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
end