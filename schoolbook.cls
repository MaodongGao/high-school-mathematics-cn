\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{schoolbook}[2026/07/17 Chinese secondary-school textbook]

\LoadClass[UTF8,fontset=fandol,openany,zihao=-4]{ctexbook}

\RequirePackage[a4paper,inner=28mm,outer=24mm,top=26mm,bottom=28mm,headheight=15pt]{geometry}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{tcolorbox}

\definecolor{BookBlue}{HTML}{245B78}
\definecolor{BookBlueLight}{HTML}{EAF2F6}
\definecolor{BookGold}{HTML}{B07A28}
\definecolor{BookGray}{HTML}{F4F5F6}

\ctexset{
  chapter = {
    format = \Huge\bfseries\color{BookBlue},
    name = {第,章},
    number = \arabic{chapter},
    aftername = \quad,
    beforeskip = 12pt,
    afterskip = 28pt
  },
  section = {
    format = \Large\bfseries\color{BookBlue},
    beforeskip = 18pt,
    afterskip = 8pt
  },
  subsection = {
    format = \large\bfseries,
    beforeskip = 14pt,
    afterskip = 6pt
  }
}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE]{\small\nouppercase{\leftmark}}
\fancyhead[RO]{\small\nouppercase{\rightmark}}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

\newtcolorbox{learninggoals}{
  title=学习目标,
  colback=BookBlueLight,
  colframe=BookBlue,
  fonttitle=\bfseries,
  boxsep=3pt,
  left=5pt,
  right=5pt,
  top=4pt,
  bottom=4pt,
  before skip=6pt,
  after skip=6pt
}

\newtcolorbox{definitionbox}[1][]{
  title={定义\if\relax\detokenize{#1}\relax\else：#1\fi},
  colback=BookBlueLight,
  colframe=BookBlue,
  fonttitle=\bfseries,
  boxsep=3pt,
  left=5pt,
  right=5pt,
  top=4pt,
  bottom=4pt,
  before skip=6pt,
  after skip=6pt
}

\newtcolorbox{lawbox}[1][]{
  title={定理\if\relax\detokenize{#1}\relax\else：#1\fi},
  colback=BookBlueLight,
  colframe=BookBlue,
  fonttitle=\bfseries,
  boxsep=3pt,
  left=5pt,
  right=5pt,
  top=4pt,
  bottom=4pt,
  before skip=6pt,
  after skip=6pt
}

\newtcolorbox{corollarybox}[1][]{
  title={推论\if\relax\detokenize{#1}\relax\else：#1\fi},
  colback=BookGold!7,
  colframe=BookGold,
  fonttitle=\bfseries,
  boxsep=3pt,
  left=5pt,
  right=5pt,
  top=4pt,
  bottom=4pt,
  before skip=6pt,
  after skip=6pt
}

\newtcolorbox{examplebox}[1][]{
  title={例题\if\relax\detokenize{#1}\relax\else：#1\fi},
  colback=BookGray,
  colframe=BookGold,
  fonttitle=\bfseries,
  boxsep=3pt,
  left=5pt,
  right=5pt,
  top=4pt,
  bottom=4pt,
  before skip=6pt,
  after skip=6pt
}

\newtcolorbox{notebox}[1][]{
  title={笔记\if\relax\detokenize{#1}\relax\else：#1\fi},
  colback=white,
  colframe=BookBlue!55,
  fonttitle=\bfseries,
  boxsep=3pt,
  left=5pt,
  right=5pt,
  top=4pt,
  bottom=4pt,
  before skip=6pt,
  after skip=6pt
}

\newtcolorbox{exercisebox}{
  title=练习,
  colback=white,
  colframe=BookGold,
  fonttitle=\bfseries,
  boxsep=3pt,
  left=5pt,
  right=5pt,
  top=4pt,
  bottom=4pt,
  before skip=6pt,
  after skip=6pt
}
