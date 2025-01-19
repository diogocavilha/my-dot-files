#!/bin/bash

. ~/.my-dot-files/scripts/respect-shell.sh

respect.title "Installing config files"
cp -vf ../home/.gitconfig ~
cp -vf ../home/.bash_aliases ~
cp -vf ../home/.bashrc ~
cp -vf ../home/.vimrc ~
cp -vf ../home/.config/terminator/config ~/.config/terminator/config
cp -vf ../home/.config/redshift/redshift.conf ~/.config/redshift/redshift.conf
