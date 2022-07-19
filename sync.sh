#!/bin/bash

SCR=$HOME/Documents/scripts
cd $HOME

# replaces the files in HOME with (links to) the ones in this folder
for NAME in ".profile" ".bash_aliases" ".tmux.conf"; do
    mv $NAME $NAME.bak
    echo "Linking $SCR/$NAME to $(pwd)/$NAME"
    ln -s $SCR/$NAME ./$NAME
done

# distro specific .bashrc
mv .bashrc .bashrc.bak
ln -s $SCR/$1/.bashrc .bashrc

# gitconfig
cat "$SCR/.gitconfig" >> .gitconfig

# neovim setup
ln -s $SCR/.vimrc $(pwd)/.config/nvim/init.vim

# sync the onedrive configs
# OD_DIR=$HOME/.config/onedrive
# mkdir -p $OD_DIR
# cd $OD_DIR

# mkdir -p uni
# mkdir -p personal

#for NAME in "starter" "uni/config" "personal/config"; do
#    rm -f $NAME
#    echo "Linking $SCR/onedrive/$NAME to $(pwd)/$NAME"
#    ln -s $SCR/onedrive/$NAME ./$NAME
#done

# sync the fusuma config
FUSUMA_DIR=$HOME/.config/fusuma
mkdir -p $FUSUMA_DIR
cd $FUSUMA_DIR

ln -s $SCR/fusuma/kde.yml ./config.yml

# put desktops into path
ln -s $SCR/desktops $HOME/.local/bin/desktops
ln -s $SCR/dockevolution $HOME/.local/bin/dockevolution

