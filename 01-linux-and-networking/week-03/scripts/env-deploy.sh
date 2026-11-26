#!/usr/bin/env bash
# Week 03 - Day 02 Script: Environment Configuration via Arguments & Export

SERVICE_NAME=${1:-"etl-worker"}
export APP_ENV=${2:-"staging"}
DEPLOY_TIME=$(date +"%Y-%m-%d %H:%M:%S")

echo "[$DEPLOY_TIME] Configuring service: $SERVICE_NAME"
echo "Exported APP_ENV=$APP_ENV to child processes..."

# Verify subshell sees APP_ENV
bash -c 'echo " -> Child worker process inherited APP_ENV=$APP_ENV"'
