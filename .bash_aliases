# some directory shortcuts
alias gn="cd ~/Nextcloud/notes; source .cmds"

# this checks if onedrive is working
alias odcheck="ps -fC onedrive"

# this will check updates and list available updates
alias upcheck="sudo apt update; printf '\n\n'; apt list --upgradeable"
# this will update cache and upgrade everything (needs yes)
alias upall="sudo apt update; printf '\n\n'; sudo apt full-upgrade"
# arch shortcut
# alias upall="yay -Syyu"
alias rm-orphans="pacman -Qqtd | sudo pacman -Rns -"

# prime switching
alias psi="sudo prime-select intel"
alias psn="sudo prime-select nvidia"
alias psq="prime-select query"

# alias psi="optimus-manager --switch intel"
# alias psn="optimus-manager --switch nvidia"
# alias psq="optimus-manager --status"

# this restarts plasma
alias replasma="plasmashell --replace &"
alias rekwin="kwin_x11 --replace &"
# restart pulse in case audio breaks
alias saund="pulseaudio -k"

# launch ranger
alias rr=". ranger"
# use neovim!
alias vim="nvim"

# clipboard
alias clip="xclip -selection c"

