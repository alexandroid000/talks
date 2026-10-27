---
title: A Randomized Bug Algorithm for Swarm Navigation in Dense Obstacle Fields
author:
- Parker Gutierrez
- Dr. Alexandra Nilles
institute:
- Department of Computer Science, Western Washington University, Bellingham, Washington USA
---

# Introduction


## Navigation in Cluttered Environments

:::: {.columns}

::: {.column}

- Many natural and human-built environments have dense obstacle fields

- Environments range from disordered to ordered

:::
::: {.column}

![](images/forest.png)

![](images/orchard.jpg)

:::
::::

## Problem: Scaling Motion Planning

:::: {.columns}

::: {.column}

Two curses of dimensionality:

1. Number of robots
2. Number of obstacles (number of topologically distinct paths)

:::
::: {.column}

![Source: Richard F. Obrecht](images/plinko-paths.jpg)

:::
::::

## Common Approaches

:::: {.columns}

::: {.column}

- Artificial Potential Fields (APFs)
  - uses map

- Bug algorithms
  - no map

:::
::: {.column}

![Source: Rymsha Siddiqui](images/apf.png){width=500px}

![Source: Automatic Addison](images/bug.jpg){width=500px}

:::
::::

## Issues for Distributed Robot Systems

:::: {.columns}

::: {.column}

APFs: more obstacles = more complex field, more possibilities for local minima

Bug algorithms: exponential runtime with trapping obstacles

:::
::: {.column}

![](images/bugtrap.png){width=500px}

:::
::::

## The Solution: Randomization

Randomization in artificial potential fields

- J. Barraquand and J.-C. Latombe. A Monte-Carlo algorithm for path planning with many degrees of freedom. ICRA 1990.
- N. Malone, H.T. Chiang, K. Lesser, M. Oishi, L. Tapia. Hybrid dynamic moving obstacle avoidance using a stochastic reachable set-based potential field. IEEE Transactions on Robotics, 2017.
- Many more...

. . .

Randomization in bug algorithms?

- QL Xu. Randombug: Novel path planning algorithm in unknown environment. Open Electrical & Electronic Engineering Journal, 2014.


## Literature Gap: Randomized Bug Algorithms

:::: {.columns}

::: {.column}

- Idea: we know that regular obstacle arrays cause well-behaved distributions for passive particles

- Apply this to robots moving through dense obstacle fields

- Research questions: what if obstacles are not regularly arranged? How can active nature of robots be applied?

:::
::: {.column}

![](images/plinko.jpg){height=400px}

:::
::::

\centering

![Source: Gregory Gunderson](images/binom.png){height=400px fig-align="center"}


# Model and Algorithm


## Model


:::: {.columns}

::: {.column}

### Robot Model

- Homogenous robots
- Constant velocity
- Abstract sensing and obstacle avoidance
- Cannot distinguish obstacles from other robots


### Environment Model

- Grid world
- Obstacles and robots of similar size
- Robots spawn on one side of obstacle field
- Goal line on other side of obstacle field

:::
::: {.column}

![](images/simulator.png){width=700px}

:::
::::

## Algorithm

:::: {.columns}

::: {.column}

- Robot senses goal and proceeds directly toward goal line (*Goal Heading*)
- If obstacle detected, make random choice about circumnavigation direction
- Track or measure angle from starting position (*Start Heading*)
- Can set constraint on relative angle between start and goal headings for deterministic "inward" turns

:::
::: {.column}

![](images/simulator.png){width=700px}

:::
::::

# Results


## Simulator Validation


![Robot Distribution in Regular Obstacle Grid](images/Validation_Ridge.png){width=1300px fig-align="center"}



## Effect of Initial Swarm Density


Lower-density swarms experience *less* relative spread.

<div style="display: flex; justify-content: center; gap: 40px;">
<div style="flex: 1; max-width: 45%;">
<video width="700px" controls><source src="vids/highDregular.mp4" type="video/mp4"></video>
</div>
<div style="flex: 1; max-width: 45%;">
<video width="700px" controls><source src="vids/lowDregular.mp4" type="video/mp4"></video>
</div>
</div>




## Effect of Random Perturbations to Obstacle Field


Perturbed obstacle fields lead to less spread. Degree of obstacle perturbation (±1, 2, or 3 units) has no significant effect on the final distribution.


<div style="display: flex; justify-content: center; gap: 40px;">
<div style="flex: 1; max-width: 45%;">
<video width="700px" controls><source src="vids/highDperturbed.mp4" type="video/mp4"></video>
</div>
<div style="flex: 1; max-width: 45%;">
<video width="700px" controls><source src="vids/lowDperturbed.mp4" type="video/mp4"></video>
</div>
</div>


## Comparison with Optimal Strategy


![Comparison with N=30 robots.](images/table2.png){width=1300px fig-align="center"}


## Effect of Angular Heading Constraints


![](images/table3.png){width=700px fig-align="center"}


## Next Steps

> - Predictive models for final distribution
> - Control laws using angular heading constraints and/or beacon robots
>   - Regrouping events
> - More realistic obstacle avoidance and velocity control

. . .

- Sensing position of other robots
- Integration with swarm algorithms

# Thank you! Questions?

Minimalist Resilient Robots for the Planet Lab: [https://mrrp-lab.github.io/](https://mrrp-lab.github.io/)

![](images/map_w_bham.png){width=700px fig-align="center"}
