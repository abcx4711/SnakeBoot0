#!/bin/sh

FILE="$1"
FILE2="$2"

if [ -z "$FILE" ] || [ -z "$FILE2" ]; then
    echo "usage: $0 <file1> <file2>"
    exit 1
fi

if [ ! -f "$FILE" ]; then
   echo "'$FILE' not found"    exit 1
fi

LOAD=0x801

SIZE=$(stat -c%s $FILE)

(
perl -e "print pack('v', $LOAD);"
perl -e "print pack('v',$SIZE);"
cat $FILE
) > $FILE2
