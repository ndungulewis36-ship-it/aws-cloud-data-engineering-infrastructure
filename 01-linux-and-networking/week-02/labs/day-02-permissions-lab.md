# Lab 02 — File Permissions (Symbolic & Numeric Modes)

```bash
mkdir -p secure_data
echo "API_KEY=super_secret_token" > secure_data/config.env
ls -ld secure_data
ls -l secure_data/config.env
chmod 750 secure_data
chmod 640 secure_data/config.env
chmod o-r secure_data/config.env
ls -ld secure_data
ls -l secure_data/config.env
rm -rf secure_data
```
