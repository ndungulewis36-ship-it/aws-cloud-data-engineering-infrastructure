#!/bin/bash
set -euo pipefail

echo "=== Lab 02: Filesystem Navigation & Inspection ==="
echo "Current Directory: $(pwd)"
echo "Listing directory contents with details:"
ls -la

echo "Checking disk usage of current directory:"
du -sh .