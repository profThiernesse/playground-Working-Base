#!/bin/sh
gcc check.c -o check
ls -al
make  
#./premier
./check
echo "TECHIO> redirect-streams \"Test $1\"" 
tail output.txt
diff -q output.txt check.txt
if (diff -d -b -B output.txt check.txt); then
  echo "TECHIO> success true"
else
  echo "TECHIO> success false"
fi
