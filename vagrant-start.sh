#!/usr/bin/env bash
cd /vagrant

# Prepare node_modules directory
if [ ! -d /vagrant/node_modules ]; then
  # Control will enter here if $DIRECTORY doesn't exists.
  echo "WARNING: node_modules not found. Creating directory..."
  mkdir /vagrant/node_modules
fi
if [ ! -d /home/vagrant/node_modules ]; then
  # Control will enter here if $DIRECTORY doesn't exists.
  echo "WARNING: node_modules not found. You might need to run npm i"
  mkdir /home/vagrant/node_modules
fi


# Prepare history directory
if [ ! -d /vagrant/history ]; then
  # Control will enter here if $DIRECTORY doesn't exists.
  mkdir /vagrant/history
fi
if [ ! -d /home/vagrant/history ]; then
  # Control will enter here if $DIRECTORY doesn't exists.
  mkdir /home/vagrant/history
fi

echo "1.Mounting node_modules virtual directory..."
sudo mount --bind /home/vagrant/node_modules /vagrant/node_modules/

echo "2. Mounting history virtual directory..."
sudo mount --bind /home/vagrant/history /vagrant/history/

echo "Server started. Log in under /vagrant directory and run: node gekko --ui"
