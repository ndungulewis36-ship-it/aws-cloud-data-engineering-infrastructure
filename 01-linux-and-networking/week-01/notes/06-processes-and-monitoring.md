# 06. Processes, Services, and System Monitoring

## 1. Process Management
- **Process ID (PID):** Every running process is assigned a unique numeric identifier by the kernel.
- **`ps`:** Reports a snapshot of the current processes (`ps aux` lists all processes across all users).
- **`top` / `htop`:** Provides a dynamic, real-time view of running system tasks, CPU utilization, and memory consumption.
- **Process Control & Signals:**
  - `kill [PID]` — Sends the default `TERM` signal to gracefully terminate a process.
  - `kill -9 [PID]` — Sends the `SIGKILL` signal to immediately force-stop an unresponsive process.
  - `bg` / `fg` — Manages background and foreground job execution.

## 2. System Services & `systemd`
- **`systemctl`:** The standard command-line utility for examining and controlling the `systemd` system and service manager.
- **Common Actions:**
  - `sudo systemctl status [service]` — Checks if a service is active and healthy.
  - `sudo systemctl start [service]` — Launches a stopped service.
  - `sudo systemctl stop [service]` — Halts a running service.
  - `sudo systemctl enable [service]` — Configures a service to start automatically at boot.

## 3. System Monitoring Utilities
- **`free -h`:** Displays total, used, and available system RAM in human-readable format.
- **`df -h`:** Reports disk space usage across mounted filesystems.
- **`uptime`:** Shows how long the system has been running alongside current load averages.