#!/bin/bash

# Place this script in required location for backup and execute

DEV=/dev/mmcblk0
NOW=$(date +"%Y_%m_%d__%H_%M_%S")
BACKUP_NAME=MY_SDCARD

if [ -f $DEV ]; then
    dd bs=4M if=$DEV status=progress | gzip > ${BACKUP_NAME}_${NOW}_backup.img.gz
else
    echo Device ${DEV} does not exist
fi
