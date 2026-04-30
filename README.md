# My Custom Kobo Configuration

## What is this?

This repository helps you set up your Kobo just like I set up mine, which includes **some power user features**, and also some useful features. For example, support for **screensavers** and an **easy dark mode toggle** for when you're reading. Take a look!

<kbd><img src="./screenshot.png" width="500px"></kbd>

### Tweaked tabs

> Less store, more of your books and stuff.

- My Books and My Notebooks are now **Books** and **Notes**.
- The Activity tab is now also visible as **Stats**.
- Notes and Discover tabs are **hidden** by default, but can be re-enabled.

### Custom menu items

> Power user stuff for typography lovers.

- **Screensaver**: Toggles the screensaver by moving the `.kobo/screensaver` folder. The repository comes with a nice moon screensaver, but you can add your own.
- **Screenshots**: Toggles taking screenshots with the power button. After taking screenshots, take care to remember to turn this back off...
- **Auto USB**: Toggles automatic USB connection. Helpful if you connect to your computer frequently, and don't want to keep approving the connection.
- **Legibility Status**: Shows the current status of the legibility toggle.
- **Legibility Toggle**: Toggles the experimental WebKit rendering feature, which enables rendering of ligatures. Since this causes issues w/ justified text rendering in `kepubs` this is a toggle. This will also briefly reboot your device!
- **IP Address**: If connected to WiFi, displays your IP address.
- **Invert & Reboot**: Inverts the colors of the entire display and reboots the device.
- **Sleep**: Does the same as pressing the power button.
- **Reboot**: Does the same as pressing the power button for a few seconds.

### Reader & menu

- In the reader menu, a **Dark Mode** toggle has also been added. You can press the ... (ellipsis menu) to see this option when reading. (You no longer need to dig into settings to toggle this!)
- Added **customized fonts**.

## Installing via browser over USB (easiest)

If you've got Chrome, it's super easy.

1. You can visit [this website](https://kp.nicoverbruggen.be/) and use the **Connect my Kobo** feature, and select **Install or remove NickelMenu**. 

2. You can then select **Install NickelMenu & Apply Preset**. Check all the boxes for the complete experience.

3. Tell the webpage to **copy the files to your device**, **safely unplug** your device and **wait a bit**. When it restarts, you should be set!

This is made possible by my [KoboPatch Web UI](https://github.com/nicoverbruggen/kobopatch-webui). You can visit the project page to learn more about it. It was made for maximum convenience.

You can also use this webpage to **uninstall NickelMenu** if you don't like it.

## Installing NickelMenu

**If you aren't using the installation via the browser, you must first install NickelMenu. I repeat: NickelMenu must be installed for all of these changes to work correctly.** 

First, install the latest version of [NickelMenu](https://pgaskin.net/NickelMenu/). Keep in mind that you will need at least version 0.6 of NickelMenu installed in order to have customized menu items.

To install NickelMenu, copy `.kobo/KoboRoot.tgz` to the `.kobo` folder on your Kobo, and let your e-reader reboot. (It should tell you that it's installing an update and reboot.)

## Using Mac setup script

Once NickelMenu is installed, you can use the script I've added to the repository. Connect your Kobo to your Mac via USB, then run:

```sh
./copy_mac.sh
```

This will copy over `.adds`, `.kobo`, and `fonts` (if the fonts folder on the device is empty), clean up macOS resource fork files, optionally set `ExcludeSyncFolders` (for KOReader/Calibre users), and eject the device.

## Manual Setup

Before you begin, make sure to show hidden files and folders in your file manager, because the `.adds` and `.kobo` folders are hidden by default.

### Installing menu items

Copy the `.adds` directory to the root of your `KOBOeReader` volume. This is the configuration for NickelMenu.

### Fonts

Copy the `fonts` directory and any extra fonts you like over. 

If you like what you're seeing, you can find [more fonts](https://github.com/nicoverbruggen/ebook-fonts/releases) in my other repository.

(I recommend getting the Kobo Core fonts, since this repository only includes a Kobo-optimized version of Readerly.)

### Screensaver

You can copy the screensaver from `.kobo/screensaver` into the same folder on your Kobo device.

**You can also add your own screensavers.** If you add any additional `.png` or `.jpg` files to the `.kobo/screensaver` folder, you will randomly get an image each time you put your device to sleep. Nice, right?

You can toggle this feature via the **Tweak** tab (the custom NickelMenu tab at the bottom of the home screen), which lets you swap between viewing the book cover or the custom images you want. Useful for when you like seeing only your favorite covers...

> [!TIP]
> Keep in mind that you need to have the setting to display a book cover on. You can check it via **More > Settings > Energy saving and privacy > Show current read**, which must be set to "On".

## Additional tweaks

### Separating Kobo and KOReader libraries

You tend to have the best experience if your Kobo doesn't scan certain directories! Important if you want to use KOReader or store other files that you don't want to appear in your library as "books".

To do this, add the following block to the `.kobo/Kobo/Kobo eReader.conf` file:

```
[FeatureSettings]
ExcludeSyncFolders=(calibre|\\.(?!kobo|adobe|calibre).+|([^.][^/]*/)+\\..+)
```

**After doing this, disconnect your device and reboot it to apply this configuration tweak! After rebooting, you can copy over files to the `calibre` directory.**

(This particular configuration ensures that a root-level `calibre` folder won't be scanned by Kobo's operating system. This essentially keeps the Calibre books separate from the Kobo books. Great when using KOReader.)

### KOReader

If you want an alternative reading experience, this is the way to go, and a great combination with Calibre.

Install the latest release of `KOReader`. You can [download it here](https://github.com/koreader/koreader/releases).

Follow the instructions carefully. **You will also need to add a new item to `.adds/nm/items` to launch KOReader via the Tweak menu!**

### Custom patches

In my screenshot above, I've disabled the 3rd row on the homescreen. 

This was originally accomplished via a custom patch, but I actually now have a better method. You can install my [experimental version of NickelMenu](https://github.com/nicoverbruggen/NickelMenu/releases) and apply the following items in your configuration file after installing it:

```
experimental:hide_home_row1col2_enabled:1
experimental:hide_home_row3_enabled:1
```

I should note that there are more options available in this experimental version, starting at v1.1. Please check the [release notes](https://github.com/nicoverbruggen/NickelMenu/releases) there for more information.

**You will need to reboot your device for these changes to be applied**, as the home screen elements are hidden when NickelMenu hooks into the system.
