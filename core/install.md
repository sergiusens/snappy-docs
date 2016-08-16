---
title: Install snapd
---

### Arch

```
sudo pacman -S snapd
```

### Debian

```
# On Sid:
sudo apt install snapd
```

### Fedora

```
sudo dnf copr enable zyga/snapcore
sudo dnf install snapd

# enable the snapd systemd service:
sudo systemctl enable --now snapd.service

# SELinux support is in beta, so currently:
sudo setenforce 0

# to persist, edit /etc/selinux/config
to set SELINUX=permissive and reboot.
```

### Gentoo

Install [snap-confine.ebuild](https://github.com/zyga/snap-confine-gentoo) and [snapd.ebuild](https://github.com/zyga/snapd-gentoo)

```
# enable the snapd systemd service:
sudo systemctl enable --now snapd.service
```

### OpenEmbedded/Yocto

Install the [snap meta layer](https://github.com/morphis/meta-snappy/blob/master/README.md).

### OpenSuse

```
sudo zypper addrepo http://download.opensuse.org/repositories/system:/snappy/openSUSE_Leap_42.2/ snappy
sudo zypper install snapd
```

### OpenWrt

Enable the [snap-openwrt feed](https://github.com/teknoraver/snap-openwrt/blob/master/README.md).

### Ubuntu

```
sudo apt install snapd
```
