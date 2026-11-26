#!/usr/bin/env bash
# Week 03 - Day 05 Script: Production ETL Wrapper with Strict Mode & Trap Cleanup

set -euo pipefail

TMP_LOCK_FILE="/tmp/etl_job_$$.lock"

log() {
    local LEVEL="$1"
    local MSG="$2"
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [$LEVEL] $MSG"
}

cleanup() {
    local EXIT_CODE=$?
    if [[ -f "$TMP_LOCK_FILE" ]]; then
        rm -f "$TMP_LOCK_FILE"
        log "CLEANUP" "Removed temporary lock file: $TMP_LOCK_FILE"
    fi
    log "EXIT" "Job finished with status code: $EXIT_CODE"
}

# Ensure cleanup runs whether the script succeeds, fails, or is interrupted
trap cleanup EXIT

run_step() {
    local STEP_NAME="$1"
    log "INFO" "Starting step: $STEP_NAME"
    sleep 1
    log "SUCCESS" "Completed step: $STEP_NAME"
}

# Main Execution Flow
touch "$TMP_LOCK_FILE"
log "INFO" "Created lock file: $TMP_LOCK_FILE"

run_step "Extract raw records"
run_step "Validate schema & nulls"
run_step "Load curated Parquet output"
