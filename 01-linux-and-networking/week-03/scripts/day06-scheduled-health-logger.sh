#!/usr/bin/env bash
# Week 03 - Day 06 Script: Cron-Safe System Health & Heartbeat Logger

set -euo pipefail

# Explicitly define PATH so cron finds all system utilities
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

LOG_DIR="/tmp/cron_monitoring"
LOG_FILE="$LOG_DIR/system_heartbeat.log"

mkdir -p "$LOG_DIR"

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
LOAD_AVG=$(uptime | awk -F'load average:' '{print $2}' | xargs)
MEM_USED=$(free -m | awk 'NR==2 {printf "%sMB/%sMB (%.1f%%)", $3, $2, ($3/$2)*100}')
DISK_USED=$(df -h / | awk 'NR==2 {print $5}')

echo "[$TIMESTAMP] HEARTBEAT | Load: $LOAD_AVG | Memory: $MEM_USED | Root Disk: $DISK_USED" >> "$LOG_FILE"
