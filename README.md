# elementary OS patches for the Lenovo U31-70

Every sub-directory has it's own `auto.sh` script, which applies the given patch.
The `auto.sh` script in the root of this repository applies all patches, but you might not need the screen patch; only apply that one if your screen stays black.
You will need ethernet connection, because the script installs some required packages using apt-get.
Make sure the full path to your cloned repository does NOT contain any spaces, if you are going to apply the WiFi patch.


## Screen Patch

Under some condition, my screen wouldn't sometimes turn on after starting up the system. This would help.


## Touchpad Patch

The vertical speed of the touchpad on this model seemed halved. This patch multiplies the speed by 2.


## Wireless Adapter Patch

The drivers for the WiFi adapter do not work for Ubuntu 14.04. This patch applies a backport.
