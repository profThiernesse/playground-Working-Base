#!/bin/sh
make  
./premier
echo "TECHIO> redirect-streams \"Test $1\"" 
tail output.txt
if [diff output.txt check.txt]; then
  echo "TECHIO> success true"
else
  echo "TECHIO> success false"
fi
