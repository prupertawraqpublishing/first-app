#!/bin/bash

# Log file location
LOG_FILE="/var/log/deploy/start_application.log"
mkdir -p "$(dirname "$LOG_FILE")"

echo "$(date): Starting application with PM2..." >> "$LOG_FILE"

# Check if PM2 is installed globally, if not install it
if ! command -v pm2 &> /dev/null; then
    echo "$(date): Installing PM2..." >> "$LOG_FILE"
    npm install -g pm2
fi

# Stop any existing instance
pm2 stop first-app 2>/dev/null || true
pm2 delete first-app 2>/dev/null || true

# Start the application with PM2
cd /
pm2 start "npx serve out" --name "first-app"

# Save PM2 configuration to automatically restart on server reboot
pm2 save

# Check if the application started successfully
if pm2 list | grep -q "first-app"; then
    echo "$(date): Application started successfully" >> "$LOG_FILE"
    exit 0
else
    echo "$(date): Failed to start application" >> "$LOG_FILE"
    exit 1
fi