
---
title: "The cmake plugin"
---

The cmake plugin is useful for building cmake based parts.

These are projects that have a CMakeLists.txt that drives the build.
The plugin requires a CMakeLists.txt in the root of the source tree.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - configflags:
      (list of strings)
      configure flags to pass to the build using the common cmake semantics.

[Examples](https://github.com/search?o=desc&q=filename%3Asnapcraft.yaml+%22plugin%3A+cmake%22+&s=indexed&type=Code&utf8=%E2%9C%93)
