---
geometry: margin=2cm
title: \includegraphics[height=1cm]{../figures/uclogo_horz_bold.pdf}
        \hfill \includegraphics[height=1.5cm]{../figures/nsf1.jpg} \newline \newline
       Reachability Analysis of Mobile Robot Trajectories in Polygons with
       SpaceEx
subtitle: 
author: Alli Nilles 
bibliography: /home/alli/backup_19_Nov_2017/common/refs.bib
date: \today
header-includes:
    -   \usetheme[block=fill]{metropolis}
    -   \usepackage{epstopdf}
    -   \usepackage[font=small]{subcaption}
    -   \usepackage{multimedia}
    -   \usepackage{amsmath}
    -   \usepackage{amssymb}
    -   \usepackage[font=small]{subcaption}
    -   \usepackage{graphicx}
    -   \usepackage{hyperref}
    -   \usepackage{xfrac}
    -   \usepackage{jeffe}
    -   \newtheorem{proposition}{\bf Proposition}
---


Blind, Bouncing Robots [^1]
----------------------

Model the robot as a point moving **in straight lines** in the plane, "bouncing" off the boundary
at a **fixed angle** $\theta$ from the normal:

![A point robot moving in the plane. The top row shows bounces at zero degrees
from the normal. The second row shows bounces at 50 degrees clockwise from
normal.](../figures/bounce_examples.pdf)

Research Questions
------------------

-   What kind of tasks are robots with extremely simple control laws capable of
    performing?
-   Will the robot become "trapped" in a certain part of the environment? Or a
    certain motion pattern?

![In this environment, bouncing at the normal, the robot will become trapped
in the area between the purple lines.](../figures/triangle_trap.jpg)

[^1]: [@bounce]


Research Questions
------------------

These questions are related:

- if robot will get stuck in small part of state space under a constant control
  input, can use this for localization
- if robot will get stuck in a "big" part of state space, can use this for
  monitoring / coverage tasks


Implementation
--------------

> - Assume we know environment exactly
> - Can implement on a roomba with bump sensor and IR prox detector [^2]
> - "Collisions" can be virtual - for example, robot stops when it is collinear
    with two landmarks, and rotates until one landmark is at a certain heading
> - Also useful model of very small "robots" or microorganisms [^5], or robots in
    low-bandwith environments

[^2]: [@LewOKa13], IJRR
[^3]: [@billiards]
[^4]: [@pinball]
[^5]: [@microorganism2017]
[^6]: [@tovar2005gap] [@bilo2012reconstructing] [@OkaLav06] [@disser11]


Applications
------------

\centering
![](../figures/roomba.jpg)\


Discovery Through Simulation
----------------------------

-   Haskell with *Diagrams* library [@monoids]
-   fixed-angle bouncing, specular bouncing, add noise
-   render diagrams from simulations automatically [^7]

[^7]: \url{https://github.com/alexandroid000/bounce}

\centering

![](../figures/pent_05rad.pdf){width=3cm}\


Simulation Results
------------------

\begin{figure}[tp]
\begin{subfigure}{.37\textwidth}
\centering
\includegraphics[width=\linewidth]{../figures/pent_05rad.pdf}
\end{subfigure}%
\begin{subfigure}{0.37\textwidth}
\includegraphics[width=\linewidth]{../figures/pent_1rad.pdf}
\end{subfigure}
\begin{subfigure}{0.37\textwidth}
\includegraphics[width=\linewidth]{../figures/pent_165rad.pdf}
\end{subfigure}%
\begin{subfigure}{0.37\textwidth}
\includegraphics[width=\linewidth]{../figures/pent_3rad.pdf}
\end{subfigure}
\end{figure}



Other Polygons
--------------

\begin{figure}
\begin{subfigure}{.5\textwidth}
\centering
\includegraphics[width=0.8\linewidth]{../figures/shear.pdf}
\caption{A stable orbit in a sheared pentagon.}
\label{shear}
\end{subfigure}%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.6\linewidth]{../figures/oct.pdf}
\caption{A stable orbit in a nonconvex environment.}
\label{oct}
\end{subfigure}
\caption{Stable orbits also exist in non-regular polygons. }
\label{squish-shear}
\end{figure}


What We Want
------------

> - check if cycle exists where theory says it does for convex polygons
> - do experiments with nonconvex polygons to develop theory there
> - minimize simulation / discretization / floating point artifacts
> - extend to multiple robots and nondeterministic bouncing

. . .

Tools from this class especially help with the last two


Reachability Modelling Approach
-----------------------------


** fig of automata **


Modelling Transitions
-----------------


** fig of edge bounce **


$\theta_{out} = \theta_{edge} + \theta_c$

$v_x := \cos(\theta_{out})$
$v_y := \sin(\theta_{out})$



Results
-------

```haskell
loc1 = Location 1 "interior" 
        "-500.0 &lt;= x &amp;&amp; 
         x &lt;= 0.0 &amp;&amp; 
         0 &lt;= y &amp;&amp; 
         y &lt;= 500" 
        "x'==vx &amp; y'==vy"

square_ha :: HA
square_ha = HA   { name = "test"
               , params = mkParams $ mkPoly sq
               , locations = [loc1]
               , transitions = mkTs (mkPoly sq) (0 @@ rad)
               }
```


Results
-------

![](../figures/xml.jpg){width=13cm}\



Limitations / Future Work
-----------

> - `asap` transitions not working for some reason: must specify invariant in
  location to keep robot from "escaping" the polygon
> - Also not sure how to specify nonconvex invariants
> - Both supposed to be included in PHAVer on SpaceEx [@minopoli2014non]

. . .

> - Naive code generation: chunking strings together (only a few fields in xml file we
    need to change)
> - Next step is to use Haskell XML Toolbox (HXT) to make this less janky




References
---------

\tiny
