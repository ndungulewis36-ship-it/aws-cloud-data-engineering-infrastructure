# Lab 01 — Linux Users, Groups & Account Management

```bash
sudo groupadd data_engineers
sudo useradd -m -s /bin/bash -c "ETL Pipeline User" etl_user
sudo usermod -aG data_engineers etl_user
id etl_user
grep "data_engineers" /etc/group
grep "etl_user" /etc/passwd
sudo userdel -r etl_user
sudo groupdel data_engineers
```
