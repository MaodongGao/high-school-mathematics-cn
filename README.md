# 高中数学笔记

把纸质高中数学笔记逐步整理成结构清晰、可维护、可打印的中文 LaTeX 教材。

本项目借鉴 [Language Science Press 420](https://github.com/langsci/420/tree/main) 的工程组织思路：主文件只负责装配；元数据、宏命令与包配置彼此独立；正文按章节拆分；图片和参考文献集中管理。这里使用轻量的 `ctexbook` 自定义类，以便中文数学内容可以直接用 XeLaTeX 编译。

## 当前状态

- 已完成第一章“立体几何初步”，来源为 `数学/数学1.pdf`。
- 第一章覆盖点线面、空间平行与垂直、多面体、旋转体、球、投影及三余弦定理；例题均配题图，并以“定理—推论—例题”三层结构组织。
- 已完成第二章“数列”，来源为 `数学/数学11.pdf`；35 页原稿均已建立逐页例题核对记录，例题已收录或明确合并，原稿辨认与笔误修正另有 review 文档留痕。
- 已完成第三章“计数原理与排列组合”，来源为 `数学/数学18.pdf`；26 页原稿（含封面）已逐页对账，排列限制、分组分配、错排、组合几何、格路与染色均已整理并完成数学与视觉复核。
- 原始扫描 PDF 保留在仓库外，不会被复制或提交。
- 章节采用高信息密度写法：压缩重复叙述，但不省略理解链条；核心结论保留直观含义、必要推理、使用条件与典型例题。例题优先保留有解释力和迁移价值的解法，不以篇幅最短为标准。能为难题提供转化灵感的二级结论单独放入“推论”框，不埋在正文段落中。
- 例题标题标明来源性质：原稿中的题和方法使用“原稿例／原稿型／原稿方法”，整理过程中新增的题统一标为“补充”，便于逐题复核。

## 编译

需要 TeX Live 或 MacTeX，并确保 `xelatex`、`latexmk` 和 `biber` 可用。

若使用 BasicTeX 轻量安装，还需安装 `tcolorbox` 跨页功能使用的 `pdfcol` 小包：

```bash
tlmgr init-usertree                 # 仅首次创建个人 TeX tree 时需要
tlmgr --usermode install pdfcol
```

```bash
make pdf
```

生成文件位于 `output/pdf/main.pdf`。持续预览可运行：

```bash
make watch
```

章节交付前应运行完整验证并生成视觉检查页：

```bash
make verify
make render-review
```

`make verify` 会检查 LaTeX 日志和最终 PDF 提取文本；`make render-review` 会在
`tmp/pdfs/` 下生成逐页 PNG 与 contact sheet，供代理逐页检查后删除。视觉检查需要 Ghostscript；生成 contact sheet 还需要 ImageMagick 的 `montage`。

## 目录

```text
.
├── main.tex                   # 全书入口
├── schoolbook.cls             # 中文教材版式
├── config/                    # 元数据、宏命令、包配置
├── frontmatter/               # 前言等前置内容
├── subjects/mathematics/      # 数学章节与插图
├── references/                # BibLaTeX 文献库
├── sources/                   # 原始笔记索引，不存扫描件
├── docs/                      # 工作流与写作约定
└── output/pdf/                # 生成的 PDF
```

## 下一步

从 `sources/catalog.csv` 中选择一个来源，确定它对应的知识主题，再逐页整理到目标章节。整理顺序不等于最终成书顺序；已知章节依赖与 `数学4` 前置规则见 [`docs/book-structure.md`](docs/book-structure.md)。

## 给代理的完整章节任务提示词

开始整理一份新的扫描笔记时，可以直接复制下面这句话，并把路径替换为目标 PDF：

```text
按照 repo 中的 AGENTS.md，从头到尾自主整理这份 PDF（/path/to/source.pdf）；持续工作到满足 complete 标准，只把真正无法判断的问题集中留在 review 文档中。
```

这条提示词表示代理应自行完成逐页盘点、正文整理、数学验算、来源对账、编译与整章视觉复核，而不是在每个局部问题处等待确认。
