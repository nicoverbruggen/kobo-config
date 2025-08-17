# My Kobo Configuration

## What is this?

This repository helps you set up your Kobo just like I set up mine.

## Installation Guide

### NickelMenu

First, install the latest version of [NickelMenu](https://pgaskin.net/NickelMenu/).

Copy the `.adds` directory to the root of your `KOBOeReader` volume. This is the configuration for NickelMenu and lets you start `KOReader`.

### KOReader

Install the latest release of `KOReader`. You can [download it here](https://github.com/koreader/koreader/releases).

### Separating Kobo / KOReader libraries

Ensure your Kobo doesn't scan certain directories. 

To do this, add the following block to the `.kobo/Kobo/Kobo eReader.conf` file:

```
[FeatureSettings]
ExcludeSyncFolders=(calibre|\\.(?!kobo|adobe|calibre).+|([^.][^/]*/)+\\..+)
```

(This particular configuration ensures that a root-level `calibre` folder won't be scanned by Kobo's operating system.)

This lets me **sync** my Kobo library via Kobo's UI, and separate it from my sideloaded books, which I copy to the `calibre` folder and read/manage via KOReader. 

Reboot your Kobo. Hold the power button until it has been turned off, then turn it on again.

Copy over any sideloaded books to the `calibre` folder.

### Fonts

Copy the `fonts` directory and any [extra fonts you like](https://github.com/nicoverbruggen/ebook-fonts/releases) over. 

You can find [more fonts](https://github.com/nicoverbruggen/ebook-fonts/releases) in my other repository.

### Screensaver

You can copy the screensaver from `.kobo/screensaver` into the root folder of your Kobo device. 
