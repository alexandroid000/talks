---
title: 'UBISS 2026: Minimalism in Robotics'
aspectratio: 169
fontsize: 14pt
slide-level: 2
author:
- Alexandra Nilles
- Bașak Sakçak
- Dylan Shell
colortheme: beaver
header-includes:
- \setbeamertemplate{caption}{\raggedright\insertcaption\par}
- \usepackage[T1]{fontenc}
- \usepackage[utf8]{inputenc}
- \usepackage[romanian]{babel}
- \usepackage{graphicx}
- \usepackage{multirow}
- \setbeamerfont{caption}{size=\footnotesize}
---

## Instructors

:::::::::::::: {.columns align=center}
::: {.column width="30%"}
\centering
![\scriptsize \centering Alexandra (Alex) Nilles \hspace{\textwidth} Department of Computer Science \hspace{\textwidth} Western Washington University](figs/Alexandra-Nilles-photo.jpg){height=150px}
:::
::: {.column width="40%"}
\centering
![\scriptsize \centering Bașak Sakçak \hspace{\textwidth} Department of Advanced Computing Sciences \hspace{\textwidth} Maastricht University](figs/Basak-Sakcak-photo.jpg){height=150px}
:::
::: {.column width="30%"}
\centering
![\scriptsize \centering Dylan Shell \hspace{\textwidth} Department of Computer Science \hspace{\textwidth} Texas A&M University](figs/Dylan-Shell-photo.jpg){height=150px}
:::
::::::::::::::


# What is Minimalism?

## An Aesthetic

\centering

![Paintings in the "Korean" series by Jo Baer](figs/Korean.jpg){height=225px}


## A Useful Constraint for Design

:::::::::::::: {.columns align=center}
::: {.column width="50%"}
\centering
![\tiny Source: Eva & Franco Mattes](figs/roomba.jpg){height=225px}
:::
::: {.column width="50%"}
\centering
![\tiny Source: gatsby.bot](figs/humanoid.png){height=225px}
:::
::::::::::::::

## A Lens for Analysis

\centering

![\tiny Source: qubit.guide](figs/complexity.png){height=225px}

# Why Minimalism in Robotics?


## Robot Design is not a Simple Optimization Problem

:::::::::::::: {.columns align=center}
::: {.column width="50%"}
- Many feasible designs
- Resource trade-offs
- Messy regions of infeasibility
:::
::: {.column width="50%"}
![\tiny Source: Universal Robots](figs/grippers.png){height=225px}
:::
::::::::::::::

## Robotics as a Synthetic Science

The design triple to be solved\footnote{"What Is Robotics? Why Do We Need It and How Can We Get It?'' Dan Koditschek 2021}:

> - distinguishing between and relating **tasks**,
> - **architectures** for accomplishing them, and
> - the **environments** within which those accomplishments are sought

## Complexity Reduction

\centering

![\tiny Source: Europa Star Magazine](figs/watch.jpg){height=225px}

## Value of Abstraction

:::::::::::::: {.columns align=center}
::: {.column width="60%"}
> - Modularity and composition
> - Reducing and classifying problems
> - Complexity results
> - Impossibility results
:::
::: {.column width="40%"}
![\tiny Source: MasterHorologer](figs/watch-modules.jpg){height=200px}
:::
::::::::::::::


. . .

\centering

Minimalism helps us make *better abstractions* by intentionally removing *unnecessary details* from robotics problems!

## Example: Gap Navigation Trees

\centering

![](figs/gnts.png){height=225px}


## Back to the Bigger Picture

\begin{table}[h]
\centering
\renewcommand{\arraystretch}{1.5}
\begin{tabular}{ c c|c|c }
&  & \multicolumn{2}{c}{\textbf{Considerations of Use?}} \\
&  & \textbf{No} & \textbf{Yes} \\
\hline
\multirow{2}{*}{\rotatebox{90}{\shortstack{\textbf{Quest for}\\ \textbf{Understanding?}}}}
& \textbf{Yes}
& \parbox[c][5em]{4.2cm}{\centering Basic Research}
& \parbox[c][5em]{4.2cm}{\centering Use-Inspired Basic Research} \\
\cline{2-4}
& \textbf{No}
& \parbox[c][5em]{4.2cm}{\centering (Quadrant of Confusion)}
& \parbox[c][5em]{4.2cm}{\centering Applied Research} \\
\hline
\end{tabular}
\caption{Pasteur's Quadrant classification of research, origin Donald E. Stokes}
\end{table}

## Back to the Bigger Picture

No matter what kind of roboticist you are, minimalism is a useful paradigm for thinking about robot design!

## Thank you!

\centering

![](figs/heart.jpg){height=200px}
