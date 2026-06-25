# Card Layout · 小红书图文卡片排版器

一个给 coding agent 用的 skill:把**已经写好的文字(+可选图片)**,排成小红书 / 公众号的 **3:4 图片连发**(1080×1440)。打包成 Claude Code 插件,核心 `SKILL.md` 也能被其它有文件系统 + shell 权限的 agent 直接读用。

> 不写文案,只排版出图——你把文字和图丢进来,它读懂、切卡、选风格、渲染成一整套可直接发的卡片。

## 它解决什么

**Card Layout** 让不懂设计的人也能做出像被设计过的图文卡。它用「**show, don't tell**」:不让你用语言描述想要什么风格,而是**读懂你的内容 → 切好卡 → 给你几张真样张看图选**。

三件它替你做的事:
1. **读稿切卡** —— 通读全文,逐段判断最适合哪种模块(封面/正文/概念/数据/对比/步骤/金句/清单/封底/图文)。
2. **自动配图** —— 你只管把图一股脑丢进来,它**看图 + 读稿,自动把每张图配到对应段落**,你确认即可,零标注。
3. **看图选风格** —— 从 10 套内置风格里按内容筛出合适的,渲样张给你挑,选定后整套出图。

### 核心特性

- **零依赖** —— 每张卡是一个自包含 HTML(内联 CSS),无 npm、无构建。
- **看图选风格** —— 说不清想要啥?不用说,看样张挑。
- **10 套成套风格 × 多模块** —— 每套都覆盖全部内容模块 + 4 种图文版式,风格内部高度统一。
- **反 AI 味** —— 每套锚定一个真实设计母题(瑞士国际主义 / 包豪斯 / 复古版画 / 孟菲斯…),不是「白底紫渐变」那种通用 AI 长相。
- **中文排版讲究** —— 大标题光学左对齐(抵消衬线 side bearing)、标题不加引号、页脚全卡统一、强底纹文字垫色块……都已固化。
- **可扩展** —— 复制一个文件夹就能加一套新风格。

## 安装

### 通过 Claude Code 自定义市场源(推荐)

直接从 GitHub 仓库安装。**分两条消息发**,别把两行一起贴进去。

```text
/plugin marketplace add https://github.com/zhy9495/card-layout
```

等它完成后,再运行:

```text
/plugin install card-layout@card-layout
```

用 HTTPS 链接(短写法 `zhy9495/card-layout` 可能让 Claude Code 走 SSH 而失败)。
装好后在 Claude Code 里输入 `/card-layout:card-layout` 调用(插件装的 skill 命名空间是 `/插件名:skill名`)。

### 手动安装

把整个 skill 复制进你的 skills 目录:

```bash
git clone https://github.com/zhy9495/card-layout.git ~/.claude/skills/card-layout
```

然后输入 `/card-layout` 调用(独立 skill 不带命名空间)。

### 其它 coding agent

Codex / Gemini CLI / OpenCode 等也能用同一套核心 skill。把这个仓库链接发给它,让它「用 Card Layout 这个 skill」:

```text
https://github.com/zhy9495/card-layout
```

让它从 `SKILL.md` 读起,按需加载 `styles/index.json`、选中风格的 `styles/<slug>/design.md`、`scripts/`。需要 macOS + Chrome 出图。

## 用法

```text
/card-layout:card-layout

> 「把这篇文章做成小红书图」(把文字贴进来,图片一起丢进来)
```

它会:
1. 读稿提炼核心观点 / 钩子 / 页面节奏;
2. 切卡规划——逐段判模块 + 自动把你的图配到对应段,出一张**编号规划表**让你确认;
3. 从 `styles/index.json` 按内容筛风格,渲 2-3 张样张让你**看图选**;
4. 问账号名(可留空),按选中风格逐卡渲成 1080×1440 PNG;
5. 拼图自审(溢出/对齐)→ 问你存哪 → 归档。

## 内置风格(10 套)

| 风格 | 母题 | 调性 | 适合 |
|---|---|---|---|
| **warm-editorial** 暖纸编辑 | 杂志衬线 | 暖·克制·留白 | 情感/生活/方法论 |
| **swiss-grid** 瑞士网格 | 国际主义 | 理性·专业·清晰 | 英语/知识/职场 |
| **vintage-collage** 版画长文 | 复古拼贴 | 安静·艺术·近黑白 | 心理/情感长文 |
| **folder-doodle** 彩色文件夹 | 桌面拟物 | 俏皮·聪明·热闹 | 分类/并列/概念 |
| **bauhaus** 包豪斯 | Bauhaus | 大胆·几何·理性 | 设计/思维/创意 |
| **neo-brutalism** 粗野 | Neo-Brutalism | 冲·直接·现代 | 清醒/观点/态度 |
| **minimal-quiet** 性冷淡 | 极简主义 | 安静·高级·留白 | 极简生活/审美 |
| **bold-poster** 得意黑海报 | Bold Poster | 冲击·态度·宣言 | 自律/搞钱/观点 |
| **memphis** 孟菲斯 | Memphis 80s | 活泼·俏皮·复古 | 松弛/生活/情绪 |
| **typewriter-memo** 打字机便签 | 索引卡备忘 | 低调·亲密·手作 | 自我对话/治愈/日记 |

每套都有:封面 · 正文 · 概念 · 数据 · 对比 · 步骤 · 金句 · 清单 · 封底,外加 4 种图文版式(上图下文 / 左图右文 / 双竖图拼 / 四图网格)。

## 样张画廊

| | | |
|:--:|:--:|:--:|
| ![warm-editorial](styles/warm-editorial/sample-cover.png)<br>**暖纸编辑** | ![swiss-grid](styles/swiss-grid/sample.png)<br>**瑞士网格** | ![vintage-collage](styles/vintage-collage/sample-hook.png)<br>**版画长文** |
| ![folder-doodle](styles/folder-doodle/sample.png)<br>**彩色文件夹** | ![bauhaus](styles/bauhaus/sample.png)<br>**包豪斯** | ![neo-brutalism](styles/neo-brutalism/sample.png)<br>**粗野** |
| ![minimal-quiet](styles/minimal-quiet/sample.png)<br>**性冷淡** | ![bold-poster](styles/bold-poster/sample.png)<br>**得意黑海报** | ![memphis](styles/memphis/sample.png)<br>**孟菲斯** |
| ![typewriter-memo](styles/typewriter-memo/sample.png)<br>**打字机便签** | | |

## 架构

本 skill 用**渐进式披露**——`SKILL.md` 是流程地图,支撑文件按需加载:

| 文件 | 作用 | 何时加载 |
|---|---|---|
| `SKILL.md` | 核心流程 + 规则 | 永远(skill 触发时) |
| `styles/index.json` | 风格目录(元数据) | Stage 3 选风格(先读这个筛) |
| `styles/<slug>/sample-*.png` | 样张 | Stage 3 看图选 |
| `styles/<slug>/design.md` | 选中那套的完整配方 | Stage 3 用户选定后才读 |
| `styles/<slug>/page-*.html` | 各模块骨架 | Stage 5 渲染 |
| `scripts/render.sh` · `shoot.sh` | 渲染 + 拼图自审 | Stage 5 / 6 |

先给 agent 一张地图,再只揭开当前需要的文件——这是 agent-skill 的最佳实践。

## 加一套新风格

复制一个 `styles/<新slug>/` 文件夹 →
1. 改 `meta.json`(名字 / 适配题材 / mood / 密度);
2. 写 `design.md`(母题 / 配色 / 字体 / 招牌动作 / 页面集 / do-don't);
3. 渲出 `sample-*.png`;
4. 在 `styles/index.json` 登记一条。

母题怎么来?**发一张你喜欢的参考图,让 skill 做「7 点拆解」**(母题命名 / 配色 / 字体 / 招牌动作 / 氛围 / 版式 / 适合 + 复刻度),拆出来就是一份 `design.md`。

## 设计信条

1. **不必是设计师,也能做出好看的东西。** 你只需要对看到的东西做反应。
2. **依赖即债务。** 一个 HTML 十年后还能打开。
3. **通用即遗忘。** 每套连发都该像被设计过,不是模板批量产。
4. **母题是灵魂。** 锚定一个真实设计传统,才不会落进 AI 通用美学。

## 依赖

- macOS + Google Chrome(无头截图出图)
- `python3` + `Pillow`(拼图自审)
- 中文 webfont 走 ZeoSeven / Google Fonts CDN(渲染时联网)

## 致谢

排版方法论参考了 [归藏 social-card-skill](https://github.com/op7418/guizang-social-card-skill) 的「压缩阶梯」、[Zara Zhang 的 frontend-slides](https://github.com/zarazhangrui/frontend-slides) 的渐进式披露 + 看图选风格;字体来自得意黑 / 京华老宋 / 文津宋 / 思源系列(均免费商用)。

## 许可

MIT — 随便用、改、分享。
