#!/bin/bash

. ~/.my-dot-files/scripts/respect-shell.sh

respect.title "STARTING MINT SETUP"
. scripts/01-mint-install-packages.sh
. scripts/02-mint-install-external-tools.sh
. scripts/03-mint-install-fonts.sh
. scripts/04-mint-install-config-files.sh
