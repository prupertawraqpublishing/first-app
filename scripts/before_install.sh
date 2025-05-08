#!/bin/bash
# Install Node.js if not already installed
if ! command -v node &> /dev/null; then
    curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi