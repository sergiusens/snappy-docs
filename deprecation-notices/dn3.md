---
title: DN3
---
## DN3

**`.snapcraft.yaml` should be moved to `snap/snapcraft.yaml`.**

Snapcraft has begun using the `snap` directory as the container for the `snapcraft.yaml`, hooks, and plugins, and the entire directory is migrated into the final snap to enable rebuilds. This means that a standalone, hidden `.snapcraft.yaml` in the root of the project has been deprecated.
