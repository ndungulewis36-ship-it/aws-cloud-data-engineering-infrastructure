#!/usr/bin/env bash
# Week 03 - Day 03 Script: Automated Disk & Backup Directory Guard

BACKUP_DIR=${1:-"/tmp/de_backups"}
THRESHOLD=80

# 1. Validate or provision backup directory
if [[ -d "$BACKUP_DIR" && -w "$BACKUP_DIR" ]]; then
    echo "[READY] Backup directory '$BACKUP_DIR' exists and is writable."
elif [[ -e "$BACKUP_DIR" ]]; then
    echo "[FATAL] '$BACKUP_DIR' exists but is not a writable directory."
    exit 1
else
    mkdir -p "$BACKUP_DIR"
    echo "[CREATED] Provisioned new backup directory at '$BACKUP_DIR'."
fi

# 2. Evaluate root filesystem disk usage
USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [[ "$USAGE" -ge "$THRESHOLD" ]]; then
    echo "[ALERT] Root disk usage is ${USAGE}% (Threshold: ${THRESHOLD}%). Clean up space before running ETL jobs!"
    exit 2
else
    echo "[PASS] Root disk usage is ${USAGE}% (Threshold: ${THRESHOLD}%). Safe to proceed."
fi
