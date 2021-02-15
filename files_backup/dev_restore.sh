#!/bin/bash

# Place this script in required location for backup and execute
# Root is needed for execution this script

DEV=/dev/sdX
BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ] || [ ! -e "$BACKUP_FILE" ] ; then
    echo "File parameter required. File must exist."
    exit
fi

if [ ! -b "$DEV" ]; then
    echo "Device $DEV does not exist"
    exit
fi
    
if [ -z "`file "$BACKUP_FILE" | grep -o 'gzip compressed data'`" ]; then
    echo "$BACKUP_FILE is not compressed with GZIP"
else
    dd bs=1 count=1 if=$DEV of=/dev/null status=none &&
    echo "Device access OK. Writing to $DEV..." &&
    gunzip --stdout "$BACKUP_FILE" | dd bs=4M of=$DEV status=progress
fi
