#!/bin/bash

cp -ivf ~/.bashrc ~/.bashrc.bkp

# Enable bash colors
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc && . ~/.bashrc

apt install -y vim \
    software-properties-common \
    python-software-properties \
    meld \
    terminator \
    tree \
    screenfetch \
    htop \
    gource \
    curl \
    xsel \
    lynx
