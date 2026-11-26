#!/bin/bash

# --- 1. Users & Groups Management ---
sudo groupadd devops_team
sudo useradd -m -g devops_team -s /bin/bash alice
echo "alice:TempPass123!" | sudo chpasswd
id alice
grep devops_team /etc/group

# --- 2. Directory Permissions & Ownership ---
sudo mkdir -p /opt/project_docs
sudo chown -R :devops_team /opt/project_docs
sudo chmod 2775 /opt/project_docs
ls -ld /opt/project_docs

# --- 3. Process Management ---
sleep 300 &
SLEEP_PID=$!
ps aux | grep sleep
kill $SLEEP_PID

# --- 4. System Services & Logs ---
sudo systemctl status ssh --no-pager
sudo journalctl -u ssh -n 20 --no-pager
