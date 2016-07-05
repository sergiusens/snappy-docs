Title: Connecting a snap it its interfaces
# Using Interfaces

Most snaps will use at least one [interface](interfaces.md) generally to get access to OS or device feature or use information or functions offered by another application or service. In using and working with interfaces you need to be able to discover the interfaces available or required by a snap, and connect snaps to their interfaces, when they don't do it automatically.

## Discovering interfaces used or needed

You can also discover a list of interfaces used or needed by a snap using `$ snap interfaces` as follow:

- `$ snap interfaces <snap>` to find the slots offered and plugs used by the specified snap.
- `$ snap interfaces <snap>:<slot or plug>` for details of only the specified slot or plug.
- `$ snap interfaces -i=<interface> [<snap>]` to get a filtered list of plugs and/or slots. 

## Connecting to interfaces

Interface can either auto-connect or require the device user to explicitly enable the connection for a snap, using:

` $ snap connect <snap>:<plug> <snap>:<slot>`

In addition, future enhancements may provide for the gadget snap to connect snaps to interfaces – so that preinstalled snap get their interfaces without the need for a manual connection.
