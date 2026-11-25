#!/usr/bin/env bash
TARGET_USER="${1:-$USER}"
echo "=== Standard User Accounts (UID >= 1000) ==="
awk -F: '$3 >= 1000 && $1 != "nobody" {print "User:", $1, "| UID:", $3, "| Home:", $6, "| Shell:", $7}' /etc/passwd
echo ""
echo "=== Identity & Group Membership for: $TARGET_USER ==="
if id "$TARGET_USER" &>/dev/null; then id "$TARGET_USER"; groups "$TARGET_USER"; else echo "User does not exist."; exit 1; fi
