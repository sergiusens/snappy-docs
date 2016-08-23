
---
title: "The python2 plugin"
---

The python2 plugin can be used for python 2 based parts.

The python2 plugin can be used for python 2 projects where you would
want to do:

    - import python modules with a requirements.txt
    - build a python project that has a setup.py
    - install sources straight from pip

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - requirements:
      (string)
      path to a requirements.txt file
    - constraints:
      (string)
      path to a constraints file
    - python-packages:
      (list)
      A list of dependencies to get from PyPi

[Examples](https://github.com/search?o=desc&q=filename%3Asnapcraft.yaml+%22plugin%3A+python2%22+&s=indexed&type=Code&utf8=%E2%9C%93)
