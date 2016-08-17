---
title: "Snapcraft plugins reference"
---

This page references all the available snapcraft plugins to build your parts.

Usage snippets can be found in the Playpen GitHub repository. As an example, here is a search that lists [all `cmake` plugin snippets](https://github.com/ubuntu/snappy-playpen/search?utf8=%E2%9C%93&q=%22plugin%3A+cmake%22&type=Code).

Note that you can run `$ snapcraft help <plugin>` to access the following documentation from the command-line.

## General topics

*   [Built-in keywords and common options](#built-in-keywords-and-common-options)
*   [Common 'source' keys](#common-source-keys)

## Build systems

[kbuild](#the-kbuild-plugin), [make](#the-make-plugin), [qmake](#the-qmake-plugin), [autotools](#the-autotools-plugin), [cmake](#the-cmake-plugin), [scons](#the-scons-plugin)

## Languages

*   Java: [ant](#the-ant-plugin), [gradle](#the-gradle-plugin), [maven](#the-maven-plugin)
*   Python: [python2](#the-python2-plugin), [python3](#the-python3-plugin)
*   Node: [gulp](#the-gulp-plugin), [nodejs](#the-nodejs-plugin)
*   Go: [go](#the-go-plugin), [godeps](#the-godeps-plugin)
*   Rust: [rust](#the-rust-plugin)

## Projects

*   ROS: [catkin](#the-catkin-plugin)
*   Linux: [kernel](#the-kernel-plugin)

## Utilities

[nil](#the-nil-plugin), [dump](#the-dump-plugin)

&nbsp;

### Built-in keywords and common options

There are several built-in keywords which can be used in any part regardless
of the choice of plugin.

  - `after: [part, part, part...]`

    Snapcraft will make sure that it builds all of the listed parts before
    it tries to build this part. Essentially these listed dependencies for
    this part, useful when the part needs a library or tool built by another
    part.

    If such a dependency part is not defined in this snapcraft.yaml, it must
    be defined in the cloud parts library, and snapcraft will retrieve the
    definition of the part from the cloud. In this way, a shared library of
    parts is available to every snap author - just say 'after' and list the
    parts you want that others have already defined.

  - `build-packages: [deb, deb, deb...]`

    A list of Ubuntu packages to install on the build host before building
    the part. The files from these packages will not go into the final snap
    unless they are also explicitly described in stage-packages.

  - `stage-packages: [deb, deb, deb...]`

    A list of Ubuntu packages must be unpacked in the `stage/` directory.
    XXX before build? Before stage?

  - `organize: YAML`

    Snapcraft will rename files according to this YAML sub-section. The
    content of the 'organize' section consists of old path keys, and their
    new values after the renaming.

    This can be used to avoid conflicts between parts that use the same
    name, or to map content from different parts into a common conventional
    file structure. For example:

      organize:
        usr/oldfilename: usr/newfilename
        usr/local/share/: usr/share/

    The key is the internal part filename, the value is the exposed filename
    that will be used during the staging process. You can rename whole
    subtrees of the part, or just specific files.

    Note that the path is relative (even though it is "usr/local") because
    it refers to content underneath parts/<part-name>/install which is going
    to be mapped into the stage and prime areas.

  - `filesets: YAML`

    When we map files into the stage and prime areas on the way to putting
    them into the snap, it is convenient to be able to refer to groups of
    files as well as individual files.  Snapcraft lets you name a fileset
    and then use it later for inclusion or exclusion of those files from the
    resulting snap.

    For example, consider man pages of header files.. You might want them
    in, or you might want to leave them out, but you definitely don't want
    to repeatedly have to list all of them either way.

    This section is thus a YAML map of fileset names (the keys) to a list of
    filenames. The list is built up by adding individual files or whole
    subdirectory paths (and all the files under that path) and wildcard
    globs, and then pruning from those paths.

    The wildcard * globs all files in that path. Exclusions are denoted by
    an initial `-`.

    For example you could add usr/local/* then remove usr/local/man/*:

      filesets:
        allbutman: [ usr/local/*, -usr/local/man/* ]
        manpages: [ usr/local/man ]

    Filenames are relative to the part install directory in
    `parts/<part-name>/install`. If you have used 'organize' to rename files
    then the filesets will be built up from the names after organization.

  - `stage: YAML file and fileset list`

    A list of files from a part install directory to copy into `stage/`.
    Rules applying to the list here are the same as those of filesets.
    Referencing of fileset keys is done with a $ prefixing the fileset key,
    which will expand with the value of such key.

    For example:

      stage:
        - usr/lib/*   #### Everything under parts/<part-name>/install/usr/lib
        - -usr/lib/libtest.so   #### Excludng libtest.so
        - $manpages             #### Including the 'manpages' fileset

  - `prime: YAML file and fileset list`

    A list of files from a part install directory to copy into `prime/`.
    This section takes exactly the same form as the 'stage' section  but the
    files identified here will go into the ultimate snap (because the
    `prime/` directory reflects the file structure of the snap with no
    extraneous content).

### Common 'source' keys

Unless the part plugin overrides this behaviour, a part can use these
'source' keys in its definition. They tell snapcraft where to pull source
code for that part, and how to unpack it if necessary.

- `source: url-or-path`

    A URL or path to some source tree to build. It can be local
    ('./src/foo') or remote ('https://foo.org/...'), and can refer to a
    directory tree or a tarball or a revision control repository
    ('git:...').

- `source-type: git, bzr, hg, svn, tar, or zip`

    In some cases the source string is not enough to identify the version
    control system or compression algorithm. The source-type key can tell
    snapcraft exactly how to treat that content.

- `source-branch: <branch-name>`

    Snapcraft will checkout a specific branch from the source tree. This
    only works on multi-branch repositories from git and hg (mercurial).

- `source-tag: <tag>`

    Snapcraft will checkout the specific tag from the source tree revision
    control system.

- `source-subdir: path`

    Snapcraft will checkout the repository or unpack the archive referred to
    by the 'source' keyword into parts/<part-name>/src/ but it will only
    copy the specified subdirectory into parts/<part-name>/build/

Note that plugins might well define their own semantics for the 'source'
keywords, because they handle specific build systems, and many languages
have their own built-in packaging systems (think CPAN, PyPI, NPM). In those
cases you want to refer to the help text for the specific plugin.

### The ant plugin

The ant plugin is useful for ant based parts.

The ant build system is commonly used to build Java projects.
The plugin requires a build.xml in the root of the source tree.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.


### The autotools plugin

The autotools plugin is used for autotools based parts.

Autotools based projects are the ones that have the usual
`./configure && make && make install` instruction set.

The plugin tries to build using ./configure first, if it is not there
it will run ./autogen and if autogen is not there it will run autoreconf.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

In addition, this plugin uses the following plugin-specific keywords:

    - configflags:
      (list of strings)
      configure flags to pass to the build such as those shown by running
      './configure --help'
    - install-via:
      (enum, 'destdir' or 'prefix')
      Whether to install via DESTDIR or by using --prefix (default is
      'destdir')


### The catkin plugin

The catkin plugin is useful for building ROS parts.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - catkin-packages:
      (list of strings)
      List of catkin packages to build.
    - source-space:
      (string)
      The source space containing Catkin packages. By default this is 'src'.
    - include-roscore:
      (boolean)
      Whether or not to include roscore with the part. Defaults to true.


### The cmake plugin

The cmake plugin is useful for building cmake based parts.

These are projects that have a CMakeLists.txt that drives the build.
The plugin requires a CMakeLists.txt in the root of the source tree.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - configflags:
      (list of strings)
      configure flags to pass to the build using the common cmake semantics.


### The copy plugin

The copy plugin is useful for assets or other sources with no build system.

This plugin is DEPRECATED in favor of the `dump` plugin.

This plugin uses the common plugin keywords as well as those for 'sources'
(though the 'source' keyword is optional). For more information check the
'plugins' topic for the former and the 'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - files:
      (object)
      A dictionary of key-value pairs. The key is the current location of the
      file relative to snapcraft.yaml (unless `source` is specified, in which
      case it's relative to the root of the source). The value is where to
      place the file in-snap, and is relative to the root of the snap. This
      works like `cp -r <key> <value>`. Note that globbing is supported for the
      key, allowing one to use *, ?, and character ranges expressed with [].


### The dump plugin

This plugin just dumps the content from a specified source.

This plugin uses the common plugin keywords as well as those for 'sources'.
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

In the cases where dumping the content needs some mangling or organizing
one would take advantage of the core functionalities available to plugins
such as: `filesets`, `stage`, `snap` and `organize`.


### The go plugin

The go plugin can be used for go projects using `go get`.

This plugin uses the common plugin keywords, for more information check the
'plugins' topic.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - go-packages:
      (list of strings)
      Go packages to fetch, these must be a "main" package. Dependencies
      are pulled in automatically by `go get`.
      Packages that are not "main" will not cause an error, but would
      not be useful either.
      If the package is a part of the go-importpath the local package
      corresponding to those sources will be used.

    - go-importpath:
      (string)
      This entry tells the checked out `source` to live within a certain path
      within `GOPATH`.
      This is not needed and does not affect `go-packages`.


### The godeps plugin

The godeps plugin can be used for godeps-enabled go projects.

These projects have a file containing information about the project's
dependencies. This file is typically called "dependencies.tsv," but may be
named anything.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - godeps-file:
      (string)
      Path to the godeps dependencies file contained within the source
      (default: dependencies.tsv)

    - go-importpath:
      (string)
      This entry tells the checked out `source` to live within a certain path
      within `GOPATH`. This is required in order to work with absolute imports
      and import path checking.


### The gradle plugin

This plugin is useful for building parts that use gradle.

The gradle build system is commonly used to build Java projects.
The plugin requires a pom.xml in the root of the source tree.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - gradle-options:
      (list of strings)
      flags to pass to the build using the gradle semantics for parameters.


### The gulp plugin

This plugin is used for gulp.js, the streaming build system.

The plugin uses gulp to drive the build. It requires a gulpfile.js in
the root of the source.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - gulp-tasks:
      (list)
      A list of gulp tasks to run.
    - node-engine:
      (string)
      The version of nodejs to use for the build.


### The kbuild plugin

The kbuild plugin is used for building kbuild based projects as snapcraft
parts.

This plugin is based on the snapcraft.BasePlugin and supports the properties
provided by that plus the following kbuild specific options with semantics as
explained above:

    - kdefconfig:
      (list of kdefconfigs)
      defconfig target to use as the base configuration. default: "defconfig"

    - kconfigfile:
      (filepath)
      path to file to use as base configuration. If provided this option wins
      over kdefconfig. default: None

    - kconfigs
      (list of strings)
      explicit list of configs to force; this will override the configs that
      were set as base through kdefconfig and kconfigfile and dependent configs
      will be fixed using the defaults encoded in the kbuild config
      definitions.  If you don't want default for one or more implicit configs
      coming out of these, just add them to this list as well.

The plugin applies your selected defconfig first by running

    make defconfig

and then uses the kconfigs flag to augment the resulting config by prepending
the configured kconfigs values to the .config and running

    "yes" "" | make oldconfig

to create an updated .config file.

If kconfigfile is provided this plugin will use the provided config file
wholesale as the starting point instead of make $kdefconfig. In case user
configures both a kdefconfig as well as kconfigfile, kconfigfile approach will
be used.


### The kernel plugin

The kernel plugin refines the generic kbuild plugin to allow building
kernel snaps with all the bells and whistles in one shot...

WARNING: this plugin's API is unstable. The cross compiling support is
         experimental.

The following kernel specific options are provided by this plugin:

    - kernel-image-target:
      (yaml object or string; default: bzImage)
      the default target is bzImage and can be set to any specific
      target.
      For more complex cases where one would want to use
      the same snapcraft.yaml to target multiple architectures a
      yaml object can be used. This yaml object would be a map of
      debian architecture and kernel image build targets.

    - kernel-initrd-modules:
      (array of string)
      list of modules to include in initrd; note that kernel snaps do not
      provide the core boot logic which comes from snappy Ubuntu Core
      OS snap. Include all modules you need for mounting rootfs here.

    - kernel-with-firmware:
      (boolean; default: True)
      use this flag to disable shipping binary firmwares

    - kernel-initrd-firmware:
      (array of string)
      list of firmware files to include in the initrd; these need to be
      relative paths to .installdir and this option does not work if you
      disable building firmware

    - kernel-initrd-compression:
      (string; default: gz)
      initrd compression to use; the only supported value now is 'gz'.

    - kernel-device-trees:
      (array of string)
      list of device trees to build, the format is <device-tree-name>.dts.


### The make plugin

The make plugin is useful for building make based parts.

Make based projects are projects that have a Makefile that drives the
build.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keyword:

    - makefile:
      (string)
      Use the given file as the makefile.

    - make-parameters:
      (list of strings)
      Pass the given parameters to the make command.

    - make-install-var:
      (string; default: DESTDIR)
      Use this variable to redirect the installation into the snap.


### The maven plugin

This plugin is useful for building parts that use maven.

The maven build system is commonly used to build Java projects.
The plugin requires a pom.xml in the root of the source tree.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - maven-options:
      (list of strings)
      flags to pass to the build using the maven semantics for parameters.


### The nil plugin

The nil plugin is useful for parts with no source.

Using this, parts can be defined purely by utilizing properties automatically
included by Snapcraft, e.g. stage-packages.


### The nodejs plugin

The nodejs plugin is useful for node/npm based parts.

The plugin uses node to install dependencies from `package.json`. It
also sets up binaries defined in `package.json` into the `PATH`.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - node-packages:
      (list)
      A list of dependencies to fetch using npm.
    - node-engine:
      (string)
      The version of nodejs you want the snap to run on.


### The python2 plugin

The python2 plugin can be used for python 2 based parts.

The python2 plugin can be used for python 2 projects where you would
want to do:

    - import python modules with a requirements.txt
    - build a python project that has a setup.py
    - install sources straight from pip

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - requirements:
      (string)
      path to a requirements.txt file
    - constraints:
      (string)
      path to a constraints file
    - python-packages:
      (list)
      A list of dependencies to get from PyPi


### The python3 plugin

The python3 plugin can be used for python 3 based parts.

The python3 plugin can be used for python 3 projects where you would
want to do:

    - import python modules with a requirements.txt
    - build a python project that has a setup.py
    - install sources straight from pip

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - requirements:
      (string)
      path to a requirements.txt file
    - python-packages:
      (list)
      A list of dependencies to get from PyPi


### The qmake plugin

The qmake plugin is useful for building qmake-based parts.

These are projects that are built using .pro files.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - options:
      (list of strings)
      additional options to pass to the qmake invocation.
    - qt-version:
      (enum, 'qt4' or 'qt5')
      Version of Qt to use with qmake.
    - project-files:
      (list of strings)
      list of .pro files to pass to the qmake invocation.


### The rust plugin

This rust plugin is useful for building rust based parts.

Rust uses cargo to drive the build.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - rust-channel
      (string)
      select rust channel (stable, beta, nightly)
    - rust-revision
      (string)
      select rust version


### The scons plugin

The scons plugin is useful for building parts that build with scons.

These are projects that have a SConstruct that drives the build.

This plugin uses the common plugin keywords as well as those for "sources".
For more information check the 'plugins' topic for the former and the
'sources' topic for the latter.

Additionally, this plugin uses the following plugin-specific keywords:

    - scons-options:
      (list of strings)
      flags to pass to the build using the scons semantics for parameters.
