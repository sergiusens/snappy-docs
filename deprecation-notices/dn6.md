---
layout: base
title: DN6
---

**Use of the `snap` command with a directory has been deprecated in favour of the `pack` command.**

_introduced in snapcraft 2.35_

With the introduction of vesion 2.35, `snapcraft snap` has been reserved as a step
for snapping up a snapcraft project itself as the use of `snapcraft snap <directory>`
was confusing from the point of view of someone working on an actual snapcraft
project.

The new command `pack` is much more explicit in that snapcraft is just focusing
on assembling the final snap from a valid layout for a given directory, such that
the new way to create a snap from a directory has the following syntax:

    snapcraft pack <directory>
