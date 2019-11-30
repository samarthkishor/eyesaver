#!/bin/sh

dir="$(pwd)"
script="$dir/eyesaver.sh"
plist="$dir/com.samarth.eyesaver.plist"
launchPlist="$HOME/Library/LaunchAgents/com.samarth.eyesaver.plist"

init() { \
    [ "$(uname)" != "Darwin" ] && { echo "This script only works for macOS"; exit 1; }

    if [ -f "$launchPlist" ]; then
        echo "Script already initialized!"
    else
        chmod +x "$script"
        cp "$dir/eye" "$HOME/bin/eye"
        cp "$plist" "$launchPlist"
    fi
}

resume() { \
    cd "$HOME/Library/LaunchAgents/" && launchctl load com.samarth.eyesaver.plist
    echo "eyesaver is running"
}


pause() { \
    cd "$HOME/Library/LaunchAgents/" && launchctl unload com.samarth.eyesaver.plist
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
    r*) resume ;;
    p*) pause ;;
    s*) status ;;
    *) printf "Usage:\n eye i:\t initialize\n eye r:\t resume\n eye p:\t pause\n eye s:\t status\n" ;;
esac
