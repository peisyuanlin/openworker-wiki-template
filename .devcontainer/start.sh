#!/usr/bin/env bash
# 每次開啟 Codespace 時執行：啟動 OpenWorker 後台與網頁介面。
# 也可以手動執行 `bash .devcontainer/start.sh` 來重新啟動。
set -uo pipefail

OW_DIR="$HOME/openworker"
WORKSPACE="$(cd "$(dirname "$0")/.." && pwd)"   # 知識庫資料夾 = 這個 repo
LOG_DIR="$HOME/.openworker-logs"; mkdir -p "$LOG_DIR"
STATE="${COWORKER_STATE_DIR:-$HOME/.config/coworker}"
TOKEN="$STATE/sidecar-8765.token"

if [ ! -x "$OW_DIR/.venv/bin/python" ]; then
  echo "還沒安裝 OpenWorker，先執行：bash .devcontainer/setup.sh"; exit 1
fi

# 關掉上一次的程序（如果有）
ps -eo pid,comm,args | awk '($2 ~ /^python/ || $2=="node") && /coworker\.server\.run|vite\.codespaces/ {print $1}' | xargs -r kill 2>/dev/null
sleep 1
rm -f "$TOKEN"

echo "==> 啟動 OpenWorker 後台（工作資料夾：$WORKSPACE）"
cd "$OW_DIR"
setsid nohup .venv/bin/python -m coworker.server.run --cwd "$WORKSPACE" --port 8765 \
  > "$LOG_DIR/server.log" 2>&1 < /dev/null &
for _ in $(seq 1 90); do [ -s "$TOKEN" ] && break; sleep 1; done
if [ ! -s "$TOKEN" ]; then
  echo "後台沒有啟動成功，請看 $LOG_DIR/server.log"; exit 1
fi

echo "==> 啟動網頁介面"
cd "$OW_DIR/surfaces/gui"
setsid nohup ./node_modules/.bin/vite --config vite.codespaces.config.mjs \
  > "$LOG_DIR/ui.log" 2>&1 < /dev/null &
for _ in $(seq 1 60); do curl -s -o /dev/null http://127.0.0.1:1420/ && break; sleep 1; done

echo "==> 完成！到下方「連接埠」分頁，點 OpenWorker（1420）旁的地球圖示打開。"
