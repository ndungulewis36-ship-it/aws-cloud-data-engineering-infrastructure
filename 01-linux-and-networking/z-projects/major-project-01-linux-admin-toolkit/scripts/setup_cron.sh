#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/admin_toolkit.sh"
CRON_LOG="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/logs/cron.log"

JOB_BACKUP="0 2 * * * $SCRIPT_PATH --auto-backup >> $CRON_LOG 2>&1"
JOB_HEALTH="0 */6 * * * $SCRIPT_PATH --health-check >> $CRON_LOG 2>&1"

# Append jobs only if they are not already present
(crontab -l 2>/dev/null | grep -Fv "$SCRIPT_PATH" || true; echo "$JOB_BACKUP"; echo "$JOB_HEALTH") | crontab -

echo "[SUCCESS] Installed cron jobs:"
crontab -l | grep "$SCRIPT_PATH"
