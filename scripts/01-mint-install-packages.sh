#!/bin/bash

. ~/.my-dot-files/scripts/respect-shell.sh

respect.title "Updating repositories"
sudo apt update

respect.title "Installing packages"
apt install -y build-essential \
    font-manager \
    git \
    vim \
    terminator \
    htop \
    rar unrar \
    redshift redshift-gtk \
    spotify-client \
    darktable \
    steam
