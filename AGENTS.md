# Repository instructions for agents

These rules apply to every file in this repository. Read `README.md`,
`docs/writing-guide.md`, and the relevant row in `sources/catalog.csv` before
editing textbook content.

## Editorial objective

- Preserve the source notes' mathematical content, representative examples,
  and learning rhythm. Do not replace a source solution merely because another
  solution is shorter.
- "High information density" is an editorial goal, not textbook prose. It
  means removing repetition while preserving definitions, reasoning links,
  conditions, diagrams, and useful long solutions.
- Never use marketing or speed-oriented labels in the book such as
  `高信息密度`, `高密度`, `最短解`, `速查`, `最短判定链`, or `最快解`.
- Prefer a solution with explanatory or transferable mathematical structure
  over a shorter mechanical computation.

## Source fidelity and example labels

- Inspect the relevant source PDF pages before calling an example source-based.
  Source files stay outside the repository and must not be copied here.
- Every `examplebox` title must begin with exactly one provenance label:
  `原稿例：`, `原稿型：`, `原稿方法：`, or `补充：`.
- Any problem introduced by an agent must be labeled `补充：`. Never present an
  added or substantially invented problem as an original-note problem.
- Added examples must match the notes' level: representative, nontrivial, and
  useful for method transfer. Do not add routine filler exercises just to
  increase the example count.
- Preserve insightful source examples even when their solutions are long.

## Exposition and ordering

- Dense writing must remain understandable on first reading. Do not jump from
  a definition directly to an unexplained formula.
- Arrange material by dependency and learning rhythm. A corollary may precede
  an example when it is needed to solve it; a summary corollary derived from an
  example should follow that example. Do not reveal a complete result in a
  corollary and then repeat its derivation as if it were new.
- Use `definitionbox` for definitions, `lawbox` for central theorems,
  `corollarybox` for important second-level conclusions, and `examplebox` for
  worked problems. Important second-level conclusions should not be buried in
  ordinary prose.
- Keep the three semantic colors distinct: theorem blue, corollary green, and
  example gold. Do not make `corollarybox` visually resemble `examplebox`.
- Use natural mathematical labels such as `解`, `证明`, `方法启示`,
  `关键转化`, and `辨析`; do not turn editorial goals into headings.

## Geometry diagrams

- Geometry is visual. Every worked geometry example must include a relevant
  TikZ diagram in its own box.
- Add diagrams to spatial corollaries whenever the conclusion is hard to
  reconstruct quickly from text alone. Diagrams must show the actual auxiliary
  lines, projections, sections, or angles used in the reasoning.
- A decorative solid is not enough: highlighted lines and labels must agree
  with the written solution.

## Required verification

1. Run `make editorial-check` before compiling.
2. Run `PATH=/Library/TeX/texbin:$PATH make pdf`.
3. Inspect `output/aux/main.log` for errors, missing glyphs, undefined control
   sequences, and overfull boxes.
4. Render the changed PDF pages to PNG under `tmp/pdfs/` and inspect them for
   clipping, overlaps, bad page breaks, and legibility.
5. Remove temporary renders after inspection. Keep the final PDF at
   `output/pdf/main.pdf`.

Do not claim a chapter is complete merely because it compiles. Completion
requires source fidelity, coherent ordering, representative examples, diagrams,
and visual PDF review.
