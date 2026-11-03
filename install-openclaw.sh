#!/usr/bin/env bash
set -eo pipefail

# The tested OpenClaw version lives in version.txt (one line, e.g. 2026.9.33).
# Strip spaces and Windows line endings, and stop if it isn't a version
# number - an empty or garbled value must never install "latest".
VERSION=$(curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/version.txt | tr -d '[:space:]')

if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Couldn't read the OpenClaw version to install (got: '$VERSION')."
  echo "Check your internet connection and run this again."
  exit 1
fi

echo
echo "Installing OpenClaw $VERSION"
echo

npm install -g "openclaw@$VERSION" --ignore-scripts

echo
echo "Installed version:"
openclaw --version

echo
echo "Creating OpenClaw workspace folders..."
mkdir -p ~/.openclaw/workspace/config
mkdir -p ~/.openclaw/workspace/agents
mkdir -p ~/.openclaw/workspace/mission-control

if [ ! -f ~/.openclaw/workspace/OPENCLAW_DEFAULTS.json ]; then
  cat > ~/.openclaw/workspace/OPENCLAW_DEFAULTS.json <<'JSON'
{
  "workspaceIsAuthoritative": true,
  "mandatoryArtifacts": true,
  "agentWorkspaceBase": "~/.openclaw/workspace/agents/agent1-workspace/",
  "sharedWorkspaceRules": "~/.openclaw/workspace/mission-control/resources/workspace-rules.md"
}
JSON
fi

echo
echo "Workspace ready:"
echo "~/.openclaw/workspace"
