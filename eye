#!/bin/sh

dir="$(pwd)"
scriptsDir="$HOME/Scripts"  # directory in which the eyesaver scripts will be saved
applescriptFile="$scriptsDir/eyesaver_dialog.applescript"
shFile="$scriptsDir/eyesaver.sh"
plist="$dir/com.samarth.eyesaver.plist"
launchPlist="$HOME/Library/LaunchAgents/com.samarth.eyesaver.plist"

init() { \
    [ "$(uname)" != "Darwin" ] && { echo "This script only works for macOS"; exit 1; }

    if [ -f "$launchPlist" ] && [ -f "$shFile" ] && [ -f "$applescriptFile" ]; then
        echo "Script already initialized!"
    else
        cp "$dir/eye" "$HOME/bin/eye" &&  # make sure ~/bin is in $PATH
        echo "osascript $applescriptFile" > "$shFile" &&
        chmod +x "$shFile" &&
        cp "$dir/eyesaver_dialog.applescript" "$applescriptFile" &&
        cp "$plist" "$launchPlist" &&
        echo "eyesaver has been successfully installed"
    fi
}

uninstall() { \
    if [ -f "$launchPlist" ] && [ -f "$shFile" ] && [ -f "$applescriptFile" ]; then
        rm "$HOME/bin/eye" &&
        rm "$applescriptFile" &&
        rm "$shFile" &&
        rm "$launchPlist" &&
        echo "eyesaver has been successfully uninstalled"
    else
        echo "eyesaver has not been installed yet"
    fi
}

resume() { \
    launchctl load "$launchPlist" &&
    echo "eyesaver is running"
}


pause() { \
    launchctl unload "$launchPlist" &&
    echo "eyesaver is paused"
}

status() { \
    stat="$(launchctl list | grep -c eyesaver)"
    if [ "$stat" -eq 0 ]; then
        echo "paused"
    else
        echo "running"
    fi
}

case "$1" in
    i*) init ;;
    u*) uninstall ;;
    r*) resume ;;
    p*) pause ;;
    s*) status ;;
    *) printf "Usage:\n eye i:\t initialize\n eye u:\t uninstall\n eye r:\t resume\n eye p:\t pause\n eye s:\t status\n" ;;
esac
