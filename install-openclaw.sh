#!/usr/bin/env bash
set -e

VERSION=$(curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/version.txt)

echo
echo "Installing OpenClaw $VERSION"
echo

npm install -g "openclaw@$VERSION" --ignore-scripts

echo
echo "Installed version:"
openclaw --version
