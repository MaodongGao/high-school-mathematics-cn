# 写作与录入约定

## 一次整理的最小单元

1. 从 `sources/catalog.csv` 选择或登记一份原始 PDF。
2. 只查看一小段连续页面，先判断主题边界。
3. 将内容放入对应章节；主题不匹配时再新建章节。
4. 用 `\sourcetodo{...}` 记录尚未核对的页码或疑问。
5. 编译并检查公式、图、分页与交叉引用。
6. 逐页核对完成后更新来源状态。

## 文件命名

- 章节使用两位序号和英文短名，例如 `02-functions.tex`。
- 图片使用小写英文和连字符，例如 `projectile-trajectory.pdf`。
- `\label` 加学科语义前缀，例如 `eq:physics-projectile-x`。

## 内容结构

- 每章以学习目标开始。
- 首次出现的概念放入 `definitionbox`。
- 完整解题过程放入 `examplebox`。
- 原稿旁注或待补内容放入 `notebox` 或 `\sourcetodo`。
- 每个主要知识点后安排少量 `exercisebox` 练习。

## 公式与单位

- 多行推导使用 `align`，不要用连续的手工换行。
- 向量使用 `\vec{v}`，微分使用 `\dd x`。
- 物理量与单位使用 `siunitx`，例如 `\qty{9.8}{\metre\per\second\squared}`。
- 对公式、图和表使用 `\label` 与 `\cref`，避免手写编号。

## 图形

优先用 TikZ/PGFPlots 重画几何图、受力图与函数图。扫描裁图只作为过渡，并在同一章节留下替换说明。
