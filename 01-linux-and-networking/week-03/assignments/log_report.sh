#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="${1:-/var/log/syslog}"
OUTPUT_REPORT="${2:-./workspace/logs/log_summary_$(date +%Y%m%d).txt}"

if [[ ! -r "$LOG_FILE" ]]; then
    echo "Error: Cannot read '$LOG_FILE'. Try running with sudo or specify a readable log file." >&2
    exit 1
fi

mkdir -p "$(dirname "$OUTPUT_REPORT")"

ERROR_COUNT=$(grep -ic "error" "$LOG_FILE" || true)
WARN_COUNT=$(grep -ic "warn" "$LOG_FILE" || true)
FAIL_COUNT=$(grep -ic "fail" "$LOG_FILE" || true)

{
    echo "=========================================="
    echo " LOG ANALYSIS REPORT: $LOG_FILE"
    echo " Generated: $(date)"
    echo "=========================================="
    echo "Total Lines Scanned: $(wc -l < "$LOG_FILE")"
    echo "ERROR occurrences:   $ERROR_COUNT"
    echo "WARN occurrences:    $WARN_COUNT"
    echo "FAIL occurrences:    $FAIL_COUNT"
    echo ""
    echo "--- LAST 10 ERROR/FAIL ENTRIES ---"
    grep -iE "error|fail" "$LOG_FILE" | tail -n 10 || echo "No error/fail entries found."
} > "$OUTPUT_REPORT"

echo "[SUCCESS] Log summary written to $OUTPUT_REPORT"
