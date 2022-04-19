#!/bin/bash

PATH=$(cd `dirname $0`; pwd)

IMAGEPATH=$PATH/images/*

for tempfile in $IMAGEPATH
do
  if [ -f $filetemp ]
  then
    filename=${tempfile##*/}
    echo $filename >> image.txt
  fi
done
