#!/usr/bin/env bash

# prompt for configuration
archive="$1"
if [ -z "$archive" ]; then
    ./lsconfigs.sh
    read -p 'configuration name:' archive
fi
archive="$(basename $archive)"

if [ ! -f configs/$archive.tar.gz ]; then
    echo "Archive \"$archive.tar.gz\" not found!"
    exit 1
fi

tar -xf configs/$archive.tar.gz
