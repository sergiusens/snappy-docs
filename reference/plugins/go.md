
---
title: "The go plugin"
---

The go plugin can be used for go projects using `go get`.

This plugin uses the common plugin keywords, for more information check the
'plugins' topic.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - go-packages:
      (list of strings)
      Go packages to fetch, these must be a "main" package. Dependencies
      are pulled in automatically by `go get`.
      Packages that are not "main" will not cause an error, but would
      not be useful either.
      If the package is a part of the go-importpath the local package
      corresponding to those sources will be used.

    - go-importpath:
      (string)
      This entry tells the checked out `source` to live within a certain path
      within `GOPATH`.
      This is not needed and does not affect `go-packages`.

    - go-buildtags:
      (list of strings)
      Tags to use during the go build. Default is not to use any build tags.

[Examples](https://github.com/search?o=desc&q=filename%3Asnapcraft.yaml+%22plugin%3A+go%22+&s=indexed&type=Code&utf8=%E2%9C%93)
