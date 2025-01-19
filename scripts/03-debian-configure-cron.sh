#!/bin/bash
#
# Author: Diogo Alexsander Cavilha <diogocavilha@gmail.com>
#
# Description:
#    Configure cron jobs

header() {
    printf "\n=> %s\n" "$1"
}

create_wallpapers_directory() {
    header "CREATING WALLPAPERS DIRECTORY..."
    mkdir ~/.wallpapers 2> /dev/null
}

install_wallpaper_rotator() {
    header "INSTALLING WALLPAPER ROTATOR..."
    sudo cp -iv cron/cron_wallpaper_rotator.sh /usr/local/bin/
}

show_final_info() {
    header "CRONTAB CONFIG:"
    printf "%s\n\n" "*/15 * * * * bash /usr/local/bin/cron_wallpaper_rotator.sh"
}

create_wallpapers_directory
install_wallpaper_rotator
show_final_info
