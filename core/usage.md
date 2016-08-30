---
title: "Use the snap command"
---

## Log in to a snap store

Snaps are normally installed from a store. You can interact with a store without signing-in, but signing-in offers a number of advantages. These advantages include the ability to access your private snaps and the automatic update of installed snaps (which incidentally doesn't require root on the device).

**Note**: At the time of writing the only store available is the cross-distro Ubuntu Store and the `snap login` instructions take you to that store. In the future, [other stores](/docs/core/store) should be available.

Snap stores hold a collection of snaps for delivery to clouds, devices, and private infrastructure. You [sign-in](https://login.ubuntu.com/+login) to a store as follows:

    $ sudo snap login me@myself.com
    Password: *********
    2-factor: ******
    Welcome!

When you are not logged in, most `snap` commands will require you to run them as root.

## Find snaps

A store can contain both public and private snaps.

Anybody can publish a snap, but store searches will only find snaps that are published to the `stable` release channel (and therefore have been reviewed and judged to be of good quality -- so users can install them without concern).

Searches look for matches in the snap name or description:

    $ snap find hello
    Name           Version  Developer  Notes  Summary
    hello          2.10     canonical  -      GNU Hello, the "hello world" snap
    hello-huge     1.0      noise      -      A really big snap
    hello-world    6.1      canonical  -      Hello world example

Community developer Brian Douglass is also maintaining an [online frontend](https://uappexplorer.com/apps?type=snappy&sort=-last_updated) to browse the main snap store.

## Install snaps

You can install snaps using the snap name. Here is an example of installing GNU Hello from the Free Software Foundation:

    $ snap install hello

## Run snaps

Each snap might include multiple related commands, with a default command that has the same name as the snap itself. Additional commands are prefixed with the snap name:

    $ hello
    Hello, world!
    $ hello.universe
    Hello, universe!

Snaps can also install services that run in the background, such as web servers or content management systems. Those will start automatically when the snap is installed.

## View details about installed snaps

To see a list of snaps installed on a system use `snap list`. The list also provides information on the software version, revision number, developer, and any extra notes provided with the snap (such as whether the snap is in developer mode or not).

    $ snap list
    Name           Version               Rev  Developer  Notes
    hello          2.10                  26   canonical  -
    ubuntu-core    16.04+20160419.20-55  109  canonical  -
    webdm          0.17                  21   canonical  -

## Automated updates

When you're signed into the store, snaps are updated automatically in the background to the latest version, every day. This can also be done manually using `snap refresh` for either all installed snaps or by specifying a particular snap to refresh.

## Developer mode

When you're developing a snap, you'll want to let it run without the strict security confinement that is expected of stable, published snaps. This is done by specifying `--devmode` on installation, to give permission for the snap to be run without confinement.

You can publish snaps that require `--devmode` to work, but they can only be published to the `beta` or `edge` release channels, not the stable or candidate channels. Users can then install those beta or edge versions using `--devmode` as well. Because of the risk that installing an unconfined app creates, the user is asked to confirm the installation:

    $ snap install flubber --beta
    Error: this version of foo requires devmode.
    $ snap install flubber --beta --devmode
    WARNING: snaps installed in devmode are not confined. You are trusting
    all the private data on this system to the developer "frankie".

    Do you still want to install ‘flubber’? [y/N] N

## Make your own snaps

Snaps can be easily created with a helper tool called snapcraft. Jump to the [Build snaps](/docs/build-snaps) section to get started.
