#!/usr/bin/env bash
set -euo pipefail

REPORT_FILE="${1:-./workspace/logs/sys_report_$(date +%Y%m%d).txt}"
mkdir -p "$(dirname "$REPORT_FILE")"

{
    echo "=========================================="
    echo " SYSTEM TELEMETRY REPORT"
    echo " Generated: $(date -u +"%Y-%m-%d %H:%M:%S UTC")"
    echo "=========================================="
    echo ""
    echo "--- HOST & KERNEL ---"
    uname -a
    echo "Hostname: $(hostname)"
    echo "Uptime:   $(uptime -p)"
    echo ""
    echo "--- CPU & LOAD ---"
    lscpu | grep -E "Model name|CPU\(s\):" || true
    echo "Load Average: $(cat /proc/loadavg | awk '{print $1, $2, $3}')"
    echo ""
    echo "--- MEMORY USAGE ---"
    free -h
    echo ""
    echo "--- DISK USAGE ---"
    df -hT -x tmpfs -x devtmpfs
    echo ""
    echo "--- TOP 5 MEMORY PROCESSES ---"
    ps aux --sort=-%mem | head -n 6
} > "$REPORT_FILE"

echo "[SUCCESS] System report saved to $REPORT_FILE"
