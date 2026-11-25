#!/usr/bin/env bash
TARGET_DIR="${1:-.}"
echo "=== Ownership Audit for Directory: $TARGET_DIR ==="
find "$TARGET_DIR" -maxdepth 2 -ls 2>/dev/null | awk '{print "Owner:", $5, "| Group:", $6, "| Path:", $11}'
