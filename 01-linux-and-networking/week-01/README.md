# Week 01: Linux Foundations & System Inspection

## Objectives
- Navigate the Linux Filesystem Hierarchy Standard (`/etc`, `/var`, `/usr`, `/proc`, `/dev`).
- Write defensive Bash scripts using `set -euo pipefail`.
- Inspect system resources, virtual network interfaces, routing tables, and listening sockets.

## Lab 01: System & Network Audit
- **Script:** `scripts/sys_audit.sh`
- **Artifact:** `labs/01-system-audit-output.txt`
- **Key Findings:**
  - Root filesystem mounted on `/dev/sdd` (`954G` available).
  - Virtual interface `eth0` operating on subnet `172.27.128.0/20` via NAT gateway `172.27.128.1`.
  - All active TCP/UDP sockets (ports `53` and `323`) are bound strictly to loopback/internal interfaces with zero public exposure.
