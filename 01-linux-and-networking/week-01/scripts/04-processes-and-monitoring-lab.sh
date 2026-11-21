#!/bin/bash
# Lab 04: Processes, Services, and System Monitoring Automation
# Author: Lewis Ndungu

set -euo pipefail

echo "=========================================="
echo "       SYSTEM HEALTH & PROCESS AUDIT      "
echo "=========================================="

echo -e "\n[1] Checking System Uptime & Load Averages:"
uptime

echo -e "\n[2] Checking Available Memory (RAM):"
free -h

echo -e "\n[3] Checking Filesystem Disk Space:"
df -h

echo -e "\n[4] Top 5 Active Processes by CPU/Memory:"
ps aux --sort=-%cpu | head -n 6

echo -e "\n[5] Checking SSH Service Status:"
sudo systemctl status ssh --no-pager || true

echo -e "\n=========================================="
echo "Audit complete!"