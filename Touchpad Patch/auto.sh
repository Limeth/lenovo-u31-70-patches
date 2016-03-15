#!/bin/bash

echo "Patching the TouchPad..."

# Get the driver property ID
output=$(xinput list)
regex_device="ALPS DualPoint TouchPad\s+id=(\w+)"
regex_prop="Coordinate Transformation Matrix \((\w+)\)"
[[ $output =~ $regex_device ]]
device="${BASH_REMATCH[1]}"
output=$(xinput list-props $device)
echo "TouchPad device ID: $device"
[[ $output =~ $regex_prop ]]
prop="${BASH_REMATCH[1]}"

# Patch /etc/X11/xinit/xinputrc
command="xinput set-prop $device $prop 1.000000, 0.000000, 0.000000, 0.000000, 2.000000, 0.000000, 0.000000, 0.000000, 1.000000"
echo "TouchPad Transformation Matrix property ID: $prop"
sudo sed -i.bak '/xinput set-prop/d' /etc/X11/xinit/xinputrc
sudo bash -c "echo \"$command\" >> /etc/X11/xinit/xinputrc"

echo "TouchPad patched."
