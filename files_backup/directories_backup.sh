#!/bin/bash

# This script reqiures rsync
# Place this script in required location for backup and execute

RSYNC_CMD="rsync -avuP"
RSYNC_WITH_DELETE_CMD="rsync -avuP --delete"

BCK_DIR="/home/me/backups"
CFG_DIR="/home/me/configs_*"
DOC_DIR="/home/me/docs"
SCR_DIR="/home/me/scripts"
GIT_DIR="/home/me/programming/!git_repos"
AND_DIR="/home/me/AndroidStudioProjects"
PYC_DIR="/home/me/programming/PycharmProjects"

# File/Dir exclude from backups directory (example)
$BCK_EXCLUDE="--exclude Name*"
ALL_DIR="$BCK_EXCLUDE $BCK_DIR $CFG_DIR $DOC_DIR $SCR_DIR $GIT_DIR $AND_DIR $PYC_DIR"

ls $ALL_DIR >/dev/null 2>&1 && $RSYNC_CMD $ALL_DIR ./ && echo BACKUP DONE && exit

echo Something went wrong. Some directories may not exist.
