#!/bin/bash

SOURCE_DIR="./"
BACKUP_DIR="backups"
LOG_FILE="backups/backup_log.txt"

TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_FILE" "$SOURCE_DIR" >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_FILE" | tee -a "$LOG_FILE"
else
  echo "Backup failed" | tee -a "$LOG_FILE"
fi