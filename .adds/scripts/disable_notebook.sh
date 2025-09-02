#!/bin/sh

# Script to disable Kobo notebook functionality

CONFIG_FILE="/mnt/onboard/.kobo/Kobo/Kobo eReader.conf"

# Replace StylusUsageDetected setting if it exists
if grep -q "^StylusUsageDetected=" "$CONFIG_FILE"; then
    sed -i 's/^StylusUsageDetected=.*/StylusUsageDetected=false/' "$CONFIG_FILE"
    echo "Notebook tab disabled."
else
    echo "Could not find StylusUsageDetected. Skipped."
fi