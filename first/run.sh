#!/bin/sh

make && ./premier
echo "TECHIO> redirect-streams \"Test\""
echo "SALUT"
tail output.txt
