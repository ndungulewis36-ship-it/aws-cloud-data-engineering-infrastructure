#!/usr/bin/env bash
set -euo pipefail

# Base directory (defaults to ./workspace if no argument is passed)
BASE_DIR="${1:-./workspace}"
SUBDIRS=("raw_data" "processed_data" "scripts" "logs" "backups")

echo "Initializing workspace at: $BASE_DIR"

for dir in "${SUBDIRS[@]}"; do
    TARGET="$BASE_DIR/$dir"
    if [[ ! -d "$TARGET" ]]; then
        mkdir -p "$TARGET"
        echo "[CREATED] $TARGET"
    else
        echo "[EXISTS]  $TARGET"
    fi
done

# Restrict access to backups and logs (owner read/write/execute only)
chmod 700 "$BASE_DIR/backups" "$BASE_DIR/logs"
echo "Permissions secured (700) on backups and logs."
