# Card Layout

A coding-agent skill that turns **already-written copy (plus optional images)** into ready-to-post **3:4 / 4:5 / 1:1 image carousels** for Xiaohongshu (RED), Instagram, and WeChat. Packaged as a Claude Code plugin; the core `SKILL.md` also works for any agent with filesystem + shell access.

> It doesn't write your copy — it lays it out. Drop in your text and images; it reads them, splits them into cards, auto-pairs the images, lets you pick a style by looking, and renders a full, on-brand set.

## What This Does

Card Layout uses a **"show, don't tell"** approach: instead of asking you to describe a look in words, it **reads your content, plans the cards, and shows you real sample covers to choose from**. Three things it does for you:

1. **Read & split** — reads the whole piece and decides the best module for each section (cover, body, concept, data, compare, steps, quote, list, closing, image).
2. **Auto-pair images** — just drop your images in; it looks at each image, reads the copy, and places each one next to the section it belongs to. No tagging required.
3. **Pick a style by eye** — it filters the 9 built-in styles by your content, then renders 2–3 sample covers for you to choose.

## Key Features

- **Zero runtime deps** — each card is one self-contained HTML (inline CSS), rendered to PNG via headless Chrome.
- **Pick-by-preview** — can't describe a look? Don't. Choose from rendered samples.
- **9 cohesive styles × multi-module** — every style covers all content modules + 4 image layouts, with a tight, consistent visual system.
- **Anti-AI-slop** — each style is anchored to a real design tradition (Swiss, Bauhaus, neo-brutalism, vintage-engraving, Memphis…), not generic AI looks.
- **CN + EN** — works for Chinese, English, or bilingual copy (each style ships Latin + CJK font stacks).
- **Multi-platform sizes** — Xiaohongshu 3:4, Instagram carousel 4:5 (recommended) and 1:1.
- **Extensible** — add a new style by copying one folder.

## Installation

### Via Claude Code custom marketplace (recommended)

Install straight from this repo. Run these as **two separate messages**:

```text
/plugin marketplace add https://github.com/zhy9495/card-layout
```

Then:

```text
/plugin install card-layout@card-layout
```

Use it by typing `/card-layout:card-layout`, then paste your copy and drop your images.

### Manual install

```text
git clone https://github.com/zhy9495/card-layout.git
```

Copy `skills/card-layout/` into your `~/.claude/skills/` directory, then use `/card-layout`.

### Other agents

Send the agent this repo link and ask it to use the Card Layout skill. It should start from `skills/card-layout/SKILL.md`, then load `styles/index.json`, the chosen style's `design.md`, and `scripts/` on demand. Requires macOS + Chrome to render.

## Usage

```text
/card-layout:card-layout

> "Turn this article into a Xiaohongshu carousel" (paste the text, drop the images)
```

The skill will:
1. Read the piece — core point, hook, page rhythm.
2. Plan the cards — module per section + auto-paired images — and show a numbered plan to confirm.
3. Filter styles from `styles/index.json` and render 2–3 sample covers to pick from.
4. Ask for account name (optional; left blank if none) and target size, then render each card to PNG.
5. Self-review the contact sheet (overflow / alignment) → ask where to save → archive.

## Included Styles (9)

| Style | Motif | Mood | Best for |
|---|---|---|---|
| **warm-editorial** | Didone editorial | warm · restrained | feelings / lifestyle / methods |
| **swiss-grid** | Swiss / International | rational · clean | knowledge / English / work |
| **vintage-collage** | engraving collage | quiet · literary | psychology / long-form |
| **bauhaus** | Bauhaus | bold · geometric | design / thinking |
| **neo-brutalism** | neo-brutalism | punchy · direct | opinions / wake-up calls |
| **minimal-quiet** | minimalism | calm · premium | minimal living / aesthetics |
| **bold-poster** | bold poster | high-impact · manifesto | discipline / money / takes |
| **memphis** | Memphis 80s | playful · retro | relaxed / lifestyle / moods |
| **typewriter-memo** | index-card memo | low-key · intimate | self-talk / healing / journal |

Every style covers: cover · body · concept · data · compare · steps · quote · list · closing, plus 4 image layouts (image-top / image-side / two-portrait / 4-grid).

## Style Gallery

Each style is shown in both **Chinese (Xiaohongshu)** and **English** — the English version is re-laid out, not just swapped in (longer words, English punctuation, resized to fit).

| Style | 中文 / Chinese | English |
|:--|:--:|:--:|
| **warm-editorial** | <img src="skills/card-layout/styles/warm-editorial/sample-cover.png?v=3" width="300"> | <img src="skills/card-layout/styles/warm-editorial/sample-en.png?v=3" width="300"> |
| **swiss-grid** | <img src="skills/card-layout/styles/swiss-grid/sample.png?v=3" width="300"> | <img src="skills/card-layout/styles/swiss-grid/sample-en.png?v=3" width="300"> |
| **vintage-collage** | <img src="skills/card-layout/styles/vintage-collage/sample-hook.png?v=3" width="300"> | <img src="skills/card-layout/styles/vintage-collage/sample-en.png?v=3" width="300"> |
| **bauhaus** | <img src="skills/card-layout/styles/bauhaus/sample.png?v=3" width="300"> | <img src="skills/card-layout/styles/bauhaus/sample-en.png?v=3" width="300"> |
| **neo-brutalism** | <img src="skills/card-layout/styles/neo-brutalism/sample.png?v=3" width="300"> | <img src="skills/card-layout/styles/neo-brutalism/sample-en.png?v=3" width="300"> |
| **minimal-quiet** | <img src="skills/card-layout/styles/minimal-quiet/sample.png?v=3" width="300"> | <img src="skills/card-layout/styles/minimal-quiet/sample-en.png?v=3" width="300"> |
| **bold-poster** | <img src="skills/card-layout/styles/bold-poster/sample.png?v=3" width="300"> | <img src="skills/card-layout/styles/bold-poster/sample-en.png?v=3" width="300"> |
| **memphis** | <img src="skills/card-layout/styles/memphis/sample.png?v=3" width="300"> | <img src="skills/card-layout/styles/memphis/sample-en.png?v=3" width="300"> |
| **typewriter-memo** | <img src="skills/card-layout/styles/typewriter-memo/sample.png?v=3" width="300"> | <img src="skills/card-layout/styles/typewriter-memo/sample-en.png?v=3" width="300"> |

## Sizes & Platforms

- **Xiaohongshu / general:** `3:4 = 1080×1440` (default).
- **Instagram carousel:** `4:5 = 1080×1350` (recommended — tallest in-feed, best engagement); `1:1 = 1080×1080` (cross-platform / paid).
- All cards in one carousel must share the same ratio. Pick the platform up front; the skill renders the whole set at that size.

## Languages

Chinese, English, or bilingual. Each style ships a `Latin, CJK` font stack — English glyphs render in the Latin face, Chinese in the CJK face. Title-no-quotes and hierarchy rules apply in both; CJK-only rules (full-width punctuation, pangu spacing) are skipped for English.

## Architecture

Progressive disclosure — `SKILL.md` is the map; supporting files load on demand:

| File | Purpose | Loaded when |
|---|---|---|
| `SKILL.md` | Workflow + rules | Always |
| `styles/index.json` | Style catalog (metadata) | Style selection (read first) |
| `styles/<slug>/sample-*.png` | Previews | Pick-by-eye |
| `styles/<slug>/design.md` | Full recipe for the chosen style | After the user picks |
| `styles/<slug>/page-*.html` | Per-module templates | Render |
| `scripts/render.sh` · `shoot.sh` | Render + contact-sheet self-review | Render / review |

## Add a New Style

Copy a `styles/<slug>/` folder → edit `meta.json` (name / topics / mood / density) + `design.md` (motif / palette / fonts / signature move / page set / do-don't) → render `sample-*.png` → register one entry in `styles/index.json`. The best way to find a motif: send the skill a reference image you love and have it do a 7-point teardown (motif / palette / fonts / signature / atmosphere / layout / fit).

## Requirements

macOS + Google Chrome (headless render) · `python3` + `Pillow` (contact-sheet review) · CJK webfonts load from ZeoSeven / Google Fonts CDN at render time.

## Credits

Methodology informed by [guizang social-card-skill](https://github.com/op7418/guizang-social-card-skill) and [Zara Zhang's frontend-slides](https://github.com/zarazhangrui/frontend-slides) (progressive disclosure + pick-by-preview). Fonts: Smiley Sans, KingHwa OldSong, WenJin Mincho, Source Han, Playfair Display, DM Sans, Cormorant Garamond, JetBrains Mono — all free for commercial use.

## License

MIT — use it, modify it, share it.
