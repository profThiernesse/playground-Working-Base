#!/bin/sh

make  
$retval = $(./premier)
echo "TECHIO> redirect-streams \"Test $1\"" 
tail output.txt
echo "->"
echo $retval
