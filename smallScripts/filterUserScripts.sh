#!/bin/bash
# logFile.log contains path to user scripts what failed the test in structure:
# <timestamp> <class reporter> <path/to/zip/file/user<userid>/<userScriptName.xml>, <cause of failure>
# between other tech info. Script read file, filter all strings with different structure,
# cut first part of line, last part and save only path to file in zip archive into txt
grep user[0-9].* LogFile.log | sed -n -e 's/^.*user/user/p' | sed -n -e 's/xml.*$/xml/p' > bad_scripts.txt
