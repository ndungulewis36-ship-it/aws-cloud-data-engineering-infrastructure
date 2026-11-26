#!/usr/bin/env bash
# Week 03 - Day 05 Lab: Functions, Local Scope, Exit Codes & Debugging

GLOBAL_VAR="Original Global Value"

# 1. Function demonstrating 'local' variable isolation
test_scope() {
    local LOCAL_VAR="Inside Function Only"
    local GLOBAL_VAR="Shadowed Inside Function"
    echo "[FUNCTION] LOCAL_VAR='$LOCAL_VAR'"
    echo "[FUNCTION] GLOBAL_VAR='$GLOBAL_VAR'"
}

echo "=== 1. Variable Scope Test ==="
test_scope
echo "[MAIN] GLOBAL_VAR='$GLOBAL_VAR'"
echo "[MAIN] LOCAL_VAR='${LOCAL_VAR:-<unset outside function>}'"

# 2. Function returning custom exit status codes
check_port_number() {
    local PORT="$1"
    if [[ -z "$PORT" ]]; then
        return 2
    elif [[ "$PORT" -lt 1024 || "$PORT" -gt 65535 ]]; then
        return 1
    fi
    return 0
}

echo ""
echo "=== 2. Exit Code Validation ==="
for p in 8080 80 ""; do
    check_port_number "$p"
    STATUS=$?
    echo "Testing port '${p:-empty}' -> Exit Code: $STATUS"
done

# 3. Targeted Debug Tracing (set -x / set +x)
echo ""
echo "=== 3. Targeted Debug Trace ==="
set -x
USER_COUNT=$(who | wc -l)
echo "Active sessions: $USER_COUNT"
set +x
