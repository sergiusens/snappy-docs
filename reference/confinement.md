---
title: Confinement
---

Snaps can be setup to follow three different confinement policies. By default, a `strict` confinement where the snap can only read and write in its own namespace is enforced and recommended.

## strict

This is the default security policy applied to snaps. The snap has read and/or write rights only in its own install space and selected areas. It has access to libraries it bundles and/or provided by the `core` or `ubuntu-core` snap. Extended rights can be granted with [interfaces](/docs/core/interfaces), which are connected either at install time or by the user with the [`snap connect`]() command. For example, the `home` interface will grant read rights in the user's `home`.

Strict confinement gives you the following readable and/or writable paths:

* `/snap/<snap>/<revision>` (read-only, snap install path)
* `/var/snap/<snap>/<revision>` (read/write, per-revision data)
* `/var/snap/<snap>/common` (read/write, common data)
* `/home/$USER/snap/<snap>/<revision>` (read/write, per-revision user data)
* `/home/$USER/snap/<snap>/common` (read/write, common user data)

See the list of [environment variables](/docs/reference/env) for more details on what is visible to a strictly confined snap, as well as ways to access a shell within the confined space of a snap.

## devmode

Developer mode, also known as `devmode`, uses the same security policies as the `strict` confinement, but security denials are turned into warnings in `/var/log/syslog` (see [Debugging](/docs/build-snaps/debugging)). This is useful when snapping a traditional application, to discover which [interfaces](/docs/core/interfaces) need to be declared. Snaps in developer mode can **not** be released into the stable and candidate [channels](/docs/reference/channels).

## classic

The snap behaves as a traditionally packaged or installed application, with full access to the system. Snaps using this fully open security policy are manually reviewed in the store and only allowed on systems where `snapd` is installed [on top of a traditional Linux distribution](/docs/core/install), as opposed to system booting from an [Ubuntu Core image](https://docs.ubuntu.com/core/en/guides/build-device/image-building). They can be released in all [channels](/docs/reference/channels).
