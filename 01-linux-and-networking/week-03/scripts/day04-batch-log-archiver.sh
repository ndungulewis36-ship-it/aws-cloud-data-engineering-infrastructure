#!/usr/bin/env bash
# Week 03 - Day 04 Script: Batch Log File Organizer & Archiver

SOURCE_DIR=${1:-"/tmp/app_logs"}
ARCHIVE_DIR="$SOURCE_DIR/archived_$(date +%Y%m%d)"

# Setup sample log files if using default test directory
if [[ "$SOURCE_DIR" == "/tmp/app_logs" && ! -d "$SOURCE_DIR" ]]; then
    mkdir -p "$SOURCE_DIR"
    touch "$SOURCE_DIR"/{etl_job,api_gateway,auth_service}.log
    echo "[SETUP] Generated sample .log files in $SOURCE_DIR"
fi

mkdir -p "$ARCHIVE_DIR"
COUNT=0

# Loop through all .log files in SOURCE_DIR
for logfile in "$SOURCE_DIR"/*.log; do
    [[ -f "$logfile" ]] || continue

    BASENAME=$(basename "$logfile" .log)
    DEST_FILE="$ARCHIVE_DIR/${BASENAME}_$(date +%H%M%S).log.gz"

    gzip -c "$logfile" > "$DEST_FILE"
    echo "[ARCHIVED] $(basename "$logfile") -> $DEST_FILE"
    ((COUNT++))
done

echo "Batch complete: $COUNT log file(s) compressed into $ARCHIVE_DIR"
