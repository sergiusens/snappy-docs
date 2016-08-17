---
title: "Build snaps"
---


This section provides details on how to use Snapcraft to create application snaps, as well as covering the common and advanced features of snap development. The content includes:

*   [Your first snap](/docs/build-snaps/your-first-snap)
*   [Snapcraft syntax](/docs/build-snaps/syntax)
*   [Parts](/docs/build-snaps/parts)
*   [Plugins](/docs/build-snaps/plugins)
*   [Commands, daemons & assets](/docs/build-snaps/metadata)
*   [Debugging](/docs/build-snaps/debugging)
*   [Publish your snap](/docs/build-snaps/publish)
*   [Advanced features](/docs/build-snaps/advanced-features)

## Install Snapcraft

If you haven't installed snapcraft, it's available on Ubuntu 16.04 LTS:

    $ sudo apt install snapcraft

It will also install and run on any Linux distribution with an up-to-date version of [LXD, the container hypervisor](http://www.ubuntu.com/cloud/lxd).

### Take the tour

A number of exercises included in this documentation use the snapcraft tour, a list of examples you load using the `snapcraft tour` command.

    $ snapcraft tour
    Snapcraft tour initialized in ./snapcraft-tour/

The [Create](http://snapcraft.io/create/) page is an easy-to-use companion to this tour, that will walk you through the creation of snaps.

## Examples repository

The Snappy Playpen is an incubator dedicated to providing snaps examples and cover the widest range of projects possible: desktop apps, server, CLI, GUI, Gtk, Qt, SDL, Python, Go, Vala, C, C++, Java, etc. On its GitHub repo and the associated chat, you will find examples and experts to help you with your snaps.

[Browse snap examples &rsaquo;](https://github.com/ubuntu/snappy-playpen)
