#!/bin/bash

USER=diogo

apt install -y qemu-system \
    libvirt-daemon-system

adduser $USER libvirt

