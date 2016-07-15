---
title: "Snapcraft reference"
---


## General commands

  `help`: Obtain help for a certain plugin or topic
  
  Usage:
  
    $ snapcraft help autotools
    This plugin is useful for building parts that use maven.
    
    The maven build system is commonly used to build Java projects.
    The plugin requires a pom.xml in the root of the source tree.
    ...
  
  `init`: Initialize a snapcraft project.
  
  Usage:

    $ snapcraft init
    Created snapcraft.yaml.
    Edit the file to your liking or run `snapcraft` to get started
  
  `list-plugins`: List the available plugins that handle different types of part.
  
  Usage:
  
    $ snapcraft list-plugins
    ant        cmake  gulp    kernel  nil      python3  tar-content
    autotools  copy   jdk     make    nodejs   qmake  
    catkin     go     kbuild  maven   python2  scons
  
  `login`: Authenticate session against Ubuntu One SSO.
  
  Usage:
  
    $ snapcraft login
    Enter your Ubuntu One SSO credentials.
    Email: foo@bar.com
    Password: 
    One-time password (just press enter if you don't use two-factor authentication): 
    123456
    Authenticating against Ubuntu One SSO.
    Login successful.

  `logout`: Clear session credentials.
  
  Usage:
  
    $ snapcraft logout
    Clearing credentials for Ubuntu One SSO.
    Credentials cleared.

  `register`: Register a package name in the store.

  Usage:
  
    $ snapcraft register foo
    Registering foo.
    Congratulations! You're now the publisher for 'foo'.
  
  `tour`: Setup the snapcraft examples tour in the specified directory, or ./snapcraft-tour/.

  Usage:
  
    $ snapcraft tour
    Snapcraft tour initialized in ./snapcraft-tour/
    Instructions are in the README, or https://snapcraft.io/create/#begin
  
  `upload`: Upload a snap to the Ubuntu Store.

  Usage:
  
    $ snapcraft upload foo*.snap
    Uploading foo_0_amd64.snap [================================] 100%

## Lifecycle commands

Calling snapcraft without a COMMAND will default to `snapcraft snap` and run the complete snapping lifecycle (pull -> build -> stage -> prime -> snap)

  `clean`: Remove content - cleans downloads, builds or install artifacts.

  `cleanbuild`: Create a snap using a clean environment managed by lxd.

  `pull`: Download or retrieve artifacts defined for a part.

  `build`: Build artifacts defined for a part. Build systems capable of running parallel build jobs will do so unless "--no-parallel-build" is specified.

  `stage`: Stage the part's built artifacts into the common staging area.

  `prime`: Final copy and preparation for the snap.

  `snap`: Create a snap.

The cleanbuild command requires a properly setup lxd environment that can connect to external networks. Refer to the "Ubuntu Desktop and Ubuntu Server" section in the [lxd documentation](https://linuxcontainers.org/lxd/getting-started-cli) to get started.

## Parts ecosystem commands

  `update`: Updates the parts listing from the cloud.
  
  `define`: Shows the definition for the cloud part.
  
  `search`: Searches the remotes part cache for matching parts.

## Flags

    --enable-geoip

Enables geoip for the pull step if stage-packages are used.

    --no-parallel-build

  Use only a single build job per part (the default number of jobs per part is equal to the number of CPUs)

## Specific to cleaning

    -s <step>, --step <step>

  Only clean the specified step and those that depend upon it. <step> can be one of: pull, build, stage or prime.


