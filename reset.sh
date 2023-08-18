#!/bin/bash
rm -f *.pbf
# Destination folders
dataGraphhopperPath="./data-graphhopper"
dataOrsPath="./data-ors"
dataOsrmPath="./data-osrm"

# Check if wget command was successful
if [ $? -eq 0 ]; then
    echo "Delete all data"

    # Copy the downloaded file to the subfolders
    rm -rf "$dataGraphhopperPath"
    rm -rf "$dataOrsPath"
    rm -rf "$dataOsrmPath"
else
    echo "File download failed."
fi
