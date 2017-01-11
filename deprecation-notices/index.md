This document contains a list of deprecation notices and recommendations.

# DN1
**The `snap` keyword has been replaced by `prime`.**

Snapcraft supports providing a list of files to include/exclude from two steps in the lifecycle: stage and prime. That's done with two keywords in the yaml, respectively: `stage` and `snap`. The `snap` keyword has now been deprecated and replaced with `prime`, corresponding to the actual lifecycle step to which it applies. All other functionality remains the same. Where you wrote:

```yaml
# ...
parts:
  foo:
    plugin: nil
    snap: [bar]
```

Now write:

```yaml
# ...
parts:
  foo:
    plugin: nil
    prime: [bar]
```

# DN2
**`snapcraft.yaml` should be in `snap/` directory.**

Snapcraft has begun using the `snap` directory as the container for the `snapcraft.yaml`, hooks, and plugins, and the entire directory is migrated into the final snap to enable rebuilds. This means that a standalone `snapcraft.yaml` in the root of the project has been deprecated.

# DN3
**`.snapcraft.yaml` should be moved to `snap/snapcraft.yaml`.**

Snapcraft has begun using the `snap` directory as the container for the `snapcraft.yaml`, hooks, and plugins, and the entire directory is migrated into the final snap to enable rebuilds. This means that a standalone, hidden `.snapcraft.yaml` in the root of the project has been deprecated.
