#!/bin/sh
gcc check.c -o check
make  

result=true
for file in test/TEST_*.in; do
  ./check "./"$1 $file "output.txt"
  
  if (diff -d -b -B output.txt $file".out" > output.nfo); then
    echo "TECHIO> message --channel \"Testing Results\" $file passé"
    #echo "TECHIO> success true"
  else
    echo "TECHIO> message --channel \"Testing Results\" $file échoué"
    #echo "TECHIO> success false"
    #echo "TECHIO> redirect-streams \"Difference\""
    #tail output.nfo
    result=false
  fi  
  
  echo "TECHIO> redirect-streams \"Test $file output\"" 
  echo "********** INPUT ***********"
  cat $file
  echo "********** OUTPUT **********"
  cat output.txt

done

if [ "$result" = true ]; then
  echo "TECHIO> success true"
else
  echo "TECHIO> success false"
fi
