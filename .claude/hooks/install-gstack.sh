#!/bin/bash
# Install gstack on session start if it's missing (fresh cloud containers start without it).
set -euo pipefail

GSTACK_DIR="$HOME/.claude/skills/gstack"

if [ -d "$GSTACK_DIR/bin" ]; then
  exit 0
fi

git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git "$GSTACK_DIR" >&2
(cd "$GSTACK_DIR" && ./setup --team) >&2
