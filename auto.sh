#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Uncomment the next 3 lines starting with '#' to install an auto-patch script run after every apt-get install
#sudo apt-get install realpath
#this=$( realpath "${0}" )

sudo echo "Installing the Auto Patcher..."

#sudo bash -c "echo \"DPkg::Post-Invoke {\\\"/bin/bash $this\\\"; }\" > /etc/apt/apt.conf.d/50system-patches"

echo "Auto Patcher installed."

$DIR/Touchpad Patch/auto.sh
$DIR/wireless-adapter-patch/auto.sh
$DIR/Screen\ Patch/auto.sh
