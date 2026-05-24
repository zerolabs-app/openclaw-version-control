#!/usr/bin/env bash
set -e

VERSION=$(curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/test.txt)

echo
echo "Installing TEST OpenClaw $VERSION"
echo

npm install -g "openclaw@$VERSION" --ignore-scripts

echo
openclaw --version
