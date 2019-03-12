# eyesaver
A simple tool for MacOS to combat eyestrain.

## Description
Eyesaver displays a system dialog every twenty minutes to remind you to look away from the screen for twenty seconds. The dialog will disappear automatically after twenty seconds.

While the name of this repository is `eyesaver`, the actual program is a bash script called `eye` for short.

## Setup
Clone the repository and run

    chmod +x eye && ./eye i

to initialize the script.

This will install the `eye` script in `$HOME/bin`, so make sure `$HOME/bin` is in your `$PATH`.

Simply run `eye` to see more options.

## Sources
[This link](https://alvinalexander.com/mac-os-x/mac-osx-startup-crontab-launchd-jobs) was really helpful for figuring out how to use the `launchd` utility.
