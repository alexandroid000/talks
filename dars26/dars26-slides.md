---
title: A Randomized Bug Algorithm for Swarm Navigation in Dense Obstacle Fields
author:
- Parker Gutierrez
- Alexandra Nilles
institute:
- Department of Computer Science, Western Washington University, Bellingham WA USA
---

# Introduction

## Navigation in Cluttered Environments

> - Many natural and human-built environments have dense obstacle fields
> - Environments range from very ordered to very disordered
> - Motion planning algorithms do not scale well with many obstacles

![](images/forest.png)


# Common Approaches


> - Artificial Potential Fields
> - Bug algorithms (reactive map-free navigation)


![](images/apf.png)

![](images/bug.png)


# The Problem: Traps

![](images/trap.png)

# The Solution: Randomization


Randomization in artificial potential fields

- Paper 1
- Paper 2
- Paper 3
- ...

Randomization in bug algorithms?

- RandomBug
- BugFlood


![](images/randomized.png)


# Literature Gap

> - Randomized bug algorithms in cluttered obstacle fields
> - Idea: we know that regular obstacle arrays cause well-behaved distributions for passive particles.
> - Apply strategy to multiple robots
> - Test how well effect persists if obstacle array is perturbed
> - Test how active control of robots can influence final distribution

![](images/galton.gif)

# Model and Algorithm

# Robot Model

> - Homogenous robots
> - Constant velocity
> - Abstract sensing and obstacle avoidance
> - Cannot distinguish obstacles from other robots

![Our 2D simulator](images/sim_screenshot.png)

# Environment Model

> - Grid world
> - Obstacles and robots of similar size
> - Robots spawn on one side of obstacle field
> - Goal line on other side of obstacle field

# Algorithm

> - Robot senses goal and proceeds along shortest path to goal line: *Goal Heading*
> - If obstacle detected, make random choice about circumnavigation direction
> - Optionally: track or measure angle deviation from starting position: *Start Heading*

# Results


# Simulator Validation


# Effect of Initial Swarm Density


# Effect of Perturbations to Obstacle Field


# Effect of Angular Heading Constraints


# Next Steps


# Next Steps

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
