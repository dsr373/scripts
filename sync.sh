#!/bin/bash

HOME=~

# replaces the files in HOME with (links to) the ones in this folder
for NAME in ".profile" ".bash_aliases" ".bashrc" ".vimrc"; do
    rm $HOME/$NAME
    ln -s $NAME $HOME/$NAME
done
