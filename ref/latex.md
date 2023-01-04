---
title: Latex
layout: reference
---

1. The vscode plugin requires this: `sudo tlmgr install latexmk`
2. Heres a sample template: 

```latex
\documentclass[11pt]{article}
\usepackage{geometry}
\geometry{letterpaper}
%\geometry{landscape}
%\usepackage[parfill]{parskip}
\usepackage{graphicx}
\usepackage{amssymb}
\usepackage{epstopdf}
% \DeclareGraphicsRule{.tif}{pnf}{.png} %{’convert #1 ’dirname #1’/’basename #1 .tif’ .png}

\title{Brief Article}
\author{The Author}
%\date{}

\begin{document}
\maketitle
%\section{}
%\subsection{}

\end{document}
```
