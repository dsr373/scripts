# this will check updates and list available updates
#alias upcheck="sudo apt update; printf '\n\n'; apt list --upgradeable"
alias upcheck="dnf check-update"
# this will update cache and upgrade everything (needs yes)
#alias upall="sudo apt update; printf '\n\n'; sudo apt full-upgrade"
alias upall="sudo dnf upgrade"

# prime switching
alias psi="sudo prime-select intel"
alias psn="sudo prime-select nvidia"
alias psq="prime-select query"

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

alias geary="env GTK_THEME=Adwaita-dark geary"
