# Repository instructions for agents

These rules apply to every file in this repository. Read `README.md`,
`docs/writing-guide.md`, `docs/chapter-acceptance-standard.md`, and the relevant
row in `sources/catalog.csv` before editing textbook content.

## Autonomous chapter workflow

When asked to develop a chapter, continue through the full workflow without
waiting for the user after every pass. Make reasonable, reversible editorial
decisions and record uncertainty instead of silently omitting material. Ask the
user only when the source is inaccessible or a genuine ambiguity would change
the mathematics and no other useful in-scope work remains.

Use these passes in order:

1. **Inventory before drafting:** inspect every source page in scope and create
   the page-by-page audit from `sources/example-audit-template.md`. Register
   every example, sub-question, repeated exercise, method variant, diagram, and
   important margin conclusion before calling the draft comprehensive.
2. **Faithful draft:** preserve the source's learning rhythm, representative
   problems, long insightful solutions, and multiple methods. Do not optimize
   for shortness.
3. **Structure pass:** order ideas by dependency; promote important secondary
   results to `corollarybox`; add explanatory bridges; label all provenance.
4. **Visual pass:** for geometry, add solution-specific diagrams to every
   worked example and visually explanatory diagrams to hard corollaries.
5. **Mathematical audit:** independently recompute initial values, equality and
   strictness cases, index ranges, extrema, recurrence constants, inequality
   directions, and all final answers. Record source errors and repairs in the
   review-notes file.
6. **Coverage reconciliation:** revisit the source page by page and reconcile
   every audit row against the actual TeX. A repeated source item may be merged,
   but it still needs its own audit row and a concrete explanation.
7. **Build and PDF audit:** run the required checks below, inspect the rendered
   PDF, and proofread extracted PDF text for leaked LaTeX command names.
8. **Acceptance:** only after all gates pass may `sources/catalog.csv` be set to
   `complete`. Otherwise leave it at `review` and keep working on every
   non-blocked item.

Do not stop after a merely compiling first draft. For a long chapter, iterate
over page ranges until the entire inventory is reconciled, then run a final
whole-chapter pass.

Use the accepted files for calibration:

- `subjects/mathematics/chapters/02-sequences.tex` is the baseline for content
  density, complete recovery of examples and sub-questions, preservation of
  multiple useful methods, mathematical `辨析`, and explanatory `方法启示`;
- `sources/math-11-example-audit.md` and `sources/math-11-review-notes.md` are
  the baseline for coverage accounting and review documentation;
- `subjects/mathematics/chapters/01-space-geometry.tex` is the baseline for
  solution-specific geometry diagrams.

For a multi-chapter request, maintain separate audit and review files for every
source. Continue working on other chapters when one item is ambiguous, collect
the genuine questions in the relevant review notes, and present them together
at handoff instead of repeatedly interrupting the user.

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
- Before marking a source chapter complete, create or update a page-by-page
  example inventory under `sources/`. Every source example must be marked as
  included, merged, pending, or intentionally omitted. An omission must include
  a concrete reason; never silently drop an example.
- Prefer including source examples. Routine examples may be merged into one
  worked box, but the inventory must still list each original item. Hard,
  representative, or method-rich examples require a strong reason to omit.
- If the source itself is ambiguous or internally inconsistent, preserve the
  ambiguity in an explicit `辨析` or `\sourcetodo`; do not silently repair the
  source while still labeling the result as an original example.
- Every `examplebox` title must begin with exactly one provenance label:
  `原稿例：`, `原稿型：`, `原稿方法：`, or `补充：`.
- Any problem introduced by an agent must be labeled `补充：`. Never present an
  added or substantially invented problem as an original-note problem.
- Added examples must match the notes' level: representative, nontrivial, and
  useful for method transfer. Do not add routine filler exercises just to
  increase the example count.
- Preserve insightful source examples even when their solutions are long.
- Treat every sub-question as content. If a three-part source problem is kept,
  all three parts must be included or separately explained in the audit.
- Multiple source solutions are part of the content when they expose different
  reusable structures. Do not collapse them into one method merely because the
  answers agree.
- Use `sources/review-notes-template.md` to document ambiguous handwriting,
  source mistakes, agent-completed derivations, corrected endpoints, and added
  problems. The chapter must remain mathematically correct even when the source
  is not.

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

1. Run `make editorial-check`; this includes source-audit consistency checks.
2. Run `PATH=/Library/TeX/texbin:$PATH make verify`. This compiles the book and
   rejects log errors, overfull boxes, missing glyphs, and leaked LaTeX command
   names in extracted PDF text.
3. Run `make render-review` (or render the changed page range manually), then
   inspect both a contact sheet and full-size changed pages for clipping,
   overlaps, bad breaks, tiny labels, awkward box continuation, and legibility.
4. For a completed chapter, visually inspect the entire chapter, not only the
   last edited pages. Verify headers, footers, page numbering, colors, diagrams,
   formulas, and section transitions.
5. Remove temporary renders after inspection. Keep the final PDF at
   `output/pdf/main.pdf`.
6. Run `git diff --check` and confirm the worktree contains only intended files.

Do not claim a chapter is complete merely because it compiles. Completion
requires source fidelity, coherent ordering, representative examples, diagrams,
independent mathematical checking, visual PDF review, a review-notes record,
and a reconciled example inventory with no unexplained gaps. Use the hard gates
in `docs/chapter-acceptance-standard.md`; report any intentional merge or
omission explicitly in the final handoff.
