---
title: "Interfaces reference"
---

[Interfaces documentation](/docs/core/interfaces)

### Terminology

* Auto-connect: the interface is connected upon snap install

* Transitional: the interface supports traditional desktop features that were not designed with strong application isolation in mind and will be deprecated when a technology more in adequacy with the snap security policy is available.


| Interface name | Purpose | Auto-connect | Transitional | Attributes |
|----------------|---------|--------------|--------------|------------|
| `camera` | Can access the first video camera. Suitable for programs wanting to use webcams. | no | no |  |
| `gsettings` | Can access global gsettings of the user\'s session which gives privileged access to sensitive information stored in gsettings and allows adjusting settings of other applications. | yes | yes |  |
| `home` | Can access non-hidden files in user\'s `$HOME` and gvfs mounted directories owned by the user to read/write/lock. | yes on classic (traditional distributions), no otherwise | yes |  |
| `mpris` | Providing snaps implementing the Media Player Remove Interfacing Specification (mpris) may be accessed via their well-known DBus name. | no | no | `name` (slot): optional, media player name to use for DBus well-known name |
| `network` | Can access the network as a client. | yes | no |  |
| `network-bind` | Can access the network as a server. | yes | no |  |
| `opengl` | Can access OpenGL hardware. | yes | no |  |
| `optical-drive` | Can access the first optical drive in read-only mode. Suitable for CD/DVD playback. | yes | no |  |
| `pulseaudio` | Can access the PulseAudio sound server which allows for sound playback in games and media application. Recording not supported but will be in a future release. | yes | no |  |
| `removable-media` | Can access files from removable media in /media and /run/media | no | no |  |
| `screen-inhibit-control` | Can access desktop session manager screen inhibit and uninhibit functionality. | yes | no |  |
| `unity7` | Can access Unity7. Unity 7 runs on X and requires access to various DBus services. This interface grants privileged access to the user\'s session since the Unity 7 environment does not prevent eavesdropping or apps interfering with one another. | yes | yes |  |
| `x11` | Can access the X server which gives privileged access to the user\'s session since X does not prevent eavesdropping or apps interfering with one another. | yes | yes |  |
| `browser-support` | Can access files and IPC needed by modern browsers. This interface is intended to be used when using an embedded Chromium Content API or using the sandboxes in major browsers from vendors like Google and Mozilla. The ``allow-sandbox`` attribute may be used to give the necessary access to use the browser\'s sandbox functionality. | yes | no | `allow-sandbox:` true\|false (defaults to ``false``) |
| `bluetooth-control` | Allow to manage the kernel side Bluetooth stack. | no | no |  |
| `bluez` | Can access snaps providing the bluez interface which gives privileged access to bluetooth. | no | no |  |
| `content` | Can access content from the providing snap from within the consuming snap\'s filesystem area. | yes for snaps from same publisher, no otherwise | no | `read` (slot): read-only paths from providing snap to expose to the consuming snap<br> `write` (slot): read-write paths from providing snap to expose to the consuming snap<br> `target` (plug): path in consuming snap to find providing snap\'s files |
| `cups-control` | Can access cups control socket which gives privileged access to configure printing. | no | no |  |
| `firewall-control` | Can configure network firewalling giving privileged access to networking. | no | no |  |
| `fuse-support` | Can mount fuse filesystems (as root only). | no | no |  |
| `fwupd` | Can access snaps providing the fwupd interface which gives privileged access to update UEFI capsule format firmware. | no | no |  |
| `hardware-observe` | Can query hardware information from the system. | no | no |  |
| `hidraw` | Can access hidraw devices. This is restricted because it provides privileged access to hardware devices. | no | no |  |
| `kernel-module-control` | Can insert kernel modules. This interface gives privileged access to the device. | no | no |  |
| `libvirt` | Can access the libvirt control socket, which gives privileged access to control libvirtd on the host. This is commonly used to create and manage QEMU/KVM instances on the host. | no | no |  |
| `locale-control` | Can manage locales directly separate from ``config core``. | no | no |  |
| `location-control` | Can access snaps providing the location-control interface which gives privileged access to configure, observe and use location services. | no | no |  |
| `location-observe` | Can access snaps providing the location-observe interface which gives privileged access to query location services. | no | no |  |
| `log-observe` | Can read system logs and set kernel log rate-limiting. | no | no |  |
| `lxd-support` | Can access all resources and syscalls on the device for LXD to mediate access for its containers. This interface currently may only be established with the upstream LXD project. | yes | yes |  |
| `modem-manager` | Can access snaps providing the modem-manager interface which gives privileged access to configure, observe and use modems. | no | no |  |
| `mount-observe` | Can query system mount information. This is restricted because it gives privileged read access to mount arguments and should only be used with trusted apps. | no | no |  |
| `network-control` | Can configure networking which gives wide, privileged access to networking. | no | no |  |
| `network-manager` | Can access snaps providing the network-manager interface which gives privileged access to configure and observe networking. | no | no |  |
| `network-observe` | Can query network status information which gives privileged read-only access to networking information. | no | no |  |
| `ppp` | Can access Point-to-Point protocol daemon which gives privileged access to configure and observe PPP networking. | no | no |  |
| `process-control` | Can manage processes via signals and nice. | no | no |  |
| `serial-port` | Can access serial ports. This is restricted because it provides privileged access to configure serial port hardware. | no | no | Should specify a single path attribute:<br>`path` (slot): path to hidraw device node e.g. /dev/hidraw0<br><br>Or three attributes:<br>`usb-vendor` (slot): integer representing the USB Vendor ID, must be in range 0 < vid <= 65535,<br>`usb-product` (slot): integer representing the USB Product ID, must be in range 0 <= vid <= 65535,<br>`path` (slot): path where a symlink will be created to the device e.g. /dev/hidraw-mydevice  |
| `snapd-control` | Can manage snaps via snapd. | no | no |  |
| `system-observe` | Can query system status information which gives privileged read access to all processes on the system. | no | no |  |
| `system-trace` | Can use kernel tracing facilities. This is restricted because it gives privileged access to all processes on the system and should only be used with trusted apps. | no | no |  |
| `timeserver-control` | Can manage timeservers directly separate from ``config core``. | no | no |  |
| `tpm` | Can access the tpm device /dev/tpm0. | no | no |  |
| `udisks2` | Can access snaps providing the udisks2 interface which gives privileged access to storage on the device | no | no |  |
| `upower-observe` | Can query UPower for power devices, history and statistics. | yes | no |  |
