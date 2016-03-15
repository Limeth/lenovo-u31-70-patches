# elementary OS patches for the Lenovo U31-70

Every sub-directory has it's own `auto.sh` script, which applies the given patch.
The `auto.sh` script in the root of this repository applies all patches, but you might not need the screen patch; only apply that one if your screen stays black.
You will need ethernet connection. The script installs some required packages using apt-get.
