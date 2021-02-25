#!/usr/bin/env fish

function pyenv_env
    set zlib (brew --prefix zlib)
    set bzip (brew --prefix bzip2)
    set openssl (brew --prefix openssl)
    set readline (brew --prefix readline)
    set ncurses (brew --prefix ncurses)
    set xcsdk (xcrun --show-sdk-path)
    set -g CFLAGS -I$zlib/include -I$bzip/include -I$openssl/include -I$readline/include -I$ncurses/include -I$xcsdk/usr/include
    set -g LDFLAGS -L$zlib/lib -L$bzip/lib -L$openssl/lib -L$readline/lib -L$ncurses/lib -L$xcsdk/usr/lib
end

# pyenv
if command -v pyenv 1>/dev/null 2>&1
    pyenv init - | source
    pyenv virtualenv-init - | source
end