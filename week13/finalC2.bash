#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <access_log> <ioc_file>"
    exit 1
fi

grep -f "$2" "$1" | awk '{print $1, $4, $7}' | sort -u > report.txt

cat report.txt


