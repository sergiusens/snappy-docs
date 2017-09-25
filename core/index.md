---
layout: base
title: Core
---

The snapd technology is the core that powers snaps. It offers a new way to package, distribute, update and run OS components and applications on a Linux system.

This section provides an overview to the key concepts and technologies that enable snapd systems, covering:

- [installing snapd on your Linux distribution](/docs/core/install)
- [using the `snap` command](/docs/core/usage)
- the concept of [snap stores](/docs/core/store) where snaps are distributed for both testing and final release
- the [core principals of the snapd system](/docs/core/snapd), including the OS snap, transactional updates and application confinement
- [interfaces](/docs/core/interfaces) to enable applications to access OS features or share features with other applications
- [transactional updates](/docs/core/updates) that enable snaps to be updated easily and rolled back if needed
- [garbage collection](/docs/core/versions) to ensure old versions of snaps are appropriately removed from devices