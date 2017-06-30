---
title: "Builders"
---

## During development

During development, the recommended way to build a snap is to do it locally, either with the `snapcraft` command to build with your host machine stack or with the `snapcraft cleanbuild` command to build in a pristine environment.

## Automating builds and releases

When you have a working snap, the next step is to use [build.snapcraft.io](https://build.snapcraft.io) to link your code repository and automate `amd64` and `armhf` builds and releases.

## Other builders

There are many ways to build a snap:

* [Build in containers with LXD or Docker](/docs/build-snaps/build-on-lxd-docker)
* [Build for another arch](/docs/build-snaps/build-for-another-arch)
* [Integrate builds into your CI workflow](/docs/build-snaps/ci-integration)
