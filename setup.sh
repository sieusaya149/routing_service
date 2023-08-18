#!/bin/bash
echo "## Reset Project First \n"
./reset.sh
echo "Starting setting up"
mkdir -p data-graphhopper data-ors data-osrm 

echo "1. Create folder data for graphhopper"
mkdir -p data-graphhopper/config data-graphhopper/data
cp ./config-gh.yml data-graphhopper/config/

echo "2. Create folder data for Open routing service"
mkdir -p data-ors/docker data-ors/data
mkdir -p data-ors/docker/conf data-ors/docker/elevation_cache data-ors/docker/graphs data-ors/docker/logs/ors data-ors/docker/logs/tomcat

echo "3. Create folder data for OSRM"
mkdir -p data-osrm/data
# URL of the file you want to download
file_url="https://download.geofabrik.de/north-america/us/pennsylvania-latest.osm.pbf"

# Name of the file
file_name=$(basename "$file_url")

# Destination folders
dataGraphhopperPath="./data-graphhopper/data"
dataOrsPath="./data-ors/data"
dataOsrmPath="./data-osrm"

# Download the file using wget
echo "4. Download data"
if [ -e "$file_name" ]; then
    echo " File '$file_name' already exists. Skipping download."
else
    wget "$file_url"
fi

# Check if wget command was successful
if [ $? -eq 0 ]; then
    echo "File downloaded successfully."
    # Copy the downloaded file to the subfolders
    cp "$file_name" "$dataGraphhopperPath/"
    cp "$file_name" "$dataOrsPath/"
    cp "$file_name" "$dataOsrmPath/"

    echo "File copied to subfolders"
else
    echo "File download failed."
fi


