#!/usr/bin/env bash
set -eo pipefail

# npm global programs live in ~/.npm-global (set up by install-node.sh).
export PATH="$HOME/.npm-global/bin:$PATH"

# The tested OpenClaw version lives in version.txt (one line, e.g. 2026.9.33).
# Strip spaces and Windows line endings, and stop if it isn't a version
# number - an empty or garbled value must never install "latest".
VERSION=$(curl -fsSL https://raw.githubusercontent.com/zerolabs-app/openclaw-version-control/main/version.txt | tr -d '[:space:]')

if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Couldn't read the OpenClaw version to install (got: '$VERSION')."
  echo "Check your internet connection and run this again."
  exit 1
fi

if [ "$(npm config get prefix)" != "$HOME/.npm-global" ]; then
  echo "Node.js isn't set up yet - run the Node.js step (button 2) first."
  exit 1
fi

echo
echo "Installing OpenClaw $VERSION"
echo

npm install -g "openclaw@$VERSION" --ignore-scripts

echo
echo "Installed version:"
openclaw --version

# Already set up before (a reinstall or upgrade)? Rebuild the gateway
# service so it runs on this Node.js. First installs get the service
# from onboarding instead.
if [ -f "$HOME/.openclaw/openclaw.json" ]; then
  echo
  echo "Updating the OpenClaw gateway service..."
  openclaw gateway install --force || echo "Couldn't update the gateway service - run: openclaw gateway install --force"
  openclaw gateway restart >/dev/null 2>&1 || true
fi

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
