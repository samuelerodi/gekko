#!/usr/bin/env bash

NODE_VERSION=8.11.3

# Installing nvm and nodejs
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/v0.23.3/install.sh | bash
echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile

# Set node version
echo "Using nodejs version: $NODE_VERSION"
nvm install $NODE_VERSION
nvm alias default $NODE_VERSION

# Install global packages
# npm install -g gulp

echo "Mounting virtual directories to avoid symlink error to /home/vagrant/"
# Remove node modules if already present
rm -rf /vagrant/node_modules
mkdir /vagrant/node_modules
if [ ! -d /home/vagrant/node_modules ]; then
  # Control will enter here if directory doesn't exists.
  mkdir /home/vagrant/node_modules
fi
rm -rf /vagrant/history
mkdir /vagrant/history
if [ ! -d /home/vagrant/history ]; then
  # Control will enter here if directory doesn't exists.
  mkdir /home/vagrant/history
fi

echo "1. Mounting node_modules virtual directory..."
sudo mount --bind /home/vagrant/node_modules /vagrant/node_modules/

echo "2. Mounting history virtual directory..."
sudo mount --bind /home/vagrant/history /vagrant/history/

echo "cd /vagrant" >> /home/vagrant/.profile

# Installing dependencies
cd /vagrant
npm install --only=production

echo "Provisioning finished"
