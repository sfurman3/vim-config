#!/usr/bin/env bash

if [ ! -d configs/ ]; then
    echo "Directory \"configs/\" missing"
    exit 1
fi

# print options
echo "configurations"
echo "--------------"
ls configs | sed 's/.tar.gz//g' | nl
echo

# prompt for configuration
read -p 'configuration name:' archive
archive="$(basename $archive)".tar.gz

if [ ! -f configs/$archive ]; then
    echo "Archive \"$archive\" not found!"
    exit 1
fi

tar -xf configs/$archive
