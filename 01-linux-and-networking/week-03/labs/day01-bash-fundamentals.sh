#!/usr/bin/env bash
# Week 03 - Day 01 Lab: Bash Fundamentals, Shebangs & Script Execution

echo "========================================="
echo "Day 01: System & Shell Verification"
echo "========================================="

# 1. Verify current shell and Bash binary location
echo "Active Shell: $SHELL"
echo "Bash Path: $(which bash)"

# 2. Verify user and working directory
echo "Current User: $(whoami)"
echo "Working Directory: $(pwd)"

# 3. Verify OS and kernel details
echo "Kernel Info: $(uname -srm)"
echo "System Uptime: $(uptime -p)"

echo "========================================="
echo "Script execution successful!"
