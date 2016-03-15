#!/bin/bash

echo "Patching the Wireless Adapter..."

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get install build-essential linux-headers-$(uname -r) git
echo "options ath10k_core skip_otp=y" | sudo tee /etc/modprobe.d/ath10k_core.conf
cd "$DIR"
rm -fv backports-20150903.tar.gz
wget https://www.kernel.org/pub/linux/kernel/projects/backports/2015/09/03/backports-20150903.tar.gz
rm -rfv backports-20150903
tar -zxvf backports-20150903.tar.gz
cd "$DIR/backports-20150903"
make defconfig-ath10k
make
sudo make install
if [ -d "$DIR/backports-20150903/ath10k-firmware" ]; then
  cd ath10k-firmware;
  git pull;
else
  git clone https://github.com/atondwal/ath10k-firmware.git;
  cd ath10k-firmware;
fi
sudo cp -rv ./ath10k/ /lib/firmware/
sudo cp -rv /lib/firmware/ath10k/QCA6164/hw2.1 /lib/firmware/ath10k/QCA6174/

echo "Wireless Adapter patched."
