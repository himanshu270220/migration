#!/bin/bash
set -e  # Exit immediately if any command fails

echo "Removing old Node.js and conflicting packages..."
sudo apt-get remove -y nodejs libnode-dev

echo "Adding Node.js 18.x repository..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

echo "Installing Node.js..."
sudo apt-get install -y nodejs

echo "Verifying Node.js and npm versions..."
node -v
npm -v

echo "Installing application dependencies..."
cd /home/ubuntu/nodejs-app || exit
npm install || { echo "npm install failed"; exit 1; }

echo "install_dependencies script completed."


