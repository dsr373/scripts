#!/bin/bash

HOME=/home/dans
SCR=$HOME/Documents/scripts
cd $HOME


# replaces the files in HOME with (links to) the ones in this folder
for NAME in ".profile" ".bash_aliases" ".bashrc" ".vimrc"; do
    rm -f $NAME
    echo "Linking $SCR/$NAME to $(pwd)/$NAME"
    ln -s $SCR/$NAME $NAME
done


# sync the onedrive configs
OD_DIR=$HOME/.config/onedrive
cd $OD_DIR

mkdir -p uni
mkdir -p personal

for NAME in "starter" "uni/config" "personal/config"; do
    rm -f $NAME
    echo "Linking $SCR/$NAME to $(pwd)/$NAME"
    ln -s $SCR/onedrive/$NAME ./$NAME
done

