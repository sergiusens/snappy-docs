
---
title: "The gradle plugin"
---

This plugin is useful for building parts that use gradle.

The gradle build system is commonly used to build Java projects.
The plugin requires a pom.xml in the root of the source tree.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - gradle-options:
      (list of strings)
      flags to pass to the build using the gradle semantics for parameters.

[Examples](https://github.com/search?o=desc&q=filename%3Asnapcraft.yaml+%22plugin%3A+gradle%22+&s=indexed&type=Code&utf8=%E2%9C%93)
