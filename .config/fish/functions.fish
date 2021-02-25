#!/usr/bin/env fish

# cdf(7)
# change directory to current finder window
function cdf
    set finderPath (osascript -e 'tell application "Finder"
                    try
                        set currentFolder to (folder of the front window as alias)
                    on error
                        set currentFolder to (path to desktop folder as alias)
                    end try
                    POSIX path of currentFolder  
                end tell')
    cd "$finderPath" || return
end