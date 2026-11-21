#!/bin/bash
set -euo pipefail

echo "=== Lab 03: Users, Groups, and Permissions ==="
echo "Current User: $(whoami)"
echo "User ID and Groups:"
id

echo "Creating a test config file..."
echo "Secret infrastructure config" > config_test.txt
ls -l config_test.txt

echo "Applying octal permissions (chmod 600)..."
chmod 600 config_test.txt
ls -l config_test.txt

# Cleanup test file
rm config_test.txt