#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[STEP] bootstrap"
"$ROOT_DIR/scripts/bootstrap.sh"

echo "[STEP] apply"
"$ROOT_DIR/scripts/apply.sh"

echo "[STEP] verify"
"$ROOT_DIR/scripts/verify.sh"

echo "[DONE] setup completed."
