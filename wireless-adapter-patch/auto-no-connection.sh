#!/bin/bash

echo "Patching the Wireless Adapter..."

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "options ath10k_core skip_otp=y" | sudo tee /etc/modprobe.d/ath10k_core.conf
cd "$DIR/backports-20150903"
make defconfig-ath10k
make
sudo make install
if [ -d "$DIR/backports-20150903/ath10k-firmware" ]; then
  cd ath10k-firmware;
else
  echo "missing ath10k-firmware repo in backports-20150903, need to clone"
  exit 1;
fi
sudo cp -rv ./ath10k/ /lib/firmware/
sudo cp -rv /lib/firmware/ath10k/QCA6164/hw2.1 /lib/firmware/ath10k/QCA6174/

echo "Wireless Adapter patched."
