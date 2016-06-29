Title: Installing Snaps
# Installing Snaps

End users will normally install snaps from a store. At the time of writing the only store available is Ubuntu Store -- so it is used in the following description but in the future other stores should be available.

| This tutorial assumes you have [Ubuntu 16.04 LTS](http://www.ubuntu.com/download/) installed on your desktop, cloud, VM, or server. You may need to `sudo apt install snapd` before continuing. |
| ---- |

## Log in to the global snap store

The snap store holds a public collection of snaps, and delivers them to clouds, devices, and private infrastructure. [Sign-in](https://login.ubuntu.com/+login) and then you'll be able to fetch snaps on demand:

    $ snap login me@myself.com
    Password: *********
    2-factor: ******
    Welcome!

Snaps don’t intrinsically depend on the Ubuntu store, that’s just what `snapd` does today, and we expect people will have different stores for their snaps in future.

The store contains both public and private snaps.

## Finding Snaps

Anybody can publish a snap, but if you search the store you'll only see snaps that have been reviewed and judged to be of good quality, and which can be installed securely. These are the ‘promoted’ snaps, and you can search them for a matching name or description:

    $ snap find hello
    Name           Version  Developer  Notes  Summary
    hello          2.10     canonical  -      GNU Hello, the "hello world" snap
    hello-huge     1.0      noise      -      A really big snap
    hello-world    6.1      canonical  -      Hello world example

As long as you know the name of the snap you want, and it is public or your own private snap, you can install it using its name directly. But if you search the store, you’ll only see public, promoted results.

## Installing the snap

To install the snap you want, here GNU Hello from the Free Software Foundation is being used as an example, use:

    $ snap install hello

## Running the snap

Each snap might include multiple related commands, with a default command that has the same name as the snap itself. Additional commands are prefixed with the snap name:

    $ hello
    Hello, world!
    $ hello.universe
    Hello, universe!

Snaps can also install services that run in the background, such as web servers or content management systems. Those will start automatically when you install the snap.

## Viewing installed snaps
To see a list of snaps installed on your system use `snap list`. This also provides information on the snaps the software version, the unique revision, the developer of the installed snap, and any extra information provided with the snap (such as whether the snap is in developer mode or not).

    $ snap list
    Name           Version               Rev  Developer  Notes
    hello          2.10                  26   canonical  -
    ubuntu-core    16.04+20160419.20-55  109  canonical  -
    webdm          0.17                  21   canonical  -

## Always fresh -- update fast and reliably

Snaps are updated automatically in the background every day. You can manually get the latest version of all your snaps with `snap refresh` which will bring you completely up to date for all snaps, unless you specify particular snaps to refresh.

## Release channels -- stable, candidate, beta and edge

Developers can publish stable, release candidate, beta, and edge versions of a snap, at the same time. This enables them to engage with users who are willing to test upcoming changes, and it enables users to decide how close to the leading edge of development they want to be.

By default, snaps are installed from the stable channel, but there is also a candidate channel which by convention will preview the next stable release, a beta channel and an edge channel.

    $ snap refresh hello --channel=beta
    Name    Version   Rev   Developer   Notes
    hello   2.10.1    29    canonical   -
    hello  (beta) installed

Run the beta version of the command:

    $ hello
    Hello, snap padawan!

Note that you could have directly installed hello from the beta channel via:

    $ snap install hello --channel-beta

## Developer mode

When a developer is working on a snap, they may want to let it run without the strict security confinement that is expected of stable, published snaps for general consumption. This is done by specifying `--devmode` on installation, to give permission for this snap to be run without that confinement.

Developers can publish snaps that require `--devmode` to work, but they can only publish those to beta or edge channels, not stable or candidate channels. As a user, you can install those beta or edge versions using `--devmode` as well. Bear in mind that you should NEVER do this unless you absolutely trust the developer with all the information on your system.

    $ snap install flubber --channel=beta
    Error: this version of foo requires devmode.
    $ snap install flubber --channel=beta --devmode
    WARNING: snaps installed in devmode are not confined. You are trusting
    all the private data on this system to the developer "frankie".

    Do you still want to install ‘flubber’? [y/N] N