#!/bin/bash

# Converts jpg files resolution to required resolution
# This script needs ImageMagick installed

RES=1024x768

for file in `ls *.jpg` ; do
convert -size $RES $file -resize $RES +profile '*' resized_$file
done
