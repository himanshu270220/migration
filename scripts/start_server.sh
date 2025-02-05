#!/bin/bash
set -e  # Exit immediately if any command fails

echo "Starting Node.js application..."

# Ensure PM2 is installed
if ! command -v pm2 &> /dev/null; then
    echo "PM2 not found, installing..."
    sudo npm install -g pm2
fi

# Reload shell to make PM2 accessible
export PATH=$PATH:$(npm bin -g)

# Stop all existing PM2 processes
pm2 stop all || true

# Start the application from the correct path
pm2 start /home/ubuntu/migration/app.js --name nodejs-app

echo "Application started successfully."
