#!/bin/bash

# Installing config files
cp -vf ~/.my-dot-files/home/.gitconfig ~
cp -vf ~/.my-dot-files/home/.bash_aliases ~
cp -vf ~/.my-dot-files/home/.bashrc ~
cp -vf ~/.my-dot-files/home/.vimrc ~
cp -vf ~/.my-dot-files/home/.config/starship.toml ~/.config/starship.toml

mkdir -p ~/.config/terminator/
cp -vf ~/.my-dot-files/home/.config/terminator/config ~/.config/terminator/config

mkdir -p ~/.config/redshift/
cp -vf ~/.my-dot-files/home/.config/redshift/redshift.conf ~/.config/redshift/redshift.conf
