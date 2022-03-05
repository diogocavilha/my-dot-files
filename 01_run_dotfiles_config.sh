#!/bin/bash

# Backup current dot files before applying new configs
mv -vf ~/.bash_aliases ~/.bash_aliases_bkp
mv -vf ~/.vimrc ~/.vimrc_bkp
mv -vf ~/.gitconfig ~/.gitconfig_bkp
mv -vf ~/.config/terminator/config ~/.config/terminator/config_bkp
cp -ivf ~/.bashrc ~/.bashrc_bkp

# Configure dot files
ln -s ~/git/my-dot-files/config/.bash_aliases ~/.bash_aliases
ln -s ~/git/my-dot-files/config/.vimrc ~/.vimrc
ln -s ~/git/my-dot-files/config/.gitconfig ~/.gitconfig
ln -s ~/git/my-dot-files/config/terminator/config ~/.config/terminator/config

# Enable bash colors
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc && . ~/.bashrc
