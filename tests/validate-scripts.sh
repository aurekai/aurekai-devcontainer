#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PASS=0; FAIL=0

for f in "$ROOT/devcontainer.json"; do
  if python3 -c "import json,sys; json.load(open(sys.argv[1]))" "$f" 2>/dev/null; then
    echo "  v $(basename "$f")"; PASS=$((PASS+1))
  else
    echo "  x $(basename "$f")"; FAIL=$((FAIL+1))
  fi
done

for f in "$ROOT/scripts/post-create.sh"; do
  if bash -n "$f" 2>/dev/null; then
    echo "  v $(basename "$f")"; PASS=$((PASS+1))
  else
    echo "  x $(basename "$f")"; FAIL=$((FAIL+1))
  fi
done

echo; echo "Dev container files: $PASS passed, $FAIL failed"
[ "$FAIL" -eq 0 ]
