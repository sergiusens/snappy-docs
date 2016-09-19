---
title: Environment variables
---

Snaps come with a set of predefined environment variables:

## Snap information

* `SNAP_NAME`: snap name
* `SNAP_VERSION`: snap version
* `SNAP_REVISION`: store revision of the snap
* `SNAP_ARCH`: the architecture of device (eg, amd64, arm64, armhf, i386, etc)
* `SNAP_LIBRARY_PATH`: additional directories added to `LD_LIBRARY_PATH`

## Read-only paths

* `SNAP`: read-only install directory

## Writable data paths

* `HOME`: set to `SNAP_DATA` for daemons and `SNAP_USER_DATA` for user
  commands
* `SNAP_DATA`: writable area for a particular revision of the snap
* `SNAP_COMMON`: writable area persistent across all revisions of the snap
* `SNAP_USER_DATA`: per-user writable area for a particular revision of the snap
* `SNAP_USER_COMMON`: per-user writable area persistent across all revisions of the snap
* `TMPDIR`: set to `/tmp`

An easy way to list their values for your snap is to add an `env` command to your snap:

    $ mysnap.env
    [...]
    SNAP_NAME=mysnap
    SNAP_VERSION=0.1
    SNAP_REVISION=x1
    SNAP_ARCH=amd64
    SNAP_LIBRARY_PATH=/var/lib/snapd/lib/gl:
    [...]
    SNAP=/snap/mysnap/x1
    [...]
    HOME=/home/david/snap/mysnap/x1
    SNAP_DATA=/var/snap/mysnap/x5
    SNAP_COMMON=/var/snap/mysnap/common
    SNAP_USER_DATA=/home/david/snap/mysnap/x1
    SNAP_USER_COMMON=/home/user/snap/mysnap/common
    TEMPDIR=/tmp
