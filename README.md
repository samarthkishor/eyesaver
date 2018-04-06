# eyesaver
A simple tool for MacOS to combat eyestrain.

## Description
Eyesaver displays a system dialog every twenty seconds to remind you to look away from the screen.

## Setup
First, save the `eyesaver.sh` file to some location where you can find it. I saved it to my `~/Scripts` directory.

From there, `cd` into the directory where you saved the file and run the command

  chmod +x eyesaver.sh

to make the script executable.

If the script executed successfully, navigate to the `~/Library/LaunchAgents` directory and download the `com.samarth.eyesaver.plist` file. Rename the file to something else if you prefer.

To configure the `plist` file for your machine, edit line 10 where it says

```xml
<string>/Users/samarth/Scripts/eyesaver.sh</string>
```

and change the path to point where you saved the `eyesaver.sh` script.

After that, save the `plist` file and run

  launchctl load com.samarth.eyesaver.plist

while still in the `~/Library/LaunchAgents` directory. If you see a system dialog pop up, it worked. To unload the job, simply run 

  launchctl unload com.samarth.eyesaver.plist


## Sources
[This link](https://alvinalexander.com/mac-os-x/mac-osx-startup-crontab-launchd-jobs) was really helpful for figuring out how to use the `launchd` utility.
