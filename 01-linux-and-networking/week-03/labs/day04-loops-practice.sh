#!/usr/bin/env bash
# Week 03 - Day 04 Lab: Practicing for, while, until, break & continue

echo "=== 1. FOR Loop with Array & Skip Control (continue) ==="
ENVIRONMENTS=("dev" "staging" "deprecated" "prod")

for env in "${ENVIRONMENTS[@]}"; do
    if [[ "$env" == "deprecated" ]]; then
        echo "[SKIP] Ignoring '$env' environment."
        continue
    fi
    echo "[DEPLOY] Provisioning configuration for: $env"
done

echo ""
echo "=== 2. WHILE Loop: Safe Line-by-Line Config Parsing ==="
SAMPLE_LIST="/tmp/day04_endpoints.txt"
printf "api.internal:8080\ndb.internal:5432\ncache.internal:6379\n" > "$SAMPLE_LIST"

LINE_NUM=1
while IFS= read -r endpoint; do
    echo "Endpoint #$LINE_NUM -> $endpoint"
    ((LINE_NUM++))
done < "$SAMPLE_LIST"

echo ""
echo "=== 3. UNTIL Loop: Polling Simulation with Early Exit (break) ==="
RETRY=1
MAX_RETRIES=5

until [[ $RETRY -gt $MAX_RETRIES ]]; do
    echo "Attempt $RETRY/$MAX_RETRIES: Checking service readiness..."
    if [[ $RETRY -eq 3 ]]; then
        echo "[READY] Service responded on attempt $RETRY! Breaking loop."
        break
    fi
    sleep 1
    ((RETRY++))
done
