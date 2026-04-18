#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://raw.githubusercontent.com/OpenXRay/xray-16/dev/misc/media/icons/64x64/openxray_soc.png
export DESKTOP=https://github.com/OpenXRay/xray-16/raw/refs/heads/dev/misc/linux/openxray_soc.desktop
export DEPLOY_OPENGL=1

# Deploy dependencies
quick-sharun ./AppDir/bin/xr_3da

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the app for 12 seconds, if the test fails due to the app
# having issues running in the CI use --simple-test instead
quick-sharun --test ./dist/*.AppImage
