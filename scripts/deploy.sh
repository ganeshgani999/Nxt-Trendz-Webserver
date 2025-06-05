#!/bin/bash

# Exit on any error
#Test Build
set -e

# Navigate to the app folder
cd /home/ec2-user/react-app

# Install dependencies
echo "Installing dependencies..."
npm install

# Build the React app
echo "Building app..."
npm run build

# Install 'serve' globally only if not already installed
if ! command -v serve &> /dev/null
then
    echo "'serve' not found, installing..."
    npm install -g serve
fi

# Kill existing serve process on port 80
echo "Freeing port 80..."
sudo fuser -k 80/tcp || true

# Serve the app
echo "Starting app on port 80..."
serve -s build -l 80 > /dev/null 2>&1 &
