---
title: Build your first snap
---

## A single text file

Snapcraft uses a single text file to describe the entire build process for a snap: the snapcraft.yaml file.

To get started with a template, you can run `snapcraft init`. It will create a snapcraft.yaml file in the current directory. Let's have a look inside.

```yaml
$ more snapcraft.yaml
name: my-snap-name # you probably want to 'snapcraft register <name>'
version: '0.1' # just for humans, typically '1.2+git' or '1.3.2'
summary: Single-line elevator pitch for your amazing snap # 79 char long summary
description: |
  This is my-snap's description. You have a paragraph or two to tell the
  most important story about your snap. Keep it under 100 words though,
  we live in tweetspace and your description wants to look good in the snap
  store.

grade: devel # must be 'stable' to release into candidate/stable channels
confinement: devmode # use 'strict' once you have the right plugs and slots

parts:
  my-part:
    # See 'snapcraft plugins'
    plugin: nil
```

Note that this `snapcraft.yaml` is the only file needed in the directory. Snapcraft doesn't need anything else as it can fetch remotely everything it needs to build the snap, using the `snapcraft.yaml` description.

## From an app to a snap

Your first snap is going to be a very straightforward one. We are going to snap `GNU Hello`, an app that simply prints "Hello, world!" on the command line.

Let's edit the snapcraft.yaml file. First, we need to set the general metadata for the snap: its name, the version of GNU Hello we want, a summary and a user friendly description, then `grade` and `confinement`, which will tell the system if the snap is meant to be a stable release (`grade: stable` or `devel`) and if strict security policies should be enforced (`confinement: strict` or `devmode`).

Note that when it is in the store, it will be only visible in search results if `grade` is `stable` and `confinement` is `strict`.

```yaml
name: hello
version: "2.10"
summary: GNU Hello, the "hello world" snap
description: GNU Hello prints a friendly greeting.
grade: stable
confinement: strict
```

Then, you need to declare apps and commands contained in your snap. In this case, we have a single app (`hello`) with a single command (`hello`).

```yaml
apps:
  hello:
    command: hello
```

Now, you need to tell snapcraft where to find the hello source code and how to build it. This is done with the `parts` keyword, which are literally parts of your snap. In this case, we have a single part, we pull from a tar.gz `source` and build using the `autotools` plugin (which will run the usual autotools steps: `configure`, `make`, `make install`).

```yaml
parts:
  gnu-hello:
    plugin: autotools
    source: http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz
```

Let's have a look at our final file:

```yaml
name: hello
version: "2.10"
summary: GNU Hello, the "hello world" snap
description: GNU hello prints a friendly greeting.
  This is part of the snapcraft tour at https://snapcraft.io/create/
confinement: strict

apps:
  hello:
    command: hello

parts:
  gnu-hello:
    plugin: autotools
    source: http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz
```

Snapcraft will interpret this file, fetch and install everything that is needed, build it, and give you a snap.

## Run snapcraft

You can now build this snap, note that you'll be prompted for your system password each time you run `snapcraft`:

```
$ snapcraft
[sudo] password for [your user name]:  ***
Preparing to pull gnu-hello
Pulling gnu-hello
Preparing to build gnu-hello
Building gnu-hello
[...]
Snapped hello_2.10_amd64.snap
```

You'll have seen that Snapcraft fetched the source code, configured, and built it. The snap is now available in your directory, along with new `parts`, `prime`, and `snap` directories.

```bash
$ ls
hello_2.10_amd64.snap  parts  snap  snapcraft.yaml  prime
```

As you can see a snap is a single file. The name of the file is based on information in the `snapcraft.yaml` (its name and version) and the architecture you're building on: `<name>_<version>_<arch>.snap`.

Here, the snap was built on an amd64 machine, so the architecture used in the file name reflects that. (The following commands, and exercises later in this section, use globs so you don't need to replace the architecture if yours is different.)

## Install the snap

Now, everything you need for the hello app is inside the snap file. You can install it locally.

The  `--dangerous` flag needs to be used here because your snap has not been signed.

```bash
$ sudo snap install hello_2.10_*.snap --dangerous
hello 2.10 installed

64.64 MB / 64.64 MB [=============================] 100.00 % 3.97 MB/s

Name   Version  Rev     Developer  Notes
hello  2.10     X1
```

Congratulations, you've just made and installed your first snap.

## Tutorials

A growing collection of tutorials is available packaged up as a snap.

To get started, install the snap:

    sudo snap install snap-codelabs

You can then access tutorials on your [local machine](http://localhost:8123/) at port 8123.
