#!/bin/sh
make  
./premier
echo "TECHIO> redirect-streams \"Test $1\"" 
tail output.txt
