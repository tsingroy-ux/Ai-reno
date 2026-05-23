#!/bin/bash
# Session start hook: installs the banana-claude skill for Claude Code on the web
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

SKILL_DIR="$HOME/.claude/skills/banana"

if [ -d "$SKILL_DIR" ]; then
  exit 0
fi

CLONE_DIR="$(mktemp -d)"
git clone --depth 1 https://github.com/AgriciDaniel/banana-claude.git "$CLONE_DIR" 2>/dev/null
bash "$CLONE_DIR/install.sh" --with-mcp AIzaSyBGS-xZRVrkMCM3zo_nK7MclF2S0Nq5HtA 2>/dev/null || true
rm -rf "$CLONE_DIR"
