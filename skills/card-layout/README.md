# Card Layout — skill internals

Turns already-written copy (+ optional images) into 3:4 / 4:5 / 1:1 image carousels for Xiaohongshu, Instagram, and WeChat. Layout-only: it does not write copy.

- **Workflow & rules:** [`SKILL.md`](SKILL.md) (the operational spec; written in Chinese because it typesets Chinese copy — but the skill handles English/bilingual content too).
- **Style library:** `styles/` — read `styles/index.json` first, then the chosen `styles/<slug>/design.md`.
- **Render:** `scripts/render.sh <html> <out.png>` (one card) · `scripts/shoot.sh <styledir>` (whole style + contact-sheet self-review).

## Flow
Paste copy (+ drop images, optional account name) → read & split → plan cards + auto-pair images → pick a style by preview → choose size → render PNGs → self-review → archive.

## 9 styles
warm-editorial · swiss-grid · vintage-collage · bauhaus · neo-brutalism · minimal-quiet · bold-poster · memphis · typewriter-memo. Each covers cover / body / concept / data / compare / steps / quote / list / closing + 4 image layouts.

## Sizes
Xiaohongshu 3:4 (1080×1440, default) · Instagram 4:5 (1080×1350, recommended) · 1:1 (1080×1080). One carousel = one ratio.

## Add a style
Copy `styles/<slug>/`, edit `meta.json` + `design.md`, render `sample-*.png`, register in `styles/index.json`.

Full English overview: see the repo root [README](../../README.md).
