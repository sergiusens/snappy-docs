---
title: "Snaps Directory Structure	"
---

# Snap File Directory Structure

This section describes the directories found within a snap and details their content. If you're building your snaps with snapcraft, after running a build the directory structure can be seen in the `prime/` directory. 

Directory | Purpose | Content
:---- | ---- | ----
`root` | | `*.wrapper` files
`bin` | Contains all the components of the software being delivered in the snap.
`meta` | Contains details that describe the snap. | [`snap.yaml`](/docs/architecture/metadata), licence.txt
`meta/hooks` | 
`share` |
`gui` | Contains GUI releated files for the snap.

	
## license.txt

A license text that the user must accept before the snap can be installed.


## gui/ directory

The gui directory contains GUI related files for the snap.

### dekstop files

The `gui/` directory may contain .desktop files for the snap. Those desktop files may contain all valid desktop entries from the xdg Desktop Entry Specification version 1.1 with some exceptions listed below. If there is a line with an unknown key or an unofficial key that line is silently removed from the desktop file on install.

Only `Exec=` lines that start with `Exec=$snap.$app` are valid, but arguments may be passed.

### Unsupported desktop keys

The `DBusActivatable`, `TryExec` and `Implements` keys are currently not supported and will be silently removed from the desktop file on install.
