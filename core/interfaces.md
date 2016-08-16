---
title: "Interfaces"
---

Interfaces provide a mechanism to enable snaps to communicate or share resources, according to the protocol established by the interface.

Each interface connection has two ends, a **plug** (consumer) and a **slot** (provider). A plug and a slot can be connected if they use the same interface name. The connection grants the necessary permissions for snaps to operate according to the protocol.


<img src="https://assets.ubuntu.com/v1/4d5afbf9-Snapcraft-Interfaces-plugs-and-slots.svg" alt="Interfaces - Plugs and Slots" style="width: 80%;"/>

Slots can accept multiple connections from plugs. For example, the OS snap exposes the `network` slot and all applications that need to communicate over the network connect their plugs there. If necessary a slot can limit the number of connected plugs to one.

Interface can either auto-connect or require the device user to explicitly enable the connection for a snap, using:

    snap connect <snap>:<plug> <snap>:<slot>

In addition, future enhancements may provide for the gadget snap to connect snaps to interfaces -- so that preinstalled snaps get their interfaces without the need for a manual connection.

A complete list of interfaces is provided in the [Interfaces reference](/docs/reference/interfaces "Interfaces reference"). You can also discover a list of interfaces available on a system and the snaps using them with `snap interfaces` or use the command to get more specific information, including:

- `snap interfaces <snap>` to find the slots offered and plugs used by the specified snap.
- `snap interfaces <snap>:<slot or plug>` for details of only the specified slot or plug.
- `snap interfaces -i=<interface> [<snap>]` to get a filtered list of  plugs and/or slots.

## Creating an interface

The OS snap exposes a number of interfaces to grant snaps access to system functions. You can extend this access by creating your own interfaces. The following tutorial will show you how: [Your first interface](http://www.zygoon.pl/2016/08/creating-your-first-snappy-interface.html).

### Requesting an interface

You can also file an interface request by [opening an bug report](https://bugs.launchpad.net/snappy/+bugs?field.tag=snapd-interface) with the `snapd-interface` bug tag.
