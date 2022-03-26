#!/bin/bash
#
# Author: Diogo Alexsander Cavilha <diogocavilha@gmail.com>
#
# Description:
#    This script will rotate the wallpapers according to wallpapers in ~/.wallpapers.
#
# Rules:
#    - All wallpapers must have .jpeg extension.
#    - All wallpapers must be named like numbers in sequence, starting with 1, eg (1.jpeg, 2.jpeg, 3.jpeg and so on).
#
# crontab:
#    */15 * * * * bash /usr/local/bin/cron_wallpaper_rotator.sh

export DISPLAY=:0
TOTAL_WALLPAPERS=$(ls ~/.wallpapers | wc -l)
CHOSEN_WALLPAPER=$(shuf -i1-$TOTAL_WALLPAPERS -n1)

feh --bg-fill ~/.wallpapers/${CHOSEN_WALLPAPER}.jpeg

