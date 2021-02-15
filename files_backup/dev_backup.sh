#!/bin/bash

# Place this script in required location for backup and execute
# Root is needed for execution this script

DEV=/dev/mmcblk0
NOW=$(date +"%Y_%m_%d__%H_%M_%S")
BACKUP_FILE_NAME=MY_SDCARD_${NOW}_backup.img.gz

if [ -b "$DEV" ]; then
    dd bs=1 count=1 if=$DEV of=/dev/null status=none && 
    echo "Device access OK. Reading to $BACKUP_FILE_NAME..." && 
    dd bs=4M if=$DEV status=progress | gzip > "$BACKUP_FILE_NAME"
else
    echo "Device $DEV does not exist"
fi
