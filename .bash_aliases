# this will check updates and list available updates
#alias upcheck="sudo apt update; printf '\n\n'; apt list --upgradeable"
alias upcheck="dnf check-update"
# this will update cache and upgrade everything (needs yes)
#alias upall="sudo apt update; printf '\n\n'; sudo apt full-upgrade"
alias upall="sudo dnf upgrade"

# launch ranger
alias rr=". ranger"
# use neovim!
alias vim="nvim"

# clipboard
alias clip="xclip -selection c"

