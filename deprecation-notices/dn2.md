---
title: DN2
---

**Custom plugins should now be placed in snap/plugins.**

Originally snapcraft custom plugins were designed to be put in `parts/plugins` to avoid over polluting
the local directory with too many artifacts. Together with the fact that many just deleted the `parts` directory
where the plugins lived in to start over and confused for a while on why plugins were not found, and that
over time many other artifacts and needs started to arise, a new schema was needed.
With a design to solve this, the `snap` directory was introduced to hold all specific snapcraft assets,
with this in mind a new location was set for custom plugins, and that is `snap/plugins/<plugin-name>`.

To move to the new schema, for plugins all you need to do is:

```
mkdir snap
mv parts/plugins snap/
```
