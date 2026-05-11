#!/usr/bin/env bash

echo
echo "=================================="
echo "OpenClaw on Windows Doctor"
echo "=================================="
echo

echo "System:"
echo "----------------------------------"
uname -a || true
lsb_release -a 2>/dev/null || cat /etc/os-release 2>/dev/null || true

echo
echo "WSL:"
echo "----------------------------------"
if grep -qi microsoft /proc/version 2>/dev/null; then
  echo "Running inside WSL: YES"
else
  echo "Running inside WSL: UNKNOWN/NO"
fi

echo
echo "Node / NPM:"
echo "----------------------------------"
node -v 2>/dev/null || echo "Node: NOT FOUND"
npm -v 2>/dev/null || echo "NPM: NOT FOUND"

echo
echo "NVM:"
echo "----------------------------------"
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  echo "NVM: FOUND"
  . "$HOME/.nvm/nvm.sh"
  nvm --version || true
else
  echo "NVM: NOT FOUND"
fi

echo
echo "OpenClaw:"
echo "----------------------------------"
openclaw --version 2>/dev/null || echo "OpenClaw: NOT FOUND"

echo
echo "OpenClaw package path:"
echo "----------------------------------"
npm root -g 2>/dev/null || true
which openclaw 2>/dev/null || true

echo
echo "Workspace:"
echo "----------------------------------"
if [ -d "$HOME/.openclaw" ]; then
  echo "~/.openclaw: FOUND"
  du -sh "$HOME/.openclaw" 2>/dev/null || true
else
  echo "~/.openclaw: NOT FOUND"
fi

echo
echo "Disk Space:"
echo "----------------------------------"
df -h "$HOME" || true

echo
echo "Network Checks:"
echo "----------------------------------"
curl -I -L --max-time 10 https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/version.txt 2>/dev/null | head -n 1 || echo "GitHub raw access: FAILED"
curl -I -L --max-time 10 https://registry.npmjs.org/openclaw 2>/dev/null | head -n 1 || echo "NPM registry access: FAILED"

echo
echo "Pinned Versions:"
echo "----------------------------------"
echo -n "Stable OpenClaw: "
curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/version.txt 2>/dev/null || echo "FAILED"

echo
echo -n "Test OpenClaw: "
curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/test.txt 2>/dev/null || echo "FAILED"

echo
echo -n "Node Version: "
curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/node-version.txt 2>/dev/null || echo "FAILED"

echo
echo -n "NVM Version: "
curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/nvm-version.txt 2>/dev/null || echo "FAILED"

echo
echo "=================================="
echo "Doctor check complete."
echo "=================================="
echo
