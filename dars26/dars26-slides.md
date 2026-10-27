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

- Environments range from very dis-ordered to very ordered

- Motion planning algorithms do not scale well with many obstacles

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

- Artificial Potential Fields (APFs): use map

- Bug algorithms: no map

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

- Paper 1
- Paper 2
- Paper 3
- ...

Randomization in bug algorithms?

- RandomBug
- BugFlood

![](images/randomized.png)


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

![Source: Gregory Gunderson](images/binom.png){height=400px class="center"}


## Contributions

> - Apply strategy to multiple robots for distributed navigation in dense obstacle fields
> - Test how well effect persists if obstacle array is perturbed
> - Test how active control of robots can influence final distribution


# Model and Algorithm


## Robot Model

:::: {.columns}

::: {.column}

- Homogenous robots
- Constant velocity
- Abstract sensing and obstacle avoidance
- Cannot distinguish obstacles from other robots

:::
::: {.column}

![Our 2D simulator](images/simulator.png){width=400px}

:::
::::


## Environment Model

:::: {.columns}

::: {.column}

- Grid world
- Obstacles and robots of similar size
- Robots spawn on one side of obstacle field
- Goal line on other side of obstacle field

:::
::: {.column}

![Our 2D simulator](images/simulator.png){width=400px}

:::
::::


## Algorithm

:::: {.columns}

::: {.column}

- Robot senses goal and proceeds directly toward goal line: *Goal Heading*
- If obstacle detected, make random choice about circumnavigation direction
- Optionally: track or measure angle deviation from starting position: *Start Heading*

:::
::: {.column}

![Our 2D simulator](images/simulator.png){width=400px}

:::
::::


# Results


## Simulator Validation


![Robot Distribution in Regular Obstacle Grid](images/Validation_Ridge.png)


## Effect of Initial Swarm Density



## Effect of Perturbations to Obstacle Field


## Effect of Angular Heading Constraints


## Next Steps


> - Predictive models for final distribution
> - Control laws using angular heading constraints and a "leader" robot
>   - Regrouping events

. . .

> - Relaxation of model assumptions
>   - Distinguishable robots and integration with swarm algorithms
>   - Constant velocity (more realistic obstacle avoidance)

. . .

> - Gap-based model for integration with LiDAR sensing systems

# Thank you! Questions?

MRRP Lab
