#!/usr/bin/env fish

set PATH "$HOME/bin:$PATH"

# dev home
set DEV_PATH "$HOME/dev"
set DEV_HOME "$DEV_PATH/home"
set PATH "$PATH:$DEV_HOME/bin"

# brew
set PATH "/usr/local/bin:/usr/local/sbin:$PATH"

# python
set PYENV_ROOT "$HOME/.pyenv"
set PATH "$PATH:$PYENV_ROOT/bin"

# go
set GOPATH "$DEV_HOME/go"
set GOROOT "/usr/local/opt/go/libexec"
set PATH "$PATH:$GOPATH/bin:$GOROOT/bin"

# rust
set RUST_HOME "$HOME/.cargo/bin"