#!/usr/bin/env bash
set -euo pipefail
echo "Aurekai dev container post-create setup..."
export PATH="/root/.aurekai/bin:$HOME/.aurekai/bin:$PATH"
akai doctor || echo "akai not yet available — will be ready after next shell restart"
echo "Post-create complete."
