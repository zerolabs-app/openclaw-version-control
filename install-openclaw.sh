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

echo
echo "Creating OpenClaw workspace folders..."
mkdir -p ~/.openclaw/workspace/config
mkdir -p ~/.openclaw/workspace/agents
mkdir -p ~/.openclaw/workspace/mission-control

if [ ! -f ~/.openclaw/workspace/OPENCLAW_DEFAULTS.json ]; then
  cat > ~/.openclaw/workspace/OPENCLAW_DEFAULTS.json <<'EOF'
{
  "workspaceIsAuthoritative": true,
  "mandatoryArtifacts": true,
  "agentWorkspaceBase": "~/.openclaw/workspace/agents/agent1-workspace/",
  "sharedWorkspaceRules": "~/.openclaw/workspace/mission-control/resources/workspace-rules.md"
}
EOF
fi

echo
echo "Workspace ready:"
echo "~/.openclaw/workspace"
