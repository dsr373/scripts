# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -f "$HOME/.vimrc" ]; then
    export VIMRC="$HOME/.vimrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# include gems to path
gempath="/home/dans/.gem/ruby/2.7.0/bin"
if [ -d "$gempath" ] ; then
    export PATH="$PATH:$gempath"
fi

# set PATH to include go binaries
if [ -d "$HOME/go/bin" ]; then
    export PATH="$PATH:$HOME/go/bin"
fi

if [ -d "$HOME/go" ]; then
    export GOPATH="$HOME/go"
fi

if [ -d "$HOME/Documents/scripts" ]; then
    export scripts="$HOME/Documents/scripts"
fi

# set TERMCMD
export TERMCMD=konsole

# set qt5 theme under something not KDE
# export QT_STYLE_OVERRIDE=kvantum
. "$HOME/.cargo/env"
