
---
title: "The catkin plugin"
---

The catkin plugin is useful for building ROS parts.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - catkin-packages:
      (list of strings)
      List of catkin packages to build.
    - source-space:
      (string)
      The source space containing Catkin packages. By default this is 'src'.
    - include-roscore:
      (boolean)
      Whether or not to include roscore with the part. Defaults to true.

[Examples](https://github.com/search?o=desc&q=filename%3Asnapcraft.yaml+%22plugin%3A+catkin%22+&s=indexed&type=Code&utf8=%E2%9C%93)
