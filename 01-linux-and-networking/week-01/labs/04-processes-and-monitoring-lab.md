# Lab 04: Processes, Services, and System Monitoring

## Objective
Practice inspecting active processes, evaluating system performance metrics, and managing system services using `systemctl`.

## Commands Executed
```bash
# Inspect system uptime and load averages
uptime

# Check real-time memory and disk utilization
free -h
df -h

# View active processes snapshot
ps aux | head -n 10

# Check the status of the SSH service using systemctl
sudo systemctl status ssh