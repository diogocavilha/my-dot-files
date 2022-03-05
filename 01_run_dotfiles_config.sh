#!/bin/bash

# Backup current dot files before applying new configs
mv -vf ~/.bash_aliases ~/.bash_aliases_bkp
mv -vf ~/.vimrc ~/.vimrc_bkp
cp -ivf ~/.bashrc ~/.bashrc_bkp

# Configure dot files
ln -s ~/git/my-dot-files/.bash_aliases .bash_aliases
ln -s ~/git/my-dot-files/.vimrc .vimrc

# Enable bash colors
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc && . ~/.bashrc
