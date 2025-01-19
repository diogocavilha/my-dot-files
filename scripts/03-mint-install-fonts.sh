#!/bin/bash

. ~/.my-dot-files/scripts/respect-shell.sh

respect.title "Installing fonts"
font-manager -i fonts/FiraCode/*.ttf
font-manager -i fonts/JetBrainsMono/*.ttf

fc-cache -vf
