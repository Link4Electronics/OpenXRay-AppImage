<div align="center">

# OpenXRay-AppImage 🐧

[![GitHub Downloads](https://img.shields.io/github/downloads/pkgforge-dev/OpenXRay-AppImage/total?logo=github&label=GitHub%20Downloads)](https://github.com/pkgforge-dev/OpenXRay-AppImage/releases/latest)
[![CI Build Status](https://github.com/pkgforge-dev/OpenXRay-AppImage/actions/workflows/appimage.yml/badge.svg)](https://github.com/pkgforge-dev/OpenXRay-AppImage/releases/latest)
[![Latest Stable Release](https://img.shields.io/github/v/release/pkgforge-dev/OpenXRay-AppImage)](https://github.com/pkgforge-dev/OpenXRay-AppImage/releases/latest)

<p align="center">
  <img src="https://raw.githubusercontent.com/OpenXRay/xray-16/dev/misc/media/icons/64x64/openxray_soc.png" width="128" />
</p>


| Latest Nightly Release | Upstream URL |
| :---: | :---: |
| [Click here](https://github.com/pkgforge-dev/OpenXRay-AppImage/releases/latest) | [Click here](https://github.com/OpenXRay/xray-16) |

</div>

### ⚠️ To play Call of Pripyat, place `levels` `localization` `mp` `patches` `resources` inside `~/.local/share/GSC Game World/S.T.A.L.K.E.R. - Call of Pripyat/_appdata_/` ⚠️
### ⚠️ To play Clear Sky, place `levels` `localization` `mp` `patches` `resources` inside `~/.local/share/GSC Game World/S.T.A.L.K.E.R. - Clear Sky/` and use `-cs` flag ⚠️
### ⚠️ Call of Chernobyl isn't working on linux, [issue](https://github.com/OpenXRay/xray-16/issues/1856) ⚠️
### ⚠️ It may show a Fatal Error message or crash since it's compiled against unstable master branch, just keep choosing Continue and it works ⚠️

---

AppImage made using [sharun](https://github.com/VHSgunzo/sharun) and its wrapper [quick-sharun](https://github.com/pkgforge-dev/Anylinux-AppImages/blob/main/useful-tools/quick-sharun.sh), which makes it extremely easy to turn any binary into a portable package reliably without using containers or similar tricks. 

**This AppImage bundles everything and it should work on any Linux distro, including old and musl-based ones.**

This AppImage doesn't require FUSE to run at all, thanks to the [uruntime](https://github.com/VHSgunzo/uruntime).

This AppImage is also supplied with a self-updater by default, so any updates to this application won't be missed, you will be prompted for permission to check for updates and if agreed you will then be notified when a new update is available.

Self-updater is disabled by default if AppImage managers like [am](https://github.com/ivan-hc/AM), [soar](https://github.com/pkgforge/soar) or [dbin](https://github.com/xplshn/dbin) exist, which manage AppImage updates.

<details>
  <summary><b><i>raison d'être</i></b></summary>
    <img src="https://github.com/user-attachments/assets/d40067a6-37d2-4784-927c-2c7f7cc6104b" alt="Inspiration Image">
  </a>
</details>

---

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)
