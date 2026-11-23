# Week 01: Linux Foundations & System Inspection

## Objectives
- Navigate the Linux Filesystem Hierarchy Standard (`/etc`, `/var`, `/usr`, `/proc`, `/dev`).
- Write defensive Bash scripts using `set -euo pipefail`.
- Inspect system resources, virtual network interfaces, routing tables, and listening sockets.

## Lab 01: System & Network Audit
- *Script:* [scripts/01-system-audit.sh](scripts/01-system-audit.sh)
- *Artifact:* [labs/01-system-audit-output.txt](labs/01-system-audit-output.txt)
- *Key Findings:*
  - Root filesystem mounted on `/dev/sdd` (954G available).
  - Virtual interface `eth0` operating on subnet `172.27.128.0/20` via NAT gateway `172.27.128.1`.
  - All active TCP/UDP sockets are bound strictly to loopback/internal interfaces with zero public exposure.

## Lab 02: Filesystem Navigation & Management
- *Guide:* [labs/02-filesystem-navigation-lab.md](labs/02-filesystem-navigation-lab.md)
- *Script:* [scripts/02-filesystem-navigation-lab.sh](scripts/02-filesystem-navigation-lab.sh)
- *Key Focus Areas:*
  - Traversed the top-down Linux filesystem hierarchy starting from root (`/`).
  - Built nested directory trees and evaluated disk usage (`du -sh`).

## Lab 03: Users, Groups & Permissions
- *Notes:* [notes/05-users-and-permissions.md](notes/05-users-and-permissions.md)
- *Guide:* [labs/03-users-and-permissions-lab.md](labs/03-users-and-permissions-lab.md)
- *Script:* [scripts/03-users-and-permissions-lab.sh](scripts/03-users-and-permissions-lab.sh)
- *Key Focus Areas:*
  - Examined system identity configurations in `/etc/passwd` and `/etc/group`.
  - Calculated and applied octal permissions (`chmod 600`) and validated execution rights.

## Lab 04: Processes, Services & System Monitoring
- *Notes:* [notes/06-processes-and-monitoring.md](notes/06-processes-and-monitoring.md)
- *Guide:* [labs/04-processes-and-monitoring-lab.md](labs/04-processes-and-monitoring-lab.md)
- *Script:* [scripts/04-processes-and-monitoring-lab.sh](scripts/04-processes-and-monitoring-lab.sh)
- *Key Focus Areas:*
  - Inspected PIDs and process states using `ps`, `top`, and load averages (`uptime`).
  - Audited system RAM (`free`) and disk utilization (`df`).
  - Controlled system services via `systemctl` (including OpenSSH server setup).

