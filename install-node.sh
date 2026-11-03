#!/usr/bin/env bash
set -eo pipefail

# Versions live in node-version.txt and nvm-version.txt. Strip spaces and
# Windows line endings so a stray newline can't break the download links.
NODE_VERSION=$(curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/node-version.txt | tr -d '[:space:]')
NVM_VERSION=$(curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/nvm-version.txt | tr -d '[:space:]')

if [ -z "$NODE_VERSION" ] || [ -z "$NVM_VERSION" ]; then
  echo "Couldn't read the Node.js / nvm versions to install."
  echo "Check your internet connection and run this again."
  exit 1
fi

echo "Installing NVM $NVM_VERSION"

# pipefail: if the download fails, stop here instead of running an empty script
curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | bash

export NVM_DIR="$HOME/.nvm"

# nvm isn't written for "set -e" - load and run it with that switched off
set +e
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo
echo "Installing Node.js $NODE_VERSION"

nvm install "$NODE_VERSION" && nvm use "$NODE_VERSION" && nvm alias default "$NODE_VERSION"
STATUS=$?
set -e

if [ "$STATUS" -ne 0 ]; then
  echo "Node.js $NODE_VERSION didn't install - scroll up for the error."
  exit 1
fi

echo
node -v
npm -v
