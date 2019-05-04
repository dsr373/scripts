# some directory shortcuts
alias gph="cd ~/OneDriveUni/Documents/Physics"
alias ggo="cd ~/go/src/github.com/dsr373"
alias gcv="cd ~/OneDrivePers/Documents/CV/"
alias gcr="cd ~/OneDriveUni/Documents/careers"
alias gcomp="cd ~/OneDriveUni/Documents/Computing"

# this checks if onedrive is working
alias odcheck="ps -fC onedrive"

# this will check updates and list available updates
alias upcheck="sudo apt update; printf '\n\n'; apt list --upgradeable"
# this will update cache and upgrade everything (needs yes)
alias upgradeall="sudo apt update; printf '\n\n'; sudo apt dist-upgrade"

# this restarts plasma
alias replasma="killall plasmashell && kstart plasmashell"

# this launches htop with my prefered settings
alias mytop="htop --delay=50 --sort-key=TIME"
# launch ranger
alias rr="ranger ."
# use neovim!
alias vim="nvim"

# git
function galias {
    alias gs="git status"
    alias ga="git add"
    alias gc="git commit"
    alias gp="git push"
    alias gb="git branch"
    alias gd="git diff"
}

