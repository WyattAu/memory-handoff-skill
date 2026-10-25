#!/usr/bin/env bash
# Locate and read the handoff file for a project slug.
# Usage:
#   handoff.sh path <slug>   Print the handoff file path (no read).
#   handoff.sh read <slug>   Print the file's contents (empty if none).
# The directory is $AGENT_HANDOFF_DIR or ~/.agent/handoffs.
set -euo pipefail

if [[ $# -ne 2 ]] || [[ "$1" != "path" && "$1" != "read" ]]; then
    echo "usage: handoff.sh path|read <slug>" >&2
    exit 2
fi

cmd="$1"
slug="$2"
dir="${AGENT_HANDOFF_DIR:-$HOME/.agent/handoffs}"
file="$dir/$slug.md"

if [[ "$cmd" == "path" ]]; then
    printf '%s\n' "$file"
    exit 0
fi

if [[ -f "$file" ]]; then
    cat "$file"
else
    echo "no handoff file at $file" >&2
    exit 0
fi
