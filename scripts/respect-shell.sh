#!/bin/bash

function respect.title() {
    local title=${1:-No title}
    tput bold
    tput setaf 3
    echo -e "\n≡ $title\n"
    tput sgr0
}