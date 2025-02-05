#!/bin/bash

echo "Running BeforeInstall script..."

# Stop the currently running application if it exists
echo "Stopping any running application..."
pm2 stop all || true

# Clean up existing application directory
APP_DIR="/home/ubuntu/migration"
if [ -d "$APP_DIR" ]; then
    echo "Removing existing application directory..."
    rm -rf "$APP_DIR"
else
    echo "No existing application directory found."
fi

# Ensure the directory exists after cleanup
echo "Creating fresh application directory..."
mkdir -p "$APP_DIR"

# Copy application files to the destination directory
echo "Copying application files..."
cp -r /home/aadhvik-27_02/migration/* /home/ubuntu/migration/

echo "BeforeInstall script completed."
