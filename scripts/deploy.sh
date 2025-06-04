#!/bin/bash

# Navigate to the app directory
cd /home/ec2-user/react-app

# Install dependencies
npm install

# Build the React app
npm run build

# Install serve globally
npm install -g serve

# Serve the app on port 80
serve -s build -l 80
