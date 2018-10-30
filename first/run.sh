#!/bin/sh
var essai
make  
essai = $(./premier)
echo "TECHIO> redirect-streams \"Test $1\"" 
tail output.txt
echo "->"
echo "->" $essai
