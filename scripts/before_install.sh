#!/bin/bash

# Log file location
LOG_FILE="/var/log/deploy/before_install.log"
mkdir -p "$(dirname "$LOG_FILE")"

echo "$(date): Starting BeforeInstall phase..." >> "$LOG_FILE"

# Create necessary directories if they don't exist
mkdir -p /var/www/html

# Set proper permissions
chown -R root:root /var/www/html
chmod -R 755 /var/www/html

echo "$(date): BeforeInstall phase completed successfully" >> "$LOG_FILE"
exit 0