#!/bin/sh
#
# This script copies over all the files if you have a mounted Kobo connected to your Mac.
#

DEST="/Volumes/KOBOeReader"

if [ ! -d "$DEST" ]; then
    echo "Error: $DEST is not mounted."
    exit 1
fi

rsync -av --exclude='.git' --exclude='.DS_Store' --exclude='._*' .adds/ "$DEST/.adds/"
rsync -av --exclude='.git' --exclude='.DS_Store' --exclude='._*' .kobo/ "$DEST/.kobo/"
if [ -d "$DEST/fonts" ] && [ -z "$(ls -A "$DEST/fonts")" ]; then
    rsync -av --exclude='.git' --exclude='.DS_Store' --exclude='._*' fonts/ "$DEST/fonts/"
elif [ ! -d "$DEST/fonts" ]; then
    rsync -av --exclude='.git' --exclude='.DS_Store' --exclude='._*' fonts/ "$DEST/fonts/"
else
    echo "Skipping fonts (folder is not empty)."
fi

CONF="$DEST/.kobo/Kobo/Kobo eReader.conf"

# ExcludeSyncFolders controls which folders Kobo's library ignores.
# Without it, books in the `calibre` folder will also show up in
# your Kobo library. If you only read via Kobo's built-in reader,
# that's fine. But if you use KOReader to read Calibre books, you
# probably want to hide the `calibre` folder so you don't see
# duplicate entries in Kobo's library.

EXCLUDE_WITH_CALIBRE='(calibre|\\.(?!kobo|adobe|calibre).+|([^.][^/]*/)+\\..+)'
EXCLUDE_WITHOUT_CALIBRE='(\\.(?!kobo|adobe|calibre).+|([^.][^/]*/)+\\..+)'

if grep -q "^ExcludeSyncFolders=" "$CONF"; then
    echo "ExcludeSyncFolders is already set."
else
    printf "Do you use KOReader or Calibre? Set ExcludeSyncFolders? [y/N] "
    read -r REPLY
    if [ "$REPLY" = "y" ] || [ "$REPLY" = "Y" ]; then
        echo ""
        echo "If you hide the calibre folder, books in it won't appear in"
        echo "Kobo's library. This is useful if you read them via KOReader."
        echo "If you prefer all books to show up in Kobo's library, say no."
        printf "Hide the calibre folder from Kobo's library? [y/N] "
        read -r REPLY2
        if [ "$REPLY2" = "y" ] || [ "$REPLY2" = "Y" ]; then
            EXCLUDE_VALUE="$EXCLUDE_WITH_CALIBRE"
        else
            EXCLUDE_VALUE="$EXCLUDE_WITHOUT_CALIBRE"
        fi
        if grep -q "^\[FeatureSettings\]" "$CONF"; then
            sed -i '' "/^\[FeatureSettings\]/a\\
ExcludeSyncFolders=$EXCLUDE_VALUE
" "$CONF"
        else
            printf '\n[FeatureSettings]\nExcludeSyncFolders=%s\n' "$EXCLUDE_VALUE" >> "$CONF"
        fi
        echo "ExcludeSyncFolders has been added."
        NEEDS_REBOOT=1
    else
        echo "Skipping ExcludeSyncFolders."
    fi
fi

echo "Removing resource fork files..."
dot_clean "$DEST"

echo "Ejecting Kobo..."
diskutil eject "$DEST"

echo ""
echo "Done. Kobo has been ejected."
if [ "$NEEDS_REBOOT" = "1" ]; then
    echo ""
    echo "IMPORTANT: ExcludeSyncFolders was added. Reboot your Kobo to apply this setting!"
fi
