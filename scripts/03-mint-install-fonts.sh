#!/bin/bash

# Installing fonts
font-manager -i fonts/FiraCode/*.ttf
font-manager -i fonts/JetBrainsMono/*.ttf

fc-cache -vf
