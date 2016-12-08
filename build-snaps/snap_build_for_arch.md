---
title: Building for a target arch
---

There are many ways to build a snap to a target CPU architecture (for example `armhf`).

Let's take a quick look at a couple common methods.

## On Launchpad

[Launchpad](http://launchpad.net) can build a branch (git or bzr) with a `snapcraft.yaml` file to any of the supported architectures. 

The basic steps are:

 1. Push the branch to a launchpad project (create a project as needed).
 * Click "Create Snap Package" and fill out the form as appropriate, for example:
   * Selecting the Ubuntu series to build against and the target CPU architecture to build snaps for
   * You can specify a PPA to build in
   * You can configure automatic building on branch changes (you can always request a build manually after setup)
   * You also configure the auto build to also upload on success to a specified channel

Depending on work loads, there may a short delay. For faster iteration, you can build on your target Ubuntu Core device.

## On an Ubuntu Core device 

Building on the device itself is a natural way to build to that device's architecture.

While Ubuntu Core devices are confined and initially lack the ability to install the debian packages needed to build, you can install the classic snap to enable all of this.

So, get a terminal to your Ubuntu Core device, and:

1. Install the classic snap: `sudo snap install classic --edge --devmode`.
1. Get a bash terminal into a classic environment with `sudo classic`.
1. Install required build and development debian packages as usual with `sudo apt-get install snapcraft ...`. You might install git or bzr, for example, to get your repos locally.

Now, you are ready to run `snapcraft` and build your snap to the Ubuntu Core device's native architecture.

## Others

There are other ways too. For example, people are making chroots and adding qemu to them, one can even use a debian package oriented chroot based build approaches such as pbuilder.
