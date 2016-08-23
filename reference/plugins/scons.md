
---
title: "The scons plugin"
---

The scons plugin is useful for building parts that build with scons.

These are projects that have a SConstruct that drives the build.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - scons-options:
      (list of strings)
      flags to pass to the build using the scons semantics for parameters.

[Examples](https://github.com/search?o=desc&q=filename%3Asnapcraft.yaml+%22plugin%3A+scons%22+&s=indexed&type=Code&utf8=%E2%9C%93)
