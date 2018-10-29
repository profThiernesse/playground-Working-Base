#!/bin/sh

make && ./premier
echo "TECHIO> redirect-streams \"Test results\""
echo "SALUT"
tail output.txt
