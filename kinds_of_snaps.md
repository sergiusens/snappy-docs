#The kinds of snaps
There are four kinds of snaps used in an IoT device:

 - Kernel
 - Gadget
 - OS
 - Application

This section describes each of these snaps.

![snap architecture](https://github.com/CanonicalLtd/snappy-docs/blob/master/media/snap_architecture.png)

##Kernel snap

The kernel is what makes up the core of all linux devices, and so the kernel snap is the heart of any snappy system.

The kernel snap contains a system’s hardware abstraction layer (HAL). This layer  consist of the kernel, drivers, firmware, and additional libraries such as OpenGL, OpenCL, and alike. In addition the sandboxing and confinement features are provided through the kernel and their effectiveness very much depend on the security maintenance level of that kernel.

Canonical publishes and maintains kernel snaps, offering reliability, trust, and security. 

Nevertheless, it’s possible to create a custom kernel snap for a device. If you wish to do so, any linux kernel with reasonable baseline versioning (currently recommended 3.18) can be used. Any board support package (BSP) should be aligned with the Ubuntu Core LTS default kernel versions, as this will have significant impact for an SoCs community to produce top notch products for linux in general.

##Gadget snap
Gadget (aka, OEM) snaps may be used (among other things) to declare hardware capabilities to the system and pre-assign access to snaps that need to use this hardware.
Gadgets are about defining how the bits and pieces that have been put together as snaps to make a system play together. This is mostly config and resources that change the behaviour of the snaps and that allow tuning of the collaboration protocol features for specific usage scenarios.

##OS snap
The OS snap is a repacked rootfs that aims to be architecture specific, but hardware platform agnostic, meaning that the official OS snaps are meant to be used with any kernel that supports the minimum feature set required by the OS.

An OS snap carries meta information about the minimal requirements of the kernel expressed as a set of kernel configs that need to be enabled. Alternative configs can be offered using the '|' separator.

The base set "snappy-core-configs" will always be required and hence is omitted in this meta data.

The OS snap is basically a repackaged rootfs that can boot and power the system. Its main requirement is that the booted OS has a working snapd which explodes a lot of specific requirements on the underlying kernel and system architecture. Important is to check whether your chosen storage appraoch is supported as well as if your bootloader has the right logic/capabilities to realize the transactional kernel upgrade property that is a hard requirement for any snappy OS snap.
Right now only ubuntu-core OS snap are offered by Canonical with full support, but that might change over time.

##Application snap

###App snaps
There are a variety of snaps, such as framework snaps, gadget snaps and so on, but app snaps are the primary method for making a Snappy system useful. App snaps (identified by ‘type: app’ in their snappy metadata, which is the default if not specified) are currently the only type of snap you can package as “snaps” with our tool called snapcraft. snapcraft nicely integrates the build system of your software with the necessary packaging steps for snaps and is generally the preferred option for creating app snaps. When using snapcraft, you can simply create a ‘snapcraft.yaml’ file and all necessary build and packaging assets (such as metadata files, eg. ‘meta/package.yaml’) will be automatically generated. Other types of snaps will require you to create and edit these files yourself.

Apps ship services that start on boot or commands that the user or admin can run. They run under confinement in a security sandbox, which permissions are configured in the packaging metadata files, typically via an easy to use template system.

###Framework
Frameworks are a direct extension of the system, are delivered as snaps (ie, ‘type: framework’) and they exist primarily to provide mediation of shared resources (eg, device files, sensors, cameras, etc). Frameworks are quite similar to app snaps but are different in a number of important ways. Notably in terms of security policy, frameworks are:
like apps, used to ship services and/or binaries that run under confinement
able to have special permissions and customized security policy which allows elevated access to the system
used to ship framework-policy which extends the security policy available to snaps so they may use the framework. This framework-policy will automatically be installed when a framework is installed
referred to without an origin (see ‘APP_ID’, below, for more on origins)

It is also important to understand that frameworks are not:
used as a method to share code (ie, don't create a framework with libraries just for the sake of apps to be able to use them-- snaps should bundle what they need)
used as a method to bypass app isolation
used as a replacement mechanism for debs/rpms

## Executable types
A snap can declare two types of executables:

 - Binary
 - Service

Services are automatically started by the init system on boot, while binaries will be made available on the command for users to execute. Both services and binaries are run under confinement and should behave in the same manner. Commands exported as the Binary or Service type get declared in the snap manifest (package.yaml).
###Snappy binaries
One of the features of snappy is that application developers cannot get in a situation where they step on each other’s toes when creating binaries. This is achieved through confinement, assigning isolated resources on the system level and ensuring that binaries available on the command line get prefixed with the snap’s name to avoid namespace conflicts.

Note that binaries of frameworks do not get such a prefix.

A ‘test’ binary that got exported by your 'my-snap' app will be available as the ‘my-snap.test’ command at the command line interface.

You can run the following example with a real app, which executes the ‘env’ command from the ‘hello-world’ app.
	$ snappy install hello-world
	$ hello-world.env
### Snappy services
Snappy services get automatically started by the Ubuntu init system. The snappy service subcommands give a convenient way to query their status, start/stop/restart them and to access their logs.

To inspect all the services provided by all snaps on your system, simply run the snappy service status command without any further parameters:

	$ snappy service status

You can limit this information to just the services provided by a single snap. Or alternatively to a single service for a single snap. You can do that by adding the snap name and the service name to that command:

	# Show status of all services for a particular snap
	$ snappy service status SNAPNAME
	...
	# Show status of a given service for a particular snap
	$ snappy service status SNAPNAME SERVICENAME

Starting, stopping or restarting all services provided by a snap can be done by using the service start/stop/restart commands:

	# Restart ALL services of a snap
	$ snappy service restart SNAPNAME

In the same way as with the status command you can limit these subcommands to just a single service by adding the service name as a parameter:

	# restart ONE service of a snap
	$ snappy service restart SNAPNAME SERVICENAME

###Desktop
