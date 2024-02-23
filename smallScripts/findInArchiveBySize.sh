#!/bin/bash

# myArchive.zip contains 50_000 most frequent scripts and 10_000 the biggest ones filtered from some DB
# to reduce size of myArchive.zip we was needed to limit the biggest scripts to 5_000
# so task is: find second 5_000 biggest files in myArchive.zip and remove them using clearZip.sh
# read list from archive where the first column is size
# sort it by value in reverse order
# cut the first 5_000 lines
# get filename started with 'user' and ended with txt and the end of line
# save output into text file
unzip -l myArchive.zip | sort -nr | head -10000 | tail -5000 | grep -Eo 'user.*txt$' > toRemove.txt
