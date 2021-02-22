#!/usr/bin/env bash

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

#
# Oh-My-Zsh functionality
#

# plugins
plugins=(
  sudo
  colorize
  common-aliases
)

export ZSH="/Users/rossi/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Activate zsh autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#
# CLI prompt
#

# staship prompt (starship.rs)
eval "$(starship init zsh)"

#
# Input
#

# Enable 10ms timeout for key sequesces
# This is set to fix vim <ESC> recognition
KEYTIMEOUT=1

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;