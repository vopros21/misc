#### create archive from current folder recursively
zip -r myArchive.zip .
#### delete a file from zip by name
zip -d myArchive.zip "removeThisFile.txt"
#### extract specified file from archive to the current directory
unzip -j myArchive.zip path/to/file.txt -d .
