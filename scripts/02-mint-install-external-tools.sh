#!/bin/bash

. ~/.my-dot-files/scripts/respect-shell.sh

respect.title "Installing Brave Browser"
curl -fsS https://dl.brave.com/install.sh | sh

respect.title "Installing Fancygit"
curl -sS https://raw.githubusercontent.com/diogocavilha/fancy-git/master/install.sh | sh

respect.title "Installing Respect shell"
git clone git@github.com:diogocavilha/respect-shell.git ~/.respect-shell

respect.title "Installing asdf"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0

respect.title "Installing GE Proton"
asdf plugin add protonge
asdf install protonge latest

respect.title "Installing Docker / Docker compose"
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl is-active docker
sudo docker -v
docker compose version

respect.title "Run these commands to add docker command to non-root user:"
echo 'sudo usermod -aG docker ${USER}'
echo 'newgrp docker'
sleep 10

# respect.title "Testing Docker"
# sleep 3
# docker run hello-world
