#!/usr/bin/env bash
# Week 03 - Day 03 Lab: Testing Numeric, String, File & Logical Operators

echo "=== Day 03 Lab: Conditional Operators ==="

# 1. String Test (-z and ==)
read -p "Enter target environment (dev/staging/prod): " ENV_INPUT

if [[ -z "$ENV_INPUT" ]]; then
    echo "[WARN] Empty input detected. Defaulting to 'dev'."
    ENV_INPUT="dev"
elif [[ "$ENV_INPUT" == "prod" || "$ENV_INPUT" == "staging" || "$ENV_INPUT" == "dev" ]]; then
    echo "[OK] Valid environment selected: $ENV_INPUT"
else
    echo "[ERROR] Unknown environment '$ENV_INPUT'. Exiting."
    exit 1
fi

# 2. Numeric Test (-gt, -ge, -lt)
read -p "Enter simulated CPU usage percentage (0-100): " CPU_USAGE

if [[ "$CPU_USAGE" -ge 90 ]]; then
    echo "[CRITICAL] CPU at ${CPU_USAGE}% - Triggering auto-scaling!"
elif [[ "$CPU_USAGE" -ge 70 ]]; then
    echo "[WARNING] CPU at ${CPU_USAGE}% - Elevated load."
else
    echo "[HEALTHY] CPU at ${CPU_USAGE}% - Operating normally."
fi

# 3. File & Logical Test (-f and !)
TEST_CONFIG="/tmp/day03_app.conf"
if [[ ! -f "$TEST_CONFIG" ]]; then
    echo "[INFO] $TEST_CONFIG not found. Creating default config..."
    echo "ENV=$ENV_INPUT" > "$TEST_CONFIG"
fi

if [[ -f "$TEST_CONFIG" && -r "$TEST_CONFIG" ]]; then
    echo "[VERIFIED] Config file exists and is readable: $(cat "$TEST_CONFIG")"
fi
