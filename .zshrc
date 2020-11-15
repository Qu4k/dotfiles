# dev home
export DEVPATH="$HOME/dev"
export DEVHOME="$DEVPATH/home"

# yarn
export YARN="$HOME/.yarn/bin"

# go
export GOPATH="$DEVHOME/go"
export GOROOT="$(brew --prefix golang)/libexec"

# android
export ANDROID_SDK_ROOT="$DEVHOME/android"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# java, but android related ;)
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# yarn
export YARN="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

# deno
export DENO="$HOME/.deno"

# rust
export RUST="$HOME/.cargo/bin"

# sbin
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$YARN"
export PATH="$PATH:$DENO/bin"
export PATH="$PATH:$DEVPATH/bin"
export PATH="$PATH:$NODEPATH/bin"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
export PATH="$PATH:/usr/local/bin/"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$QT/bin"
export PATH="$PATH:$NGSPICE/bin"

# # clang fallback libraryes
# export DYLD_FALLBACK_LIBRARY_PATH="/usr/X11/lib:/usr/lib"

export ZSH="/Users/rossi/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# staship prompt (starship.rs)
eval "$(starship init zsh)"

# Enable 10ms timeout for key sequesces
# This is set to fix vim <ESC> recognition
KEYTIMEOUT=1

# ZSH plugins
plugins=(
  git
  brew
  common-aliases
  sudo
  colorize
)

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

alias vim='nvim'

# Utility commands
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

# Activate zsh autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Activate asdf version manager
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# Activate pyenv version manager
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Activate z - jump around utility
. /usr/local/etc/profile.d/z.sh
