
---
title: "The copy plugin"
---

The copy plugin is useful for assets or other sources with no build system.

This plugin is DEPRECATED in favor of the `dump` plugin.

This plugin uses the following plugin-specific keywords:

    - files:
      (object)
      A dictionary of key-value pairs. The key is the current location of the
      file relative to snapcraft.yaml (unless `source` is specified, in which
      case it's relative to the root of the source). The value is where to
      place the file in-snap, and is relative to the root of the snap. This
      works like `cp -r <key> <value>`. Note that globbing is supported for the
      key, allowing one to use *, ?, and character ranges expressed with [].

[Examples](https://github.com/search?o=desc&q=filename%3Asnapcraft.yaml+%22plugin%3A+copy%22+&s=indexed&type=Code&utf8=%E2%9C%93)
