# some directory shortcuts
alias gph="cd ~/OneDriveUni/Documents/Physics"
alias gpr="cd ~/OneDriveUni/Documents/Proj"
alias ggo="cd ~/go/src/github.com/dsr373"
alias gcv="cd ~/OneDrivePers/Documents/CV/"
alias gcr="cd ~/OneDriveUni/Documents/careers"
alias gcomp="cd ~/OneDriveUni/Documents/Computing"
alias gn="cd ~/MEGA/notes"

# this checks if onedrive is working
alias odcheck="ps -fC onedrive"

# this will check updates and list available updates
#alias upcheck="sudo apt update; printf '\n\n'; apt list --upgradeable"
# this will update cache and upgrade everything (needs yes)
#alias upall="sudo apt update; printf '\n\n'; sudo apt dist-upgrade"
# arch shortcut
alias upall="sudo pacman -Syyu"
alias rm-orphans="pacman -Qqtd | sudo pacman -Rns -"

# prime switching
#alias psi="sudo prime-select intel"
#alias psn="sudo prime-select nvidia"
#alias psq="prime-select query"

alias psi="optimus-manager --switch intel"
alias psn="optimus-manager --switch nvidia"
alias psq="optimus-manager --print-mode"

# this restarts plasma
alias replasma="killall plasmashell && kstart5 plasmashell"
# restart pulse in case audio breaks
alias saund="pulseaudio -k"

# launch ranger
alias rr=". ranger"
# use neovim!
alias vim="nvim"

# clipboard
alias clip="xclip -selection c"

# create git aliases only when you need them
function galias {
    alias gs="git status"
    alias ga="git add"
    alias gc="git commit"
    alias gp="git push"
    alias gb="git branch"
    alias gd="git diff"
}

