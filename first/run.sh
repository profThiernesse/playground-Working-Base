#!/bin/sh
gcc check.c -o check
make  

for file in test/TEST_*.in; do
  ./check "./"$1 $file "output.txt"
  echo "TECHIO> redirect-streams \"Execution output\"" 
  echo $file
  info = $(cat $file)
  echo "INPUT $info"
  echo "OUTPUT $(< output.txt)"
  
  result=true
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
done

if [ "$result" = true ]; then
  echo "TECHIO> success true"
else
  echo "TECHIO> success false"
fi
