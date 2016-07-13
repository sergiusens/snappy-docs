---
title: "Install snapd"
---

# Install snapd

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
sudo systemctl enable –now snapd.service

# SELinux support is in beta, so currently:
sudo setenforce 0

# to persist, edit /etc/selinux/config
to set SELINUX=permissive and reboot.

```

### Gentoo

Install [snap-confine.ebuild](https://github.com/zyga/snap-confine-gentoo) and [snapd.ebuild](https://github.com/zyga/snapd-gentoo)

```
# enable the snapd systemd service:
sudo systemctl enable –now snapd.service
```

### Ubuntu

```
sudo apt install snapd
```

### OpenSuse

```

```
