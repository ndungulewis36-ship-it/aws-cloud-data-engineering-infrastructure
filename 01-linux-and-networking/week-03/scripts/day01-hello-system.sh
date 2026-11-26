#!/usr/bin/env bash
# Day 01: First Bash Script & System Check

echo "========================================="
echo "Initializing System Check..."
echo "Current User: $(whoami)"
echo "Current Directory: $(pwd)"
echo "Kernel & OS Info: $(uname -srm)"
echo "System Uptime: $(uptime -p)"
echo "========================================="
