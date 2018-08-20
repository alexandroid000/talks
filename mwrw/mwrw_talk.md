---
geometry: margin=2cm
title: \includegraphics[height=1cm]{../figs/uclogo_horz_bold.pdf}
        \hfill \includegraphics[height=1.5cm]{../figs/nsf1.jpg} \newline \newline
        Interesting Trajectories of Mobile Robots in Polygons
subtitle: 
author: |
    | Alli Nilles 
    | Israel Becerra
    | Steve LaValle
bibliography: ../paper/refs.bib
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
    -   \newtheorem{proposition}{\bf Proposition}
---


Blind, Bouncing Robots [^1]
----------------------

![A point robot moving in the plane. The top row shows "bounces" at zero degrees
from the normal. The second row shows bounces at 50 degrees clockwise from
normal.](../figs/bounce_examples.jpg)

Bouncing Robots
---------------

\begin{figure}[tp]
\begin{subfigure}{.37\textwidth}
\centering
\includegraphics[width=\linewidth]{../figs/salto-dimensions.jpg}
\end{subfigure}%
\begin{subfigure}{0.37\textwidth}
\includegraphics[width=\linewidth]{../figs/3D_hopper.jpg}
\end{subfigure}
\caption{No, not that kind of bouncing robot... }
\end{figure}

[@fearing]
[@raibert1984experiments]


Research Questions
------------------

-   What kind of tasks are robots with extremely simple control laws capable of
    performing?
-   Will the robot become "trapped" in a certain part of the environment? Or a
    certain motion pattern?

![In this environment, bouncing at the normal, the robot will become trapped
in the area between the purple lines.](../figs/triangle_trap.jpg)

[^1]: [@bounce]


Ok, but why?
---------------

-   platform invariant: just need two primitives
    -   move straight
    -   align wrt wall normal
-   very simple control schemes
-   predictable, reliable motion control in structured spaces
    -   warehouses
    -   monitor environmental conditions

### Ok, but is it physically realizable?

- can implement [^2] on a roomba with bump and IR prox detector
- "rotate to parallel"
- maximum error in angle of $\pm 10^{\circ}$ 


[^2]: [@LewOKa13]

Related Work
------------

-   dynamical billiards: specular bouncing [^3]
-   pinball billiards [^4]
-   aspecular billiards, microorganism billiards [^5]
-   minimal sensing, actuation, computation requirements for point robots in
    polygons: mapping, navigating, localizing, patrolling, pursuit evasion [^6]

[^3]: [@billiards]
[^4]: [@pinball]
[^5]: [@microorganism2017]
[^6]: [@tovar2005gap] [@bilo2012reconstructing] [@OkaLav06] [@disser11]

Can Imagine Variations on this Model
---------------------------

-   **sensors:** gap visibility, detect corners, detect wall normals, pebbles,
    linear and angular odometers, + noise
-   **actuators:** move straight forward, bounce specularly, wall following, rotate in place, + noise
-   can we explore this design space in a more systematic and automated way?
    -   what is the role of formal methods?

RSS Workshop: *Minimality and Trade-offs in Automated Robot Design*
--------------------------

\begin{figure}
\begin{subfigure}{.32\textwidth}
\centering
\includegraphics[width=\linewidth]{../figs/chess-front.pdf}
\end{subfigure}%
\begin{subfigure}{0.32\textwidth}
\includegraphics[width=\linewidth]{../figs/kinect-front.pdf}
\end{subfigure}%
\begin{subfigure}{0.32\textwidth}
\includegraphics[width=\linewidth]{../figs/lavalle-front.pdf}
\end{subfigure}
\end{figure}

-   July 16
-   \url{http://minimality.mit.edu/}
-   Your chance to become immortalized in a card game!


Limit Cycles In Regular Polygons
================================


Question
--------

If we can only move in straight lines and align relative to wall normal:


> Can we guarantee that a robot **patrols** a space on a periodic path?

Can also phrase as:

> What are the conditions on limit cycles in this dynamical system?


Discovery Through Simulation
----------------------------

-   Haskell with *Diagrams* library [@monoids]
-   fixed-angle bouncing, specular bouncing, add noise
-   render diagrams from simulations automatically [^7]

[^7]: \url{https://github.com/alexandroid000/bounce}

\centering

![](../figs/pent_05rad.pdf){width=3cm}\


In Regular Polygons
-------------------

Defines a **discrete dynamical system**

$$x_{n+1} = f(x_n)$$

Given regular polygon, with edge length $l$ and internal angle $\phi$, we can
define the mapping function

$$ b_{\theta} : (0, l) \to (0, l) $$


Sequential-Edge Bouncing
------------------------

$$ b_{\theta} : (0, l) \to (0, l) $$


![](../figs/simple_bounce_def.pdf)\


Sequential-Edge Bouncing
------------------------


$$ b_{\theta} : (0, l) \to (0, l) $$

![](../figs/2nd_simple_bounce_def.pdf)\



Do the geometry and...
----------------------


$$ \frac{b_{\theta}(x)}{\sin (\pi/2-\theta)} = \frac{l-x}{\sin
(\pi-(\pi/2-\theta)-\phi)} $$

\noindent which we can rewrite as
$$ b_{\theta}(x) = \frac{\cos(\theta)}{\cos
(\theta-\phi)}(l-x)  = c(\theta) (l-x) $$

\centering

![](../figs/simple_bounce_def.pdf){width=7cm}\




Fixed Point of Mapping Function $\iff$ Periodic Orbit
-----------------------------------------------------


\columnsbegin

\column{0.5\textwidth}

![](../figs/simple_bounce_def.pdf)\

\column{0.5\textwidth}

![](../figs/pent_05rad.pdf)\

\columnsend

Is There a Unique Fixed Point?
------------------------------

\begin{lemma} \label{Lemma:2}
If $|c(\theta)| < 1$, then $b_{\theta}(x)$ is a contraction
mapping and has a unique fixed point.
\end{lemma}

**Proof:**

We take $(0,l)$ to be a metric space with metric $d(x,y) =
|y-x|$. To be a contraction mapping, $b_{\theta}$ must satisfy

$$ d(b_{\theta}(x), b_{\theta}(y)) \leq k d(x,y) $$

for all $x, y \in (0,l)$ and some nonnegative real number $0 \leq k < 1$
[@Granas2003].

Is There a Unique Fixed Point?
------------------------------

$$ b_{\theta}(x) = c(\theta) (l-x) $$

$$ c(\theta) = \frac{\cos(\theta)}{\cos
(\theta-\phi)} $$

When we check how distances change under the map, we see that
\begin{align*}
d(b_{\theta}(x), b_{\theta}(y)) & = | c(\theta)(l-y) - c(\theta)(l-x)| \\
                               & = | c(\theta) (x-y) | \\
                               & = | c(\theta) | d(x,y).
\end{align*}

Thus if $|c(\theta)| < 1$, then $b_{\theta}$ is a contraction mapping, and by the Banach fixed-point
theorem, it has a unique fixed point.


Iterate to find fixed point
---------------------------

\begin{proposition} \label{Proposition:1}
\begin{equation*}
x_{FP} = 
\begin{cases}
        \frac{l c(\theta)}{1 + c(\theta)} & \phi/2 < \theta
< \pi/2 \\
        \frac{l}{1+c(\theta)} & -\pi/2 < \theta
< -\phi/2
\end{cases}
\end{equation*}

\noindent in which $c(\theta) = cos(\theta) / cos(\theta - \phi)$.
\end{proposition}


**Sketch of Proof:**


Bouncing counterclockwise, $k$ sequential edges:

\begin{align*}
b_{\theta}^k(x) & = c(\theta) (l-c(\theta)(l- \ldots c(\theta)(l-x) \ldots )) \\
                & = \sum_{i=1}^{k} (-l) (-c(\theta))^i + (-c(\theta))^kx 
\end{align*}

Iterate for fixed point
-----------------------


\noindent taking the limit as $k \to \infty$ and shifting the index gives

$$ b_{\theta}^\infty(x) = l + \sum\limits_{i=0}^\infty (-l)(-c(\theta))^i $$

And given same condition 

$$ |c(\theta)| = |\frac{\cos(\theta)}{\cos
(\theta-\phi)}| < 1 $$

this geometric sum converges:

$$ b_{\theta}^\infty(x) = \frac{lc(\theta)}{1+c(\theta)} $$

General Fixed Point and Bounds on $\theta$
------------------------------------------

Solve $|\frac{\cos(\theta)}{\cos
(\theta-\phi)}| < 1$ to get bounds on $\theta$ for guaranteeing periodic
trajectories.


Position of collisions in limit cycle (distance from nearest clockwise vertex):

\begin{equation*}
x_{FP} = 
\begin{cases}
        \frac{l c(\theta)}{1 + c(\theta)} & \phi/2 < \theta
< \pi/2 \\
        \frac{l}{1+c(\theta)} & -\pi/2 < \theta
< -\phi/2
\end{cases}
\end{equation*}

Do the geometry and...
----------------------

We have shown the case for clockwise bounces, on every sequential edge.

We can also imagine going counterclockwise, and skipping edges:

\begin{figure}[tp]
\begin{subfigure}{.37\textwidth}
\centering
\includegraphics[width=\linewidth]{../figs/pent_05rad.pdf}
\end{subfigure}%
\begin{subfigure}{0.37\textwidth}
\includegraphics[width=\linewidth]{../figs/pent_1rad.pdf}
\end{subfigure}
\end{figure}

Mapping function, convergence conditions go through very similarly

Simulation Results
------------------

\begin{figure}[tp]
\begin{subfigure}{.37\textwidth}
\centering
\includegraphics[width=\linewidth]{../figs/pent_05rad.pdf}
\end{subfigure}%
\begin{subfigure}{0.37\textwidth}
\includegraphics[width=\linewidth]{../figs/pent_1rad.pdf}
\end{subfigure}
\begin{subfigure}{0.37\textwidth}
\includegraphics[width=\linewidth]{../figs/pent_165rad.pdf}
\end{subfigure}%
\begin{subfigure}{0.37\textwidth}
\includegraphics[width=\linewidth]{../figs/pent_3rad.pdf}
\end{subfigure}
\end{figure}


Nice Properties
---------------

-   any regular $n$-gon
-   stable orbits are independent of starting position
-   exponential convergence
-   bounds on $\theta$ from $|c(\theta)| < 1$: any angle in this range will make
    similar orbits

\centering

\includegraphics[width=4cm]{../figs/multi_start.pdf}


Other Polygons
--------------

\begin{figure}
\begin{subfigure}{.5\textwidth}
\centering
\includegraphics[width=0.8\linewidth]{../figs/shear.pdf}
\caption{A stable orbit in a sheared pentagon.}
\label{shear}
\end{subfigure}%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.6\linewidth]{../figs/oct.pdf}
\caption{A stable orbit in a nonconvex environment.}
\label{oct}
\end{subfigure}
\caption{Stable orbits also exist in non-regular polygons. }
\label{squish-shear}
\end{figure}


Adding Noise
------------

![200 bounces with uniformly distributed error added to $\theta$, $-0.1$ rad
$\leq \epsilon \leq 0.1$ rad](../figs/rand.pdf)



Open Problems & Future Work
-------------

-   How to characterize non-periodic dynamics?
    -   frequency doubling at transition angles
    -   Lyapunov exponents
-   Analytic extension to non-regular polygons?
-   Smooth environments?
-   Error bounds?

\centering

![](../figs/cool.pdf){width=3.5cm}\



Microorganism Billiards [@microorganism2017]
-----------------------

-   Applications: sorting, driving movement of objects in environment
    [@di2010bacterial]
-   switch between modes; let passive dynamics evolve

\columnsbegin

\column{0.5\textwidth}

![](../figs/micro.jpg){width=5cm}\

\column{0.5\textwidth}

![](../figs/sorting.jpg){width=5cm}\

\columnsend


References
---------

\tiny
