---
title: Install snapd
---

snapd is available on many different distributions. This page gives an overview
over which are supported and what their current status is. Also it has installation
instructions for each of these distributions.

# Installation instructions

 * [Arch Linux](install-arch-linux.md)
 * [Debian](install-debian.md)
 * [Fedora](install-fedora.md)
 * [Gentoo](install-gentoo.md)
 * [OpenEmbedded/Yocto](install-oe-yocto.md)
 * [openSUSE](install-opensuse.md)
 * [OpenWRT](install-openwrt.md)
 * [Ubuntu](install-ubuntu.md)

# Support Overview

The following overview shows which version of snapd is available in each of the
listed distributions.

| Operating System    | Status      | Version | Notes                   |
| ------------------- |:-----------:| ------- | ----------------------- |
| Ubuntu 14.04 LTS    | Supported   | 2.23    |                         |
| Ubuntu 16.04 LTS    | Supported   | 2.23    |                         |
| Debian (testing)    | Supported   | 2.21    | _devmode_               |
| Debian (unstable)   | Supported   | 2.21    | _devmode_               |
| Fedora 25           | In progress | 2.16    | _devmode_, _no-classic_ |
| CentOS 7            | In progress | N/A     | _devmode_, _no-classic_ |
| RHEL 7.3            | Unsupported | N/A     | N/A                     |
| Arch Linux          | Outdated    | 2.16    | _devmode_               |
| Gentoo              | Outdated    | 2.15    | _devmode_               |
| OpenSUSE Leap 42.2  | Unsupported | 2.23.5  | N/A                     |
| OpenSUSE Tumbleweed | Unsupported | 2.23.5  | N/A                     |
| Yocto               | Unsupported | 2.23.5  | _devmode_               |

_devmode_: confinement technology is not fully supported and all snaps are
installed in development mode.

_no-classic_: because of distribution policy to remove `/snap` directory, snaps
using classic confinement are not supported.
