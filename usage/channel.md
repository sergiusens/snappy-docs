---
title: "Changing the channel of a snap"
---


## Release channels -- stable, candidate, beta, and edge

On the store, snaps can be published into different channels at the same time: `stable`, `candidate` (release candidate), `beta`, and `edge`. This enables you to engage with users who are willing to test changes, and it helps users decide how close to the leading edge of development they want to be.

By default, snaps are installed from the stable channel. Versions of snaps from other channels need to be explicitly selected:

    $ snap install hello --beta
    $ hello
    Hello, snap padawan!

And a snap can be refreshed from a different channel to the one it was originally installed from:

    $ snap refresh hello --beta
    Name    Version   Rev   Developer   Notes
    hello   2.10.1    29    canonical   -
    hello  (beta) installed

This switches the snap to using this channel for future updates.
