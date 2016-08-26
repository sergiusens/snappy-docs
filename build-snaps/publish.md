---
title: "Publish your snap"
---


In order to share your snaps with the world, you'll need to publish them in a Store. This page describes the publication process you will follow for the Ubuntu-hosted Store.

Although, snaps are not tied to a specific type of store and you can host them any way you want, see the [Store](/docs/core/store) page for more details.

The exercises on this page are based on those included within the snapcraft tour. Install the tour with the `snapcraft tour` command, the relevant exercises can be found in `./snapcraft-tour/`.

## Your store account

To be able to publish snaps to the Ubuntu Store you will need to create an account
on [myapps.developer.ubuntu.com](https://myapps.developer.ubuntu.com/). This is your developer portal where you can customize how your snaps are presented, review uploads, and control publishing.

You'll need to choose a unique developer namespace as part of the account creation process. This name will be visible by users and associated with your published snaps.

Once you've confirmed your account, you're ready to start pushing your snaps to the Store. Make sure Snapcraft and the store know about you by logging in using the email address you provided at signup.

### Exercise

Create an account on [myapps.developer.ubuntu.com](https://myapps.developer.ubuntu.com/) and once it is confirmed, sign-in with both snapcraft and the snap command:

    $ snapcraft login
    $ snap login you@yourdomain.com

## Names under which you can publish snaps

You can publish your own version of a snap, provided you do so under a name you have rights to.

New names can be registered:

* by clicking **New Snap** at the top of the Store
* by visiting: [the name registration page](https://myapps.developer.ubuntu.com/dev/click-apps/register-name/)
* or by simply running `snapcraft register my-snap-name`

### Exercise

Use "hello-" suffixed by your name for the exercise (for example `hello-mark`), since you don't have rights to the "hello" snap name.

## Reserving names for software you publish

We can, if needed, rename snaps to ensure they match the expectations of most users. If you're the publisher most users expect for a name, then claim it on the [snap name registration](https://myapps.developer.ubuntu.com/dev/click-apps/register-name) page. If the name is already taken, this page will also let you submit a name dispute.

## Automatically assigned revision numbers

Each time you upload a snap the store will assigned a revision number to the snap, starting at 1. This revision number will be incremented each time you upload a new version of your snap.

### Exercise

Once you've registered your snap name, using any of the snaps from the snapcraft tour go back to the `snapcraft.yaml` file and update the name field. Run `snapcraft` again to rebuild the snap with the new name. With that done, the new revision of your snap can be uploaded to the Store:

    snapcraft upload hello-mark_1.0_*.snap

Open the URL that was returned from `snapcraft upload` or open the snap from the developer portal front page: [myapps.developer.ubuntu.com](https://myapps.developer.ubuntu.com)

You should see the 1.0 version in the left-hand column. Clicking on that link will bring up further details about this revision.

## Adding your app to channels

Uploading your snap won't make it immediately available for installation. You'll have to choose the channel(s) you wish to release into.

There are four channels available for your use:

*   `stable` is what most users will consume and as the name suggests, should be your most polished and tested versions.
*   `candidate` is used to vet uploads that should require no further code changes before moving to stable.
*   `beta` is used to provide preview releases of semi-stable changes.
*   `edge` is for your most recent changes, probably untested and with no guarantees attached.

On the store page you opened above you can edit the list of channels the snap should be released into. In this case click **Edit**, next to the Channels field. In the page that appears, select **Stable** and click **Save Changes**.

## App reviews

After you've chosen a channel, your application is sent for review. Most apps are reviewed by way of automated checks, but if your app uses sensitive interfaces it may be manually reviewed -- you can find more details on the review process [here](https://developer.ubuntu.com/en/publish/application-states/). Once your snap has been reviewed and approved, you can publish it when you're ready, making the snap available to users.

## Publishing your app

Once your snap has been reviewed you can publish it by clicking **Publish** in the store. Once published, users will be able to see your snap in the store and install it.

### Exercise

The build you uploaded is now the selected revision in the stable channel, meaning that installs of your snap will select this upload by default.

You can confirm this by installing the snap locally, replacing '`hello-mark`' with your snap name:

    $ snap install hello-mark
    Name        Version  Rev     Developer
    hello-mark  1.0      1       sabdfl
