#!/usr/bin/env bash
# 第一次建立 Codespace 時執行：下載 OpenWorker、安裝 Python 與網頁介面套件。
set -euo pipefail

OW_DIR="$HOME/openworker"
# 固定在已測試過的版本，避免上游改版讓課堂步驟失效。想用最新版可設 OPENWORKER_REF=main
OW_REF="${OPENWORKER_REF:-7e20213dc88faaaaccace59461876c76e76b134a}"
HERE="$(cd "$(dirname "$0")" && pwd)"

echo "==> 下載 OpenWorker"
if [ ! -d "$OW_DIR/.git" ]; then
  git clone --filter=blob:none https://github.com/andrewyng/openworker "$OW_DIR"
fi
git -C "$OW_DIR" fetch --quiet origin
git -C "$OW_DIR" checkout --quiet "$OW_REF" 2>/dev/null || git -C "$OW_DIR" checkout --quiet "origin/$OW_REF"

echo "==> 安裝 Python 套件（最久的一步）"
bash "$OW_DIR/packaging/setup_dev_env.sh"

echo "==> 安裝網頁介面"
cp "$HERE/vite.codespaces.config.mjs" "$OW_DIR/surfaces/gui/"
(cd "$OW_DIR/surfaces/gui" && npm install --no-audit --no-fund)

echo "==> OpenWorker 安裝完成"
