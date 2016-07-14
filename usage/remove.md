---
title: "Removing snaps"
---

# Removing snaps

You can use `snap list` to browse all installed snaps, then `snap remove <snap>` to remove a specific one.

```
$ snap list
Name               Version               Rev  Developer         Notes
blender-tpaw       2.77a                 1    tpaw              -
gdoc-html-cleaner  0.1.2                 3    caldav            -
hello              2.10                  20   canonical         -
liteide-tpaw       x30.2-tpaw1           3    tpaw              -
notes              0.9.0~gitb6e3b34      4    notes-developers  -
pithos-snap        1.0                   1    ldsdevunofficial  devmode
rssreader-app                            x2                     try,broken
scummvm            1.9.0git              4    caldav            -
snappy-debug       0.23                  22   canonical         -
stellarium-plars   0.14.90               2    pwlars            -
ubuntu-core        16.04+20160531.11-56  122  canonical         -
vlc                daily                 9    caldav            -
webdm              0.17                  21   canonical         -
```

```
$ snap remove rssreader-app
[|] Make snap "rssreader-app" unavailable to the system
[/] Remove snap "rssreader-app" (x2) from the system
Done
```
