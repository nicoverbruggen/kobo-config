#!/bin/sh

# Script to toggle webkitTextRendering setting.
# This causes certain font features to work in kepub files.

CONFIG_FILE="/mnt/onboard/.kobo/Kobo/Kobo eReader.conf"

# Check if the setting exists
if grep -q "^webkitTextRendering=optimizeLegibility" "$CONFIG_FILE"; then
    # Remove the line
    sed -i '/^webkitTextRendering=optimizeLegibility/d' "$CONFIG_FILE"
    echo "WebKit text rendering disabled."
else
    # Add the line below [Reading] section
    if grep -q "^\[Reading\]" "$CONFIG_FILE"; then
        sed -i '/^\[Reading\]/a webkitTextRendering=optimizeLegibility' "$CONFIG_FILE"
        echo "WebKit text rendering enabled."
    else
        echo "Could not find [Reading] section. Skipped."
    fi
fi
