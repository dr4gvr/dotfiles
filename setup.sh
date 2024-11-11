#!/usr/bin/env bash

set -e

# check for root access
if [[ $(id -u) != 0 ]]; then
    echo "Please run setup as 'root'"
    exit 1
fi

# remove unwanted packages
echo -e "\nRemoving bloatware ..."

dnf remove -y $(grep "^[^#]" bloatware)

# install wanted packages 
# based in the file "packages"
echo -e "\nInstalling packages ..."

dnf install -y $(grep "[^#]" packages)

# ====================================
# hosts setup
# ====================================

# URL hosts file
URL="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts"

# hosts file path
HOSTS_FILE="/etc/hosts"

# backup the original hosts-file
cp $HOSTS_FILE ${HOSTS_FILE}.bak

# download content
curl -o /tmp/new_hosts $URL

# if download is ok
if [ $? -eq 0 ]; then
    # replace hosts file content
    cat /tmp/new_hosts > $HOSTS_FILE
    echo "Hosts file updated."
else
    echo "Error. Hosts file can't be updated"
fi

# clear temporal file
rm /tmp/new_hosts

# =====================================
# copy files into .config folder
# =====================================

cp -r config/* $HOME/.conf

