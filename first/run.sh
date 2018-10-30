#!/bin/sh
gcc check.c -o check
make  
#./premier
./check
echo "TECHIO> redirect-streams \"Test $1\"" 
tail output.txt
if (diff -d -b -B output.txt check.txt); then
  echo "TECHIO> message TEST x passé"
  echo "TECHIO> success true"
else
  echo "TECHIO> message TEST x échoué"
  echo "TECHIO> success false"
fi
