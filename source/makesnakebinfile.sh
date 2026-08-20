#!/bin/sh

LOAD=0x801
FILE="$1"
FILE2="$2"

SIZE=$(stat -c%s $FILE)

(
perl -e "print pack('v', $LOAD);"
perl -e "print pack('v',$SIZE);"
cat $FILE
) > $FILE2
