---
title: "Concepts"
---


The snapd technology offers a new way to package, distribute, update and run OS components and applications on a Linux system.

This section provides an overview to the key concepts and technologies that enable snapd systems, covering:

* the [core principals of the snapd system](/docs/concepts/system), including the snap package, transactional updates and application confinement
* [Ubuntu Core](/docs/concepts/core-classic), a new minimal server image with the same libraries as today’s Ubuntu designed to be implemented in Canonical's snapd systems
* four [kinds of snaps](/docs/concepts/snaps), three to implement the core OS and device and one type for applications
* a [store](/docs/concepts/store) where snaps are distributed for both testing and final release
* [interfaces](/docs/concepts/interfaces) to enable applications to access OS features or share features with other applications
* [transational updates](/docs/concepts/updates) that enable snaps to be updated easily and rolled back if needed
* [garbage collection](/docs/concepts/versions) to ensure old versions of snaps are appropriately removed from devices

At the end of this section you'll have an understanding of what the snapd system is about and be ready to move onto the next section, which looks at the [architecture of snaps in detail](/docs/architecture).
