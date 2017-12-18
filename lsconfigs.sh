#!/usr/bin/env bash

if [ ! -d configs/ ]; then
    echo "Directory \"configs/\" missing"
    exit 1
fi

echo "configurations"
echo "--------------"
ls configs | sed 's/.tar.gz//g' | nl
echo
