# 原始资料管理

原始资料位于仓库外：

```text
/Users/maodong/Documents/高中课程笔记
```

该目录目前包含数学、物理、化学、生物的扫描 PDF，以及一个物理压缩包。本仓库只处理数学。扫描件体积较大，也可能包含不适合公开发布的内容，因此不要把它们复制到本仓库；`.gitignore` 也会忽略 `sources/originals/`。

每开始整理一份资料，先在 `catalog.csv` 中登记目标章节和状态。建议使用以下状态：

- `unreviewed`：尚未打开；
- `sampled`：只看过少量代表页；
- `transcribing`：正在录入；
- `review`：已录入，等待逐页核对；
- `complete`：已核对完成。

## 每份来源的配套文件

进入 `transcribing` 前，复制以下模板：

- `example-audit-template.md` → `<source-id>-example-audit.md`
- `review-notes-template.md` → `<source-id>-review-notes.md`

逐页审计表必须登记例题的所有小问、多种解法、重复练习、重要旁注与二级结论。review 文档集中记录原稿错误、辨认判断、代理补全推导、补充题与仍需确认的内容。

`make editorial-check` 会检查：

- `transcribing`、`review`、`complete` 来源是否具有审计文件；
- 审计状态和处理说明是否完整；
- `complete` 来源是否仍有 `待收录`、`暂缓` 或 `部分收录`；
- `complete` 来源的 review 文档是否明确写明“未解决：无”。

`audit-exemptions.txt` 只记录实施本规则以前已经完成的旧来源。未来代理不得自行向该文件增加项目；新增例外需要用户明确批准。
