#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
INPUT="$ROOT_DIR/Docs/Final_Presentation_Smart_University.md"
OUTPUT="$ROOT_DIR/Docs/Final_Presentation_Smart_University.pptx"
MARP="$ROOT_DIR/frontend/node_modules/@marp-team/marp-cli/marp-cli.js"

if [[ ! -f "$MARP" ]]; then
  echo "Marp CLI not found at $MARP"
  exit 1
fi

node "$MARP" "$INPUT" --pptx -o "$OUTPUT"
echo "Generated: $OUTPUT"
