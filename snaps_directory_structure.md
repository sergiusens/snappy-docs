Title: Snaps Directory Structure	
# Snaps Directory Structure

This section describes the directories found within a snap and details their content. If you are building your snaps with snapcraft, after running a build the directory structure can be see in the `prime/` directory. 

Directory | Purpose | Content
:---- | ---- | ----
`root` | | `*.wrapper` files
`bin` | Contains all the components of the software being delivered in the snap
`meta` | Contains details that describe the snap | [`snap.yaml`](snap_metadata.txt), licence.txt
`share` |
