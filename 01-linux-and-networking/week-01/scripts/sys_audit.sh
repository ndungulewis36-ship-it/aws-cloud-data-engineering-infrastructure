#!/usr/bin/env bash
set -euo pipefail

echo "=== SYSTEM & KERNEL ==="
uname -a
uptime

echo -e "\n=== MEMORY & DISK ==="
free -h
df -h /

echo -e "\n=== NETWORK INTERFACES & ROUTING ==="
ip -br addr
ip route

echo -e "\n=== LISTENING PORTS ==="
ss -tuln
