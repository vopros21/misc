#!/bin/bash
# take file with filenames as argument and remove all mentioned files
# from specified zip file
while IFS= read -r line; do
    zip -d zipFileName.zip "$line"
done < "$1"
