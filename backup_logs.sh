#!/bin/bash

DATE=$(date +%F)
ARCHIVE_NAME="monitor-$DATE.tar.gz"
LOG_FILE="/var/log/monitor.log"
DEST="/home/deployer/backups/$ARCHIVE_NAME"

tar -czf "$ARCHIVE_NAME" "$LOG_FILE"

scp "$ARCHIVE_NAME" deployer@192.168.56.102:"$DEST"

rm "$ARCHIVE_NAME"
