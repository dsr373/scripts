# some directory shortcuts
alias gph="cd ~/OneDriveUni/Documents/Physics"
alias ggo="cd ~/go/src/github.com/dsr373"
alias gcv="cd ~/OneDrivePers/Documents/CV/"
alias gcr="cd ~/OneDriveUni/Documents/careers"
alias gcomp="cd ~/OneDriveUni/Documents/Computing"
alias gn="cd ~/MEGA/notes"

# this checks if onedrive is working
alias odcheck="ps -fC onedrive"

# this will check updates and list available updates
alias upcheck="sudo apt update; printf '\n\n'; apt list --upgradeable"
# this will update cache and upgrade everything (needs yes)
alias upall="sudo apt update; printf '\n\n'; sudo apt dist-upgrade"

# prime switching
alias psi="sudo prime-select intel"
alias psn="sudo prime-select nvidia"
alias psq="prime-select query"

# this restarts plasma
alias replasma="killall plasmashell && kstart5 plasmashell"

# launch ranger
alias rr="ranger ."
# use neovim!
alias vim="nvim"

# create git aliases only when you need them
function galias {
    alias gs="git status"
    alias ga="git add"
    alias gc="git commit"
    alias gp="git push"
    alias gb="git branch"
    alias gd="git diff"
}

