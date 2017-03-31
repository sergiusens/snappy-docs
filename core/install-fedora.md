---
title: Install snapd on Fedora
---

snapd packages for Fedora are currently not available as part of
the official distribution but are maintained in a community
repository in [copr](https://copr.fedorainfracloud.org/). In the
near future snapd will be available in the official Fedora
distribution repositories.

## Enable the repository

There are separate repos for Fedora 24 and Fedora 25/26. Once enabled, continue to install snapd below.

### Fedora 24

To install snapd from the community repository you have to enable
it first:

```
$ sudo dnf copr enable zyga/snapcore
```

### Fedora 25 / 26 & Rawhide

To install snapd from the community repository you have to enable
it first:

```
$ sudo dnf copr enable mrmorph/snapcore
```

## Install snapd

Now you can install the snapd package with:

```
$ sudo dnf install snapd
```

Once the snapd package is successfully installed you have to
enable the systemd unit which takes care about snapd's main
communication socket as this is not yet automatically done:

```
$ sudo systemctl enable --now snapd.socket
```

Afterwards everything is setup to get you started with snaps.

## Next Steps

 * [Using snaps](usage)
