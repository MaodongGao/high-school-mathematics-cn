# 原始资料管理

原始资料位于仓库外：

```text
/Users/maodong/Documents/高中课程笔记
```

该目录目前包含数学、物理、化学、生物的扫描 PDF，以及一个物理压缩包。仓库现阶段只处理数学和物理。扫描件体积较大，也可能包含不适合公开发布的内容，因此不要把它们复制到本仓库；`.gitignore` 也会忽略 `sources/originals/`。

每开始整理一份资料，先在 `catalog.csv` 中登记目标章节和状态。建议使用以下状态：

- `unreviewed`：尚未打开；
- `sampled`：只看过少量代表页；
- `transcribing`：正在录入；
- `review`：已录入，等待逐页核对；
- `complete`：已核对完成。
