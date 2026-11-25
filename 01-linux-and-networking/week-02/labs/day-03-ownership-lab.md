# Lab 03 — Ownership Transfers & Sudo Configuration

```bash
mkdir -p pipeline_data
echo "status=active" > pipeline_data/metrics.log
ls -l pipeline_data/metrics.log
sudo groupadd analytics_team
sudo useradd -m -s /bin/bash analyst_user
sudo chown -R analyst_user:analytics_team pipeline_data/
ls -ld pipeline_data
ls -l pipeline_data/metrics.log
sudo rm -rf pipeline_data
sudo userdel -r analyst_user
sudo groupdel analytics_team
```
