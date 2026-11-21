#!/bin/bash
set -euo pipefail

echo "=========================================="
echo "        NETWORK & CONNECTIVITY AUDIT      "
echo "=========================================="

echo -e "\n[1] Checking Network Interfaces & IP Addresses:"
ip -br addr

echo -e "\n[2] Checking Active Network Connections & Ports:"
ss -tulpn || netstat -tuln 2>/dev/null || echo "Permission restricted or command unavailable"

echo -e "\n[3] Testing External DNS Resolution (Google DNS):"
nslookup google.com || dig google.com +short || echo "DNS query tool lookup"

echo -e "\n[4] Testing Gateway / Outbound Connectivity:"
ping -c 3 8.8.8.8 || echo "Ping blocked or unreachable"

echo -e "\n=========================================="
echo "Networking audit complete!"