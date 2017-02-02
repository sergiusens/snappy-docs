---
title: Channels
---

The Ubuntu store allows you to publish snaps in multiple release channels.

## Available release channels

There are four channels available for your snaps, note that the same revision of a snap can be published into several channels at once.

### Stable

Stable is what most users will consume and as the name suggests, should be your most polished, stable and tested versions. Snaps in this channel appear in user searches.

### Candidate

Candidate is used to vet uploads that should require no further code changes before moving to stable.

### Beta

Beta is used to provide preview releases of tested changes.

### Edge

Edge is for your most recent changes, probably untested and with no guarantees attached.

## Confinement and grade

In your `snapcraft.yaml`, you can declare the development status of your snap with the `grade` keyword and its required confinement with the `confinement` one.

Depending on these, your snap can be restricted to certain channels.

|                 | `confinement: strict`  | `confinement: classic` | `confinement: devmode` |
| --------------- | ---------------------- | ---------------------- | ---------------------- |
| `grade: stable` | *all* channels         | *all* channels         | `beta` and `edge` only |
| `grade: devel`  | `beta` and `edge` only | `beta` and `edge` only | `beta` and `edge` only |
