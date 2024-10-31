#!/bin/bash
LOG_DIR="[path_log]"
DAYS_TO_KEEP=7
HOUSEKEEPING_LOG="[log_cron]"

{
    echo "Housekeeping started at $(date)"

    # Find and delete log files older than 7 days
    find "$LOG_DIR" -name "connect.log.*" -type f -mtime +$DAYS_TO_KEEP -exec rm -f {} \;

    echo "Housekeeping complete at $(date)"
    echo "--------------------------------------"
} >> "$HOUSEKEEPING_LOG" 2>&1
