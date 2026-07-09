# Manual Installation

If you aren't using the [browser installer](https://kp.nicoverbruggen.be/), you can set everything up by hand. These steps copy the same files the browser tool would.

## Installing NickelMenu

**You must first install NickelMenu. NickelMenu must be installed for all of these changes to work correctly.**

First, install the latest version of [NickelMenu](https://pgaskin.net/NickelMenu/). Keep in mind that you will need at least version 0.6 of NickelMenu installed in order to have customized menu items.

To install NickelMenu, copy `.kobo/KoboRoot.tgz` to the `.kobo` folder on your Kobo, and let your e-reader reboot. (It should tell you that it's installing an update and reboot.)

## Setting up the files

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

You can toggle this feature via the **Toggle** tab (the custom NickelMenu tab at the bottom of the home screen), which lets you swap between viewing the book cover or the custom images you want. Useful for when you like seeing only your favorite covers...

> [!TIP]
> Keep in mind that you need to have the setting to display a book cover on. You can check it via **More > Settings > Energy saving and privacy > Show current read**, which must be set to "On".
