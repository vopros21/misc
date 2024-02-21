#!/bin/bash

# results.txt contains error report where each error 'has occured N times".
# script filtered lines with this info,
# left only digits: '-E' allows to grep using pattern, '-o' left only result matching with pattern
# and count total numbers' sum
grep "has occured" results.txt | grep -Eo '[0-9]{1,4}' | awk '{ sum += $1 } END { print sum }'
