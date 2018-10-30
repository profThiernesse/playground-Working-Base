#!/bin/sh
gcc check.c -o check
make  
#./premier
./check ./premier
echo "TECHIO> redirect-streams \"File output $1\"" 
tail output.txt
if (diff -d -b -B output.txt check.txt > output.nfo); then
  echo "TECHIO> message --channel \"Test Result\" TEST x passé"
  echo "TECHIO> success true"
else
  echo "TECHIO> message --channel \"Test Result\" TEST x échoué"
  echo "TECHIO> success false"
  echo "TECHIO> redirect-streams \"Difference\""
  tail output.nfo
fi
