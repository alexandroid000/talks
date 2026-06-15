---
title: A (Scalable) Minimalist Algorithm for Shape-Changing Robots in Dense Swarms
author:
- Alexandra Nilles, Henry Boekhoff <br> Department of Computer Science, Western Washington University
- Heather Jin Hee Kim, Julian Prieto <br> Sibley School of Mechanical and Aerospace Engineering, Cornell University
- Elizabeth Garner, Kirstin Petersen <br> Department of Electrical and Computer Engineering, Cornell University
header-includes:
- \usepackage{amsmath}
- \usepackage{tikz}
- \usepackage{ifthen}
- \usetikzlibrary {arrows.meta}
- \usetikzlibrary{positioning}
---


# Resource-Constrained Shape-Changing Robots {class="center"}


## Motivation: Shape-Changing Micro-Robots

:::::::::::::: {.columns align=center}
::: {.column width="60%"}

> - Mechanisms include magnetism, bistable mechanisms, electrofluidics, many others
> - Often, uniform global controls
> - Often, strong influence from Brownian dynamics
> - Why change shape?
>    - Drug delivery
>    - Collective dynamics (align, aggregate)

:::
::: {.column width="40%"}

![Fusco S, Huang HW, Peyer KE, Peters C, Haberli M, Ulbers A, Spyrogianni A, Pellicer E, Sort J, Pratsinis SE, Nelson BJ. Shape-switching microrobots for medical applications: The influence of shape in drug delivery and locomotion. ACS applied materials & interfaces, 2015.](images/microrobot.gif){width=100% class="center"}

:::
::::::::::::::


## Motivation: Quorum Sensing without Deliberation

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

> - Externalize computation of density estimation to random walk
> - Strong evidence of effective strategies in biological systems
> - Minimizing onboard resources: no pheromones or explicit communication

:::
::: {.column width="50%"}

![Pavlic TP, Hanson J, Valentini G, Walker SI, Pratt SC. Quorum sensing without deliberation: biological inspiration for externalizing computation to physical spaces in multi-robot systems. Swarm Intelligence, 2021.](images/qs_random.png){width=90%}

:::
::::::::::::::

## Motivation: Deliberate Collisions


:::::::::::::: {.columns align=center}
::: {.column width="50%"}

> - Collisions for efficient redirection
> - Localization in dense swarms
> - Task allocation
> - Measuring aggregation: Motility induced phase separation (MIPS)

:::
::: {.column width="50%"}

![Mayya S, Notomista G, Shell D, Hutchinson S, Egerstedt M. Non-uniform robot densities in vibration driven swarms using phase separation theory. In2019 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS). <br> Mayya S, Pierpaoli P, Nair G, Egerstedt M. Localization in densely packed swarms using interrobot collisions as a sensing modality. IEEE Transactions on Robotics, 2018.](images/sidd-collisions.png){width=100% class="center"}

:::
::::::::::::::


# Our Scenario {class="center"}

## Assumptions

> - "Wild body" motion: no explicit motion model
> - Agents will eventually explore everywhere (2D bounded environment)
> - Robots have two possible shapes, can change shape individually

![Our 2D simulator](images/sim_screenshot.png){width=40% class="center"}

## Research Questions

<p style="margin-top:3cm;">
Can we control the proportion of the collective in each shape using local decisionmaking?
</p>

. . .

<p style="margin-top:3cm;">
What effect does shape have on collective dynamics?
</p>

## Proposed Algorithm

> - Intuition: collisions "reward" robots and increase likelihood of shape change
> - Collision happens within $\epsilon$: increment counter
> - Elapsed time without collision exceeds $\epsilon$: decrement counter
> - Change shape when counter reaches $m$ (fully rewarded)
> - Change back when counter reaches $0$ (fully sedate)

## Proposed State Machine

![](images/state-machine.png){width=70% class="center"}

## Resources Required

> - Collision, proximity, or contact sensor(s)
    - Edge trigger to classify contact as *new*
> - One integer counter
> - One timer
> - Two binary state variables

# Analysis {class="center"}

## Population Dynamics

\begin{align*}
\dot{R} & = S \lambda - R/\tau \\
\dot{S} & = R/\tau - S \lambda
\end{align*}

> - $S$, $R$ represent population fractions ($S + R = 1$)
> - $\lambda$ is transition rate from shape 1 to shape 2
> - $\tau$ is related to transition rate back to shape 1


## Probability of Collision

:::::::::::::: {.columns align=center}
::: {.column width="50%"}

> - To determine transition rate, need to understand probability of collision
> - Depends on local density, robot size, robot speed
> - Well-mixed (AKA mean field) assumption allows use of Poisson point process

:::
::: {.column width="50%"}

![Mayya S, Pierpaoli P, Nair G, Egerstedt M. Localization in densely packed swarms using interrobot collisions as a sensing modality. IEEE Transactions on Robotics. 2018 Oct 8;35(1):21-34.](images/sidd-point-process.png){width=100% class="center"}

:::
::::::::::::::

## Density Predictions

Probability of collisions gives:

> 1. $\lambda$: probability of $m$ sequential collisions with less than $\epsilon$ elapsed time between them
> 2. $\tau$: probability of no collisions within $m\epsilon$ time

# Results {class="center"}

## Low Sensitivity to Timer Threshold $\epsilon$ in Dense Settings

![](images/fracs_thresh_plot.png){width=80% class="center"}

## Effect of Counter Threshold $m$

![](images/timer_comparison.png){width=80% class="center"}

## High Sensitivity to Density with Fixed $m$ and $\epsilon$

![Distributed adaptation to density changes!](images/fracs_bots_plot.png){width=80% class="center"}

## Demonstration

![](images/funnel_demo.mp4){width=90% class="center"}


# Dirty Laundry and Next Steps {class="center"}


## Dirty Laundry

> - MIPS normalization and discrete computation
> - Radius assumptions
> - Hardware experiments inconclusive
>    - Weaselball fail
>    - Micro-robot physics vary widely

![](images/laundry.png){width=40% class="center"}


## Next Steps

> - Developing theory of robot "cross-section"
> - Randomized navigation of dense swarms in dense obstacle fields
> - Hardware validation and robophysics (publishing our shape-change mechanism)

. . .

![](images/wb-shapeshift.png){width=80% class="center"}

## Contributions

> - Open-source simulator and hardware
> - Useful approach for distributed adaptation to density change, supported by theory
> - Hints at fun problem structure to improve theory

## Thank you! Questions?

New lab website: [https://mrrp.cs.wwu.edu](https://mrrp.cs.wwu.edu)
