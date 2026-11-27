#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG_DIR="$PROJECT_ROOT/logs"
BACKUP_DIR="$PROJECT_ROOT/backups"
mkdir -p "$LOG_DIR" "$BACKUP_DIR"

require_root() {
    if [[ "$EUID" -ne 0 ]]; then
        echo "[ERROR] This action requires root privileges. Run with sudo." >&2
        return 1
    fi
}

# 1. Create and manage users & groups
manage_users() {
    require_root || return
    read -rp "Enter group name (e.g., data_engineers): " GROUP_NAME
    read -rp "Enter username to create/assign: " USERNAME

    if ! getent group "$GROUP_NAME" >/dev/null; then
        groupadd "$GROUP_NAME"
        echo "[CREATED] Group '$GROUP_NAME'"
    else
        echo "[EXISTS]  Group '$GROUP_NAME'"
    fi

    if ! id "$USERNAME" &>/dev/null; then
        useradd -m -s /bin/bash -G "$GROUP_NAME" "$USERNAME"
        echo "[CREATED] User '$USERNAME' added to '$GROUP_NAME'"
    else
        usermod -aG "$GROUP_NAME" "$USERNAME"
        echo "[UPDATED] Added existing user '$USERNAME' to '$GROUP_NAME'"
    fi
}

# 2. Set secure directory permissions
secure_directories() {
    require_root || return
    read -rp "Enter target directory path (e.g., /opt/data_platform): " TARGET_DIR
    read -rp "Enter owning group (e.g., data_engineers): " OWNER_GROUP

    mkdir -p "$TARGET_DIR"
    chown -R root:"$OWNER_GROUP" "$TARGET_DIR"
    # 2770: Owner & group full access + SGID bit so new files inherit the group; zero public access
    chmod -R 2770 "$TARGET_DIR"
    chmod 700 "$BACKUP_DIR" "$LOG_DIR"

    echo "[SECURED] $TARGET_DIR set to 2770 (root:$OWNER_GROUP)"
    echo "[SECURED] Toolkit backups and logs restricted to 700"
}

# 3. Monitor disk, memory, and CPU usage
monitor_resources() {
    local REPORT="$LOG_DIR/resource_health_$(date +%Y%m%d_%H%M%S).log"
    {
        echo "=== RESOURCE HEALTH SNAPSHOT ($(date -u +"%Y-%m-%d %H:%M:%S UTC")) ==="
        echo -e "\n[CPU LOAD]"
        uptime
        lscpu | grep -E "Model name|CPU\(s\):" || true
        echo -e "\n[MEMORY USAGE]"
        free -h
        echo -e "\n[DISK USAGE]"
        df -hT -x tmpfs -x devtmpfs
        echo -e "\n[TOP 5 CPU PROCESSES]"
        ps aux --sort=-%cpu | head -n 6
    } | tee "$REPORT"
    echo "[SAVED] Report written to $REPORT"
}

# 4. Collect system logs
collect_logs() {
    local OUT_FILE="$LOG_DIR/system_logs_$(date +%Y%m%d_%H%M%S).log"
    {
        echo "=== SYSTEM LOG COLLECTION ($(date)) ==="
        for log in /var/log/syslog /var/log/auth.log /var/log/dpkg.log; do
            if [[ -r "$log" ]]; then
                echo -e "\n--- $log (Errors/Warnings/Auth Failures) ---"
                grep -iE "error|fail|warn|invalid user" "$log" | tail -n 15 || echo "No matching entries."
            fi
        done
    } > "$OUT_FILE"
    echo "[SAVED] Collected logs saved to $OUT_FILE"
}

# 5. Automate backups (supports both interactive and --auto-backup CLI mode for cron)
run_backup() {
    local SOURCE="${1:-$PROJECT_ROOT/docs}"
    local ARCHIVE="$BACKUP_DIR/toolkit_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

    if [[ ! -d "$SOURCE" ]]; then
        echo "[ERROR] Backup source '$SOURCE' not found." >&2
        return 1
    fi

    tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"
    local PRUNED
    PRUNED=$(find "$BACKUP_DIR" -name "toolkit_backup_*.tar.gz" -type f -mtime +7 -print -delete | wc -l)
    echo "[BACKUP] Created $ARCHIVE (Pruned $PRUNED archives older than 7 days)"
}

# Support headless execution for cron
if [[ "${1:-}" == "--auto-backup" ]]; then
    run_backup "${2:-$PROJECT_ROOT/docs}"
    exit 0
elif [[ "${1:-}" == "--health-check" ]]; then
    monitor_resources >/dev/null
    exit 0
fi

# Interactive Menu
while true; do
    echo ""
    echo "============================================="
    echo "  LINUX SERVER ADMINISTRATION TOOLKIT"
    echo "============================================="
    echo "1) Create & Manage Users / Groups (sudo)"
    echo "2) Harden Directory Permissions (sudo)"
    echo "3) Monitor CPU, Memory & Disk Usage"
    echo "4) Collect & Filter System Logs"
    echo "5) Run Compressed Backup + 7-Day Retention"
    echo "6) Exit"
    echo "---------------------------------------------"
    read -rp "Select an option [1-6]: " CHOICE

    case "$CHOICE" in
        1) manage_users ;;
        2) secure_directories ;;
        3) monitor_resources ;;
        4) collect_logs ;;
        5)
            read -rp "Directory to back up [default: $PROJECT_ROOT/docs]: " SRC
            run_backup "${SRC:-$PROJECT_ROOT/docs}"
            ;;
        6) echo "Exiting toolkit."; exit 0 ;;
        *) echo "[INVALID] Choose 1-6." ;;
    esac
done
