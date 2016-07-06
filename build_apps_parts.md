Title: Parts
#Parts

Parts are reusable components that can be included in a snap. They're analogous to a library that you would call in your program. There are three types of parts:

- Parts from local source that use local files on your machine. For example (as seen in `10-SNAPS/01-service/`):

         parts:
           hello:
             plugin: nodejs
               source:

- Parts from online sources, such as `github`, `bzr`, `tarball`, or any code repository you like. For example:

        parts:
          godd:
           plugin: go
            source: https://github.com/mvo5/godd.git
          gnu-hello:
           plugin: autotools
            source: http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz

You've already seen the last part in `00-SNAPCRAFT/01-easy-start/`.

To see parts built and shared by others — [https://wiki.ubuntu.com/Snappy/Parts](https://wiki.ubuntu.com/Snappy/Parts)

The features of parts shared by this last method are the focus of our next example:

    $ cd ../../20-PARTS-PLUGINS/01-reusable-part
    $ snapcraft
    $ sudo snap install hello-world-desktop_0.1_*.snap

Which can be run with the `hello-world-desktop` command as defined in the `snapcraft.yaml`:
apps:

    hello-world-desktop:
      command: qt5-launch hello-world-desktop

But notice this involves an extra tool `qt5-launch`, which prepares the environment for launching the real application. These `qt5-launch` and `hello-world-desktop` commands come from:

    parts:
      hello-world:
        plugin: cmake
        source: src/
        build-packages:
          - qtbase5-dev
        stage-packages:
          # Here for the plugins-- they're not linked in automatically.
          - libqt5gui5
        after: [qt5conf] # A part in the cloud

In this part definition:

*   `build-packages` lists the dependencies needed to build the contents of the snap. These aren't packed into the final snap. `qtbase5-dev` has been specified here since that package contains the headers, libraries, and tools needed to build the app
*   `stage-packages` lists the dependencies needed to actually run the contents of the snap. They'll be packed into the final snap. Here, the requirement is for the hello-world part to download and unpack `libqt5gui5` with all its dependencies. This method can reuse any of the 48000 .deb packages that traditional Ubuntu provides. It's really that easy: just specify the packages you need embedded into your snap
*   `after:` [`qt5conf`] lists the parts that must be staged before this part can be built. However, you may have noticed that this YAML doesn't actually contain the `qt5conf` part. That's because it's a part in the cloud, which is a way for collaborating, reusing, and sharing already-written parts. The previously mentioned `qt5-launch` tool comes from the `qt5conf` part, without any additional effort from you. This way you can make use of and build upon what others have created

#### sharing: Sharing your parts with other developers

If you would like to publish your own parts, you can contribute them on the wiki at [https://wiki.ubuntu.com/snapcraft/parts](https://wiki.ubuntu.com/snapcraft/parts).

Your contributions will always be welcome!

### 20 - PARTS & PLUGINS

You first met parts at the start of this guide and have been working with them in all the examples so far. So, it's time to take a closer look at how parts work and the options they provide you. Then there are a couple of references for plugins, in case you would like to explore further.

#### parts-intro: A "part" is a reusable component of a snap
