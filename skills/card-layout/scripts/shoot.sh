#!/bin/bash
# shoot.sh — 渲染一个风格文件夹里所有 *.html 成 sample-*.png,并拼一张总图自审
# 用法: bash scripts/shoot.sh <styles/某风格目录>
# 输出: 各 sample-<名>.png + /tmp/contact.png(联系小样,供肉眼自审溢出/对齐/页脚一致)
DIR="$1"; WORK=/tmp/cardlayout_work; mkdir -p "$WORK"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
pkill -f "Google Chrome" 2>/dev/null; sleep 2; rm -f "$WORK"/sh_*.png
for h in "$DIR"/*.html; do
  [ -e "$h" ] || continue
  b=$(basename "$h" .html); case "$b" in _*) continue;; esac
  o="$WORK/sh_${b}.png"; rm -rf "$WORK/_profx"
  "$CHROME" --headless=old --no-sandbox --disable-gpu --no-first-run --disable-extensions \
    --user-data-dir="$WORK/_profx" --force-device-scale-factor=2 --window-size=1080,1440 \
    --virtual-time-budget=13000 --hide-scrollbars --screenshot="$o" "$h" 2>/dev/null &
  P=$!; for t in $(seq 1 40); do [ -s "$o" ] && sleep 1 && break; sleep 1; done
  kill $P 2>/dev/null; pkill -f "Google Chrome" 2>/dev/null; sleep 1
  cp "$o" "$DIR/sample-${b#page-}.png"; echo "  shot $b"
done
python3 - <<'PY'
import glob,os
from PIL import Image,ImageDraw
shots=sorted(glob.glob('/tmp/cardlayout_work/sh_*.png'))
if not shots: print("no shots"); raise SystemExit
tw,th=300,400;cols=min(4,len(shots));rows=(len(shots)+cols-1)//cols;pad=16
sheet=Image.new('RGB',(cols*tw+(cols+1)*pad,rows*(th+30)+pad),'white');d=ImageDraw.Draw(sheet)
for i,p in enumerate(shots):
    im=Image.open(p).convert('RGB');im.thumbnail((tw,th));x=pad+(i%cols)*(tw+pad);y=pad+(i//cols)*(th+30)
    sheet.paste(im,(x,y));d.text((x,y+th+4),os.path.basename(p)[3:-4],fill='black')
sheet.save('/tmp/contact.png');print("contact ->",len(shots),"cards")
PY
