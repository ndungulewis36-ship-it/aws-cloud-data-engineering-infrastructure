#!/usr/bin/env bash
# Week 03 - Day 02 Lab: Variables, Environment Variables, Input & Arguments

# 1. Local Variables & Command Substitution
AUTHOR="Lewis"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

echo "=== Day 02: Variables, Export & Inputs ==="
echo "Author: $AUTHOR"
echo "Run Timestamp: $TIMESTAMP"
echo 'Single-quote literal test: $AUTHOR'

# 2. Command-Line Arguments
echo ""
echo "--- Positional Arguments ---"
echo "Script Name (\$0): $0"
echo "Argument Count (\$#): $#"
echo "Arg 1 (\$1): ${1:-default_service}"
echo "Arg 2 (\$2): ${2:-default_port}"
echo "All Args (\$@): $@"

# 3. Interactive User Input (read)
echo ""
echo "--- Interactive Input ---"
read -p "Enter deployment stage (dev/staging/prod): " DEPLOY_STAGE
read -s -p "Enter dummy API token (hidden input): " API_TOKEN
echo ""

# 4. Exporting Environment Variables to Child Subshells
export DEPLOY_STAGE
echo "Testing subshell inheritance:"
bash -c 'echo "Inside child subshell -> DEPLOY_STAGE=$DEPLOY_STAGE | AUTHOR=$AUTHOR"'

echo ""
echo "Setup complete for stage: $DEPLOY_STAGE"
