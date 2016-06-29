Title| Snap Metadata
# Snap Metadata
Snaps are defined by two sets of metadata specified in YAML files:

- snapcraft.yaml, which defines the snap to be built, usually with snapcraft. This file is placed in the root of the director in which the snap is to be built (for more information see [??](placeholder.md)).
- snap.yaml, which defines the content of the built snap and is placed in the root of the compressed snap file.

The content of the two YAML files is similar, however snapcraft.yaml includes a definition of the parts included in a snap (which the snap.yaml is missing) and the snap.yaml contains ??

## Purpose of snap.yaml

This file describes the snap package and is the most important file for a snap package. 

## Location of snap.yaml
Within a snap package the `snap.yaml` file is located in the `meta/` directory.

## Keys used in the snap.yaml 

The following keys are mandatory:

* `name`: The name of the snap (using only `^[a-z](?:-?[a-z0-9])*$`).
* `version`: The version of the snap (using only `[a-zA-Z0-9.+~-]`.

The following keys are optional:

* `summary`: A short summary.
* `description`: A long description.
* `license-agreement`: Set to `explicit` if the user needs to accept the content of the `meta/license.txt` file before the snap can be installed.
* `license-version`:  A string. When its value changes and
  `license-agreement` is `explicit` causes the user to be prompted to accept the content of `meta/license.txt` again.
* `type`: (Optional) The type of the snap, can be:  `app`, the default if `type` is omitted or empty; `gadget`, a special snap that Gadgets can use to customize snappy for their hardware; or `framework` - a specialized snap that extends the system that other snaps may use.
* `architectures`: (Optional) A YAML list of supported architectures,  defaults to  `["all"]` if omitted or empty.
* `frameworks`: A list of the frameworks the snap needs as dependencies.
* `apps`: the map of apps (binaries and services) that a snap provides
    * `<app name>`
    * `command`: (Required) The command to start the application or service.
    * `daemon`: (Optional) The type of daemon that will run the dervice: `simple`, `forking`, `oneshot`, or `dbus`
    * `stop-command`: (Optional) The command to stop the service.
    * `stop-timeout`: (Optional) The time in seconds to wait for the service to stop
    * `restart-condition`: (Optional) Specifies the restart
      condition. Can be one of `on-failure` (default), `never`, `on-success`,
      `on-abnormal`, `on-abort`,  and `always`. See `systemd.service(5)`
      (search for `Restart=`) for details.
    * `post-stop-command`: (Optional) A command that runs after the service has stopped.
    * `slots`: A map of interfaces.
    * `ports`: (Optional) Defines which ports the service will work.
        * `internal`: The ports the service will to connect to.
            * `tagname`: A free form name.
                * `port`: (Optional) Number/protocol, for example `80/tcp`.
                * `negotiable`: (Optional) `Y` if the app can use a different port.
        * `external`: The ports the service offers to the world.
            * `tagname`: A free form name, some names have meaning like "ui".
                * `port`: (Optional) Number/protocol, for example `80/tcp`.
                * `negotiable`: (Optional) `Y` if the app can use a different port.
    * `socket`: (Optional) Set to `true` if the service is socket activated. Must be specified with `listen-stream`.
    * `listen-stream`: (Optional) The full path of the stream socket or an
                abstract socket. When specifying an absolute path, it should
                normally be in one of the app-specific writable directories.
                When specifying an abstract socket, it must start with `@` and
                typically be followed by either the snap package name or the
                snap package name followed by `\_` and any other characters, for example  `@name` or `@name\_something`.
* `slots`: A map of interfaces.
