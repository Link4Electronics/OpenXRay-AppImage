#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    cmake     \
    libdecor  \
    libtheora \
    openal    \
    sdl2

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
echo "Making nightly build of OpenXRay..."
echo "---------------------------------------------------------------"
REPO="https://github.com/OpenXRay/xray-16"
VERSION="$(git ls-remote "$REPO" HEAD | cut -c 1-9 | head -1)"
git clone --recursive --depth 1 "$REPO" ./xray-16
echo "$VERSION" > ~/version

cd ./xray-16
make rednukem -j$(nproc)
mv -v rednukem /usr/bin
