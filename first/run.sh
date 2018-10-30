#!/bin/sh
gcc check.c -o check
make  
#./premier
:'
./check ./premier input.txt output.txt
echo "TECHIO> redirect-streams \"File output $1\"" 
tail output.txt
if (diff -d -b -B output.txt check.txt > output.nfo); then
  echo "TECHIO> message --channel \"Test Result\" TEST x passé"
  #echo "TECHIO> success true"
else
  echo "TECHIO> message --channel \"Test Result\" TEST x échoué"
  #echo "TECHIO> success false"
  echo "TECHIO> redirect-streams \"Difference\""
  tail output.nfo
fi

echo "TECHIO> redirect-streams \"MORE\"" 
'

for file in test/TEST_*.in; do
  ./check "./"$1 $file "output.txt"
  echo "TECHIO> redirect-streams \"File output\"" 
  tail output.txt
  result=0
  if (diff -d -b -B output.txt "test/"$file".out" > output.nfo); then
    echo "TECHIO> message --channel \"Test Result\" $file passé"
    #echo "TECHIO> success true"
  else
    echo "TECHIO> message --channel \"Test Result\" $file échoué"
    #echo "TECHIO> success false"
    echo "TECHIO> redirect-streams \"Difference\""
    tail output.nfo
    result=1
  fi
  
  if $result; then
    echo "TECHIO> success true"
  else
    echo "TECHIO> success false"
  fi
  
done
