#!/usr/bin/env bash
set -e

echo
echo "=================================="
echo "OpenClaw on Windows Installer"
echo "=================================="
echo

bash <(curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/install-node.sh)

echo

bash <(curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/install-openclaw.sh)

echo
echo "=================================="
echo "Installation Complete"
echo "=================================="
echo
