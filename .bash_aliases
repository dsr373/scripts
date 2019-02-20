# some directory shortcuts
alias phdir="cd ~/OneDriveUni/Documents/Physics"
alias godir="cd ~/go/src/github.com/dsr373"
alias cvdir="cd ~/OneDrivePers/Documents/CV/"
alias crdir="cd ~/OneDriveUni/Documents/careers"
alias compdir="cd ~/OneDriveUni/Documents/Computing"

# this starts the onedrive processes or checks if they are working
alias odstart="bash ~/.config/onedrive/starter && ps -fC onedrive"
alias odcheck="ps -fC onedrive"

# this will check updates and list available updates
alias upcheck="sudo apt update && printf '\n\n' && apt list --upgradeable"
# this will update cache and upgrade everything (needs yes)
alias upgradeall="sudo apt update && printf '\n\n' && sudo apt dist-upgrade"

# this restarts plasma
alias replasma="killall plasmashell && kstart plasmashell"

# this launches htop with my prefered settings
alias mytop="htop --delay=50 --sort-key=TIME"

