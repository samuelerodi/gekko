#!/usr/bin/env bash

echo "Running provisioning script..."
echo "Updating VM..."
apt-get update
echo "Installing Python 2.7..."
apt-get install python -y
echo "Installing build tools..."
apt-get install build-essential -y
# echo "Installing nginx..."
# apt-get install nginx

echo "End of privileged user execution"
