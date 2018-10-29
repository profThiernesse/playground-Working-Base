#!/bin/sh

make && ./premier && tail output.txt
echo "SALUT"
more output.txt
