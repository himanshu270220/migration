#!/bin/bash
set -e  # Exit immediately if any command fails

echo "Removing old Node.js and conflicting packages..."
sudo apt-get remove -y nodejs libnode-dev || true

echo "Adding Node.js 18.x repository..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

echo "Installing Node.js..."
sudo apt-get install -y nodejs

echo "Verifying Node.js and npm versions..."
node -v
npm -v

# Update ownership of the migration directory to avoid permission issues
echo "Fixing permissions for migration directory..."
sudo chown -R $USER:$USER /home/aadhvik-27_02/migration
sudo chmod -R u+rw /home/aadhvik-27_02/migration

echo "Installing application dependencies..."
cd /home/aadhvik-27_02/migration || { echo "Directory not found"; exit 1; }

npm install || { echo "npm install failed"; exit 1; }

echo "install_dependencies script completed successfully."


