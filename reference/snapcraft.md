---
title: "Snapcraft reference"
---


## General commands

    help
  
  Obtain help for a certain plugin or topic
  
    init
  
  Initialize a snapcraft project.
  
  `list-plugins`: List the available plugins that handle different types of part.
  
  `login`: Authenticate session against Ubuntu One SSO.
  
  `logout`: Clear session credentials.
  
  `register`: Register a package name in the store.
  
  `tour`: Setup the snapcraft examples tour in the specified directory, or ./snapcraft-tour/.
  
  `upload`: Upload a snap to the Ubuntu Store.

The available lifecycle commands are:
  clean        Remove content - cleans downloads, builds or install artifacts.
  cleanbuild   Create a snap using a clean environment managed by lxd.
  pull         Download or retrieve artifacts defined for a part.
  build        Build artifacts defined for a part. Build systems capable of
               running parallel build jobs will do so unless
               "--no-parallel-build" is specified.
  stage        Stage the part's built artifacts into the common staging area.
  prime        Final copy and preparation for the snap.
  snap         Create a snap.

Parts ecosystem commands
  update       Updates the parts listing from the cloud.
  define       Shows the definition for the cloud part.
  search       Searches the remotes part cache for matching parts.

Calling snapcraft without a COMMAND will default to 'snap'

The cleanbuild command requires a properly setup lxd environment that
can connect to external networks. Refer to the "Ubuntu Desktop and
Ubuntu Server" section on
https://linuxcontainers.org/lxd/getting-started-cli
to get started.

    --enable-geoip

Enables geoip for the pull step if stage-packages are used.

Options specific to building:
  --no-parallel-build                   use only a single build job per part
                                        (the default number of jobs per part is
                                        equal to the number of CPUs)

Options specific to cleaning:
  -s <step>, --step <step>              only clean the specified step and those
                                        that depend upon it. <step> can be one
                                        of: pull, build, stage or strip.

Options specific to snapping:
  -o <snap-file>, --output <snap-file>  used in case you want to rename the
                                        snap.

The available commands are:
  help         Obtain help for a certain plugin or topic
  init         Initialize a snapcraft project.
  list-plugins List the available plugins that handle different types of part.
  login        Authenticate session against Ubuntu One SSO.
  logout       Clear session credentials.
  register     Register the package name in the store.
  tour         Setup the snapcraft examples tour in the specified directory,
               or ./snapcraft-tour/.
  upload       Upload a snap to the Ubuntu Store.

The available lifecycle commands are:
  clean        Remove content - cleans downloads, builds or install artifacts.
  cleanbuild   Create a snap using a clean environment managed by lxd.
  pull         Download or retrieve artifacts defined for a part.
  build        Build artifacts defined for a part. Build systems capable of
               running parallel build jobs will do so unless
               "--no-parallel-build" is specified.
  stage        Stage the part's built artifacts into the common staging area.
  prime        Final copy and preparation for the snap.
  snap         Create a snap.

Parts ecosystem commands
  update       Updates the parts listing from the cloud.
  define       Shows the definition for the cloud part.
  search       Searches the remotes part cache for matching parts.

Calling snapcraft without a COMMAND will default to 'snap'

The cleanbuild command requires a properly setup lxd environment that
can connect to external networks. Refer to the "Ubuntu Desktop and
Ubuntu Server" section on
https://linuxcontainers.org/lxd/getting-started-cli
to get started.





