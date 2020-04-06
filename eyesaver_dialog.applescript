tell application "System Events"
	set activeApp to name of first application process whose frontmost is true
	tell process activeApp
		get value of attribute "AXFullScreen" of window 1
	end tell
end tell
if not result then -- result is true if the app is in fullscreen
	display dialog "Save your eyes! Look away from the screen for 20 seconds (preferably at something 20 feet away)" with title "eyesaver" buttons {"Ignore"} giving up after 20
end if
