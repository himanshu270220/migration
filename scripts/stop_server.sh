#!/bin/bash
set -e  # Exit immediately if any command fails

echo "Stopping Node.js application..."

# Stop all pm2 processes
pm2 stop all || true

echo "Application stopped."
