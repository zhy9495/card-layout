# 风格包 · 彩色文件夹 · 手绘涂鸦 (folder-doodle)

> 母题:**桌面/Finder 文件夹拟物**(把内容塞进一个个彩色文件夹)× **手绘涂鸦**(闪电、配色箭头)× **编辑衬线**。
> 灵魂一句话:**正经衬线 + 幼稚涂鸦的反差**——聪明又松弛的「设计师玩心 explainer」。
> 拆解来源:@lauliblue「What I realized」(2026-06-24 用户提供)。
> 与 [[warm-editorial]] 互补:那套是单色·克制·留白·低密度;**本套是多色撞色·热闹·高密度·居中**。

---

## 1. 配色(多色 pop,和 warm-editorial 相反)

| token | 值 | 用途 |
|---|---|---|
| `--paper` | `#F3F0E2` | 浅冷米白底 |
| `--maroon` | `#5C1A17` | 深酒红/氧化牛血红,**只给大标题** |
| `--ink` | `#33271F` | 正文 + 文件夹标签(暖深褐) |
| `--coral` | `#F0613E` | 文件夹1 + 其箭头 + 闪电 |
| `--pink` | `#F08FC6` | 文件夹2 + 其箭头 |
| `--blue` | `#A8C8EE` | 文件夹3 + 其箭头 |

**铁律**:文件夹用 2-4 个**撞色**(珊瑚/糖粉/雾霾蓝是基准三色,可换但保持"明快糖果色");**箭头颜色必须与对应文件夹一致**。标题永远深酒红,正文永远深褐。底永远浅米白。

---

## 2. 字体(本套双字混排 —— 故意的反差)

```
标题:深酒红衬线 → 中文 'WenJin Mincho Plane 0'(文津宋体) / 英文 'Playfair Display'
   单字重,稍加粗用同色描边:-webkit-text-stroke:0.9px var(--maroon)
正文 + 文件夹标签 + handle:无衬线 → 英文 'Inter' / 中文 'Noto Sans SC'(思源黑体)
```
> 这是和 warm-editorial 的**关键区别**:warm-editorial 全卡一种字;**本套故意"正经衬线标题 + 随意黑体正文"**,反差正是母题灵魂(用户 2026-06-24 指定)。
> 标题字试过京华老宋(太古旧印刷感)、汇文明朝(同弃),最终用**文津宋体**(现代明朝,工整干净,和俏皮文件夹更搭;朱雀仿宋更文艺,作为备选)。

引入(文津宋体走 ZeoSeven CDN + 其余 Google Fonts):
```html
<link href="https://fontsapi.zeoseven.com/376/main/result.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,700;1,700&family=Noto+Sans+SC:wght@400;500;700&family=Inter:wght@400;600&display=swap" rel="stylesheet">
```
> 备选标题字:朱雀仿宋 `https://fontsapi.zeoseven.com/7/main/result.css`,font-family `"Zhuque Fangsong (technical preview)"`。

字号阶梯(@1080×1440):
- 标题:`100–108px` / line-height `1.1` / 居中 / 深酒红
- handle:`26px` / letter-spacing `.18em` / 居中
- 副标:`30–32px` / 居中
- 文件夹标签:`34px` / 600 / 深褐
- 说明段:`26px` / line-height `1.58` / 居中(关键词/例子可 `<b>`)

---

## 3. 招牌动作(必须有)

1. **彩色拟物文件夹** —— 矩形 + 左上一个小标签页 tab,纯 CSS(见 §6)。一行 2-4 个,各一个撞色。
2. **配色匹配的手绘箭头** —— 从副标/标题指向各文件夹,**每根颜色 = 它指的那个文件夹**;线条随意带弯,三根弯度各不同。
3. **手绘小涂鸦** —— 闪电 / 星星 / 圈,锈/亮色,点在标题旁(1 个就够,别撒满)。

---

## 4. 氛围层(同 warm-editorial:不靠纹理)

平涂色块 + 手绘线,干净。**不加**纸纹噪点做旧。质感全来自"拟物形状 + 手绘涂鸦"。

---

## 5. 版式骨架(1080×1440 · 居中 · 高密度)

```
[@handle · 居中顶]
[深酒红衬线大标题 · 2 行 · 居中]  + 手绘涂鸦(标题角)
[副标一句 · 居中]
   ↓三根配色手绘箭头(各指一个文件夹)
[文件夹A]  [文件夹B]  [文件夹C]    ← 一行,flex 等宽,各撞色 + 居中标签
[说明段A]  [说明段B]  [说明段C]    ← 各文件夹下方一段小字,居中
```
- body:`flex column; align-items:center; justify-content:center`,整体垂直居中。
- 文件夹行 / 箭头行 / 说明行都用 `display:flex; gap:36px`,三列对齐。
- 文件夹数量 2-4 个自适应;>4 个就拆成两张卡,别挤。

---

## 6. 实现素材

**文件夹形状(纯 CSS):**
```css
.folder{position:relative; width:100%; height:148px; border-radius:3px 16px 16px 16px;
  display:flex; align-items:center; justify-content:center;}   /* 背景色 inline 给 */
.folder::before{content:""; position:absolute; top:-24px; left:0;
  width:48%; height:28px; border-radius:14px 14px 0 0; background:inherit;}  /* 左上 tab */
```

**手绘下箭头(inline SVG,逐个换 stroke 颜色,弯度各异):**
```html
<svg viewBox="0 0 70 84" fill="none">
  <path d="M40 6 C 18 28, 56 48, 32 70" stroke="var(--coral)" stroke-width="4" stroke-linecap="round"/>
  <path d="M20 58 L31 72 L44 62" stroke="var(--coral)" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
```

**闪电涂鸦:**
```html
<svg viewBox="0 0 54 64" fill="none">
  <path d="M30 4 L12 36 L26 36 L20 60 L44 26 L30 26 Z" stroke="var(--coral)" stroke-width="4" stroke-linejoin="round"/>
</svg>
```

**渲染**:走 card-layout §8 管线;Chrome 加 `--virtual-time-budget=15000` 等 webfont 加载完。

---

## 7. do / don't

- ✅ 文件夹撞色明快、箭头配色匹配、标题深酒红衬线、正文黑体。
- ✅ 涂鸦点到为止(1-2 个)。
- ✅ 文件夹 2-4 个;多了拆卡。
- ❌ 不加纹理做旧、不让箭头和文件夹颜色错位、不把标题也用黑体(衬线反差是灵魂)、不超过 4 个文件夹硬挤。
- ❌ **涂鸦(闪电)收在标题右上角内**(`right:14px` 量级),别甩到标题外侧——会把整张视觉重心拽偏右。body 加 `text-align:center` 保证严格居中。

---

## 8. 适合 / 不适合

适合:**分类 / 并列 / 把一个概念拆成 2-4 块** —— 情绪分类、英语词汇/语法归类、测评维度、方法要素。对应 card-layout 的 A网格 / D对比 家族。
不适合:线性叙事 / 长段落 / 需要安静克制的内容(那找 [[warm-editorial]])。

---

## 9. 页面集(模块)· 已配齐

`page-cover.html` + `folder.html`(分类/对比)+ `page-body/concept/data/steps/quote/list/back.html` + `page-img-ab/lr/duo/grid.html`,各带 `sample-*.png`。
通用:奶油底 + 文津宋深酒红标题 + 思源黑正文 + 撞色文件夹/手绘涂鸦;步骤用彩色文件夹做编号;正文档=正文常规粗细 + 角落小碎片。
- **图文**:圆角(`radius:16px`)图片;布局见全局图文规则(横图上下 / 竖图左右 / 双竖拼 / ≤4 网格)。
