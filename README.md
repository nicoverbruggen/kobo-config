# My Custom Kobo Configuration

## What is this?

This repository helps you set up your Kobo just like I set up mine. Take a look!

<kbd><img src="./screenshot.png" width="500px"></kbd>

## What are the tweaks?

- Tweaked **tab layout**!
    - My Books and My Notebooks are now "Books" and "Notes".
    - The Activity tab is now also visible as "Stats".
    - (Notes and Discover tabs are hidden by default, but can be re-enabled.)
    - Note: This is only available with the latest version of NickelMenu, which I included in the repository.
- Added **customized fonts**.
- Tweak tab with various options:
    - **Screensaver**: Toggles the screensaver by moving the `.kobo/screensaver` folder. The repository comes with a nice moon screensaver, but you can add your own.
    - **Screenshots**: Toggles taking screenshots with the power button. Take care to disable this timely or you may encounter issues w/ waking up the device.
    - **Auto USB**: Toggles automatic USB connection. Helpful if you connect to your computer frequently, and don't want to keep approving the connection.
    - **Toggle Legibility**: Toggles the experimental WebKit rendering feature, which enables rendering of ligatures. Since this causes issues w/ justified text rendering in `kepubs` this is a toggle. This will also briefly reboot your device!
    - **IP Address**: If connected to WiFi, displays your IP address.
    - **Invert & Reboot**: Inverts the colors of the entire display and reboots the device.
    - **Sleep**: Does the same as pressing the power button.
    - **Reboot**: Does the same as pressing the power button for a few seconds.
- In the reader menu, a **Dark Mode** toggle has also been added. You can press the ... (ellipsis menu) to see this option when reading. You no longer need to dig into settings to toggle this!

## Installation Guide

### NickelMenu

First, install the latest version of [NickelMenu](https://pgaskin.net/NickelMenu/).

You will need at least version 0.6 of NickelMenu installed in order to have customized menu items.

To install NickelMenu, copy `.kobo/KoboRoot.tgz` to your device in the same folder and let your device reboot.

Copy the `.adds` directory to the root of your `KOBOeReader` volume. This is the configuration for NickelMenu.

### Separating Kobo and KOReader libraries

#### Ensuring this works

Ensure your Kobo doesn't scan certain directories! Important if you want to use KOReader. 

To do this, add the following block to the `.kobo/Kobo/Kobo eReader.conf` file:

```
[FeatureSettings]
ExcludeSyncFolders=(calibre|\\.(?!kobo|adobe|calibre).+|([^.][^/]*/)+\\..+)
```

**After doing this, disconnect your device and reboot it to apply this configuration tweak! After rebooting, you can copy over files to the `calibre` directory.**

(This particular configuration ensures that a root-level `calibre` folder won't be scanned by Kobo's operating system. This essentially keeps the Calibre books separate from the Kobo books. Great when using KOReader.)

### KOReader

If you want an alternative reading experience, this is the way to go, and a great combinatio with Calibre.

Install the latest release of `KOReader`. You can [download it here](https://github.com/koreader/koreader/releases).

Follow the instructions carefully. **You will also need to add a new item to `.adds/nm/items` to launch KOReader via the Tweak menu!**

### Fonts

Copy the `fonts` directory and any [extra fonts you like](https://github.com/nicoverbruggen/ebook-fonts/releases) over. If you like what you're seeing, you can find [more fonts](https://github.com/nicoverbruggen/ebook-fonts/releases) in my other repository.

### Screensaver

You can copy the screensaver from `.kobo/screensaver` into the same folder on your Kobo device. You can toggle this feature via the Tweak menu.