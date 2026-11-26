#!/usr/bin/env bash
# Week 03 - Day 06 Lab: Inspecting Cron Daemon, Environment & Crontab Entries

echo "=== 1. Checking Cron Service Status ==="
if service cron status >/dev/null 2>&1; then
    echo "[ACTIVE] Cron daemon is running."
else
    echo "[INACTIVE] Cron daemon is stopped. Start it with: sudo service cron start"
fi

echo ""
echo "=== 2. Interactive Shell PATH vs Minimal Cron PATH ==="
echo "Your interactive PATH: $PATH"
echo "Typical Cron PATH:     /usr/bin:/bin"
echo "-> Lesson: Always use absolute paths inside cron scripts!"

echo ""
echo "=== 3. Current User Crontab Entries ==="
crontab -l 2>/dev/null || echo "No crontab configured yet for $USER."
