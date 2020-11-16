# 
# Environment variables and PATH
#

# dev home
export DEVPATH="$HOME/dev"
export DEVHOME="$DEVPATH/home"
export PATH="$PATH:$DEVPATH/bin"

# yarn
export YARN="$HOME/.yarn/bin"

# go
export GOPATH="$DEVHOME/go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# android
export ANDROID_SDK_ROOT="$DEVHOME/android"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# java, but android related ;)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"

# yarn
export YARN_HOME="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
export PATH="$PATH:$YARN_HOME"

# deno
export DENO_HOME="$HOME/.deno"
export PATH="$PATH:$DENO_HOME/bin"

# rust
export RUST_HOME="$HOME/.cargo/bin"

# other bins
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/bin/"

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

#
# Aliases and commands
#

# "I won't ever go back"
alias vim='nvim'

# cdf(7)
# change directory to current finder window
cdf() {
  finderPath=$(osascript -e 'tell application "Finder"
                               try
                                   set currentFolder to (folder of the front window as alias)
                               on error
                                   set currentFolder to (path to desktop folder as alias)
                               end try
                               POSIX path of currentFolder  
                            end tell')
  cd "$finderPath" || return
}

# Activate asdf version manager
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# Activate pyenv version manager
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Activate z - jump around utility
. /usr/local/etc/profile.d/z.sh