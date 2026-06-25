#!/bin/bash
# render.sh — 把一个卡片 HTML 渲成 1080×1440 高清 PNG
# 用法: bash scripts/render.sh <input.html> <output.png>
# 说明: 中文 webfont 需联网加载,故用无头 Chrome + --virtual-time-budget 等字体。
#       别直接往 iCloud(带空格/中文)路径写 PNG——先渲到 /tmp 再 cp 回去。
set -e
IN="$1"; OUT="$2"
WORK=/tmp/cardlayout_work; mkdir -p "$WORK"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
cp "$IN" "$WORK/_r.html"
pkill -f "Google Chrome" 2>/dev/null; sleep 2
rm -rf "$WORK/_prof" "$WORK/_r.png"
"$CHROME" --headless=old --no-sandbox --disable-gpu --no-first-run --disable-extensions \
  --user-data-dir="$WORK/_prof" --force-device-scale-factor=2 --window-size=1080,1440 \
  --virtual-time-budget=13000 --hide-scrollbars --screenshot="$WORK/_r.png" "$WORK/_r.html" 2>/dev/null &
P=$!; for t in $(seq 1 45); do [ -s "$WORK/_r.png" ] && sleep 2 && break; sleep 1; done
kill $P 2>/dev/null; pkill -f "Google Chrome" 2>/dev/null
cp "$WORK/_r.png" "$OUT"
echo "rendered -> $OUT"
