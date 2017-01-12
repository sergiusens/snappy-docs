---
title: DN2
---
## DN2

**`snapcraft.yaml` should be in `snap/` directory.**

Snapcraft has begun using the `snap` directory as the container for the `snapcraft.yaml`, hooks, and plugins, and the entire directory is migrated into the final snap to enable rebuilds. This means that a standalone `snapcraft.yaml` in the root of the project has been deprecated.
