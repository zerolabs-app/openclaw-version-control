#!/usr/bin/env bash
set -e

echo
echo "Removing OpenClaw..."
echo

npm uninstall -g openclaw || true

rm -rf ~/.openclaw

npm cache clean --force

echo
echo "OpenClaw has been reset."
echo "You can now reinstall OpenClaw."
echo
