#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    cmake          \
    libdecor       \
    libtheora      \
    mimalloc       \
    openal         \
    pipewire-audio \
    pipewire-jack  \
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

mkdir -p ./AppDir/bin/cs
mkdir -p ./AppDir/bin/coc
wget https://github.com/OpenXRay/xray-16/files/12452881/gamedata.zip # Clear Sky gamedata.zip
bsdtar -xvf gamedata.zip 
rm -f *.zip
mv -v gamedata ./AppDir/bin/cs
wget https://github.com/user-attachments/files/19356418/gamedata.zip  # Call of Chernobyl gamedata.zip
bsdtar -xvf gamedata.zip 
rm -f *.zip
mv -v gamedata ./AppDir/bin/coc

cd ./xray-16
mkdir bin && cd bin
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
mv -v ${ARCH}/Release/* ../../AppDir/bin

cd ../..
mkdir -p ./AppDir/bin/cop
cd ./AppDir/bin/cop
wget https://github.com/OpenXRay/xray-16/releases/download/latest-nightly/OpenXRay.Release.Master.Gold.64-bit.7z # Call of Pripyat files
bsdtar -xvf OpenXRay.Release.Master.Gold.64-bit.7z
rm -rf *.7z README.md License.txt bin
cp -v fsgame.ltx ../cs
sed -i '/^;abbreviation/a $app_data_root$         = true|  false| $fs_root$|            .\\' ../fsgame.ltx
