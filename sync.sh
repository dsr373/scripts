#!/bin/bash

SCR=$HOME/Documents/scripts
cd $HOME

# replaces the files in HOME with (links to) the ones in this folder
for NAME in ".profile" ".bash_aliases" ".bashrc" ".vimrc"; do
    rm -f $NAME
    echo "Linking $SCR/$NAME to $(pwd)/$NAME"
    ln -s $SCR/$NAME ./$NAME
done

# sync the onedrive configs
OD_DIR=$HOME/.config/onedrive
mkdir -p $OD_DIR
cd $OD_DIR

mkdir -p uni
mkdir -p personal

for NAME in "starter" "uni/config" "personal/config"; do
    rm -f $NAME
    echo "Linking $SCR/onedrive/$NAME to $(pwd)/$NAME"
    ln -s $SCR/onedrive/$NAME ./$NAME
done

# sync the fusuma config
FUSUMA_DIR=$HOME/.config/fusuma
mkdir -p $FUSUMA_DIR
cd $FUSUMA_DIR

ln -s $SCR/fusuma/gnome.yml ./config.yml

