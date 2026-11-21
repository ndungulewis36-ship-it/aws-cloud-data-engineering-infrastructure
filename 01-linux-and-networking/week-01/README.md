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

## Lab 02: Filesystem Navigation & Management
- *Lab Guide:* [labs/02-filesystem-navigation-lab.md](labs/02-filesystem-navigation-lab.md)
- *Key Focus Areas:*
  - Traversed the top-down Linux filesystem hierarchy starting from root (`/`).
  - Built nested directory trees using brace expansion (`mkdir -p`).
  - Handled file manipulation workflow (`cp`, `mv`, `cat`).
  - Queried files and patterns using search utilities (`find`, `grep`).

## Lab 03: Users, Groups & Permissions
- *Notes:* [notes/05-users-and-permissions.md](notes/05-users-and-permissions.md)
- *Lab Guide:* [labs/03-users-and-permissions-lab.md](labs/03-users-and-permissions-lab.md)
- *Key Focus Areas:*
  - Examined system identity configurations in `/etc/passwd` and `/etc/group`.
  - Calculated and applied octal permissions (`chmod 600`, `755`) and symbolic modes (`u+x`).
  - Controlled file access safety across users and groups.

  ## Lab 04: Processes, Services & System Monitoring
- *Notes:* [notes/06-processes-and-monitoring.md](notes/06-processes-and-monitoring.md)
- *Lab Guide:* [labs/04-processes-and-monitoring-lab.md](labs/04-processes-and-monitoring-lab.md)
- *Key Focus Areas:*
  - Inspected PIDs and process states using `ps`, `top`, and job controls.
  - Managed background execution and process termination signals (`kill`).
  - Audited system resources (`free`, `df`, `uptime`) and controlled services via `systemctl`.