---
title: Install snapd on Ubuntu
---

Ubuntu includes snapd by default starting with the 16.04 LTS (xenial) release. No installation steps are required and you can use snapd directly.

For the older 14.04 LTS (trusty) release or any flavour (e.g. Lubuntu) which doesn't
include snapd by default, you have to install it manually from the archive:

```
$ sudo apt install snapd
```

Snaps which use the pusleaudio interface to playback sounds & music also require pulseaudio to be installed. This is already installed for the majority of Ubuntu flavours, however Lubuntu does not ship pulseaudio, so it must be installed manually if audio is desired from those snaps.

```
$ sudo apt install pulseaudio
```
Once installed, logout and back in to ensure pulseaudio is running.


Afterwards everything is setup to get you started with snaps.

## Next Steps

 * [Using snaps](usage)
