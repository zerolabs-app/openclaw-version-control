#!/usr/bin/env bash
set -eo pipefail

# Installs Node.js system-wide (NodeSource apt packages), the way
# OpenClaw's gateway service expects - not through nvm, which OpenClaw
# warns "can break after upgrades".
#
# node-version.txt holds the tested version (e.g. 24.22.0). Only its major
# number is used here: NodeSource installs the newest release of that line.

NODE_VERSION=$(curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/node-version.txt | tr -d '[:space:]')
NODE_MAJOR="${NODE_VERSION%%.*}"

if ! [[ "$NODE_MAJOR" =~ ^[0-9]+$ ]]; then
  echo "Couldn't read the Node.js version to install (got: '$NODE_VERSION')."
  echo "Check your internet connection and run this again."
  exit 1
fi

echo "Installing Node.js $NODE_MAJOR (enter your Ubuntu password if asked)"

sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
SETUP=$(mktemp)
curl -fsSL "https://deb.nodesource.com/setup_${NODE_MAJOR}.x" -o "$SETUP"
sudo -E bash "$SETUP"
rm -f "$SETUP"
sudo apt-get install -y nodejs

# npm's global folder in your home folder, so "npm install -g" never
# needs sudo. The PATH line goes in both ~/.profile (login shells, which
# Mission Control uses) and ~/.bashrc (terminal windows).
mkdir -p "$HOME/.npm-global"
npm config set prefix "$HOME/.npm-global"
LINE='export PATH="$HOME/.npm-global/bin:$PATH"'
for f in "$HOME/.profile" "$HOME/.bashrc"; do
  touch "$f"
  grep -qxF "$LINE" "$f" || printf '\n# OpenClaw on Windows: npm global programs\n%s\n' "$LINE" >> "$f"
done
export PATH="$HOME/.npm-global/bin:$PATH"

echo
echo "Node.js: $(command -v node)"
node -v
npm -v
