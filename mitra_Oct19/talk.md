---
title: Planning over Simple Boundary Interactions
author: |
    | Alli Nilles 
date: October 4, 2019
aspectratio: 169
...



Background
==========


Collision for robots are usually bad...
---------------------------------------


![](images/crash.gif){width="600px" class="center"}


But they're ok sometimes!
-------------------------


![](images/roomba.gif){width="600px" class="center"}

Especially when Manipulating Objects!
-------------------------------------

<div align="center" style="float;padding:24px">
<iframe width="600" height="400"
src="images/grasping_matt_mason.mp4"
frameborder="0" allowfullscreen>
</iframe></div>

Dr. Matt Mason, CMU

Lessons from Manipulation
-------------------------

**Minimalism**

> - Manipulation doesn't require complex hands, or lots of fingers.
>   - H. Bunis and E. Rimon, “Toward Grasping Against the Environment: Locking Polygonal Objects Against a Wall Using Two-Finger Robot Hands”, IEEE RAL,  2019.

. . .

> - Doesn't even require much or any sensing.
>   - "Orienting Polygonal Parts Without Sensors," K. Goldberg (PhD Thesis), 1993

Lessons from Manipulation
-------------------------

**Compliance**

> - Work *with* geometry: can be passive mechanical compliance, or active compliance in planning/control
>   -  M. Mason, "Compliance and force control for computer controlled manipulators." IEEE Transactions on Systems, Man, and Cybernetics, 1981.

. . .

**Preimage Planning**

> - assume uncertainty, plan by working backwards from goal, possibly incorporating optimization
>   - S. M. LaValle, S. Hutchinson. "An objective-based framework for motion planning under sensing and control uncertainties." The International Journal of Robotics Research (1998).

Minimalism in Mobile Robotics
-----------------------------

![](images/robot_spectrum.jpg){width=750px class="center"}\

Minimalist Contact in Mobile Robotics
-----------------------------

Mapping, pursuit-evasion, localization, navigation

- "Mapping and pursuit-evasion strategies for a simple wall-following robot." M. Katsev, A. Yershova, B. Tovar, R. Ghrist, and S. M. LaValle. IEEE Transactions on Robotics, 27(1):113--128, 2011.
- Jeremy S. Lewis, Jason M. O'Kane. "Planning for provably reliable navigation using an unreliable, nearly sensorless robot." International Journal of Robotics Research, 32(11):1339-1354, September 2013. 

Minimalist Contact in Mobile Robotics
-----------------------------

Collisions as a source of information in robot swarms

-  S. Mayya, P. Pierpaoli, G. Nair, and M. Egerstedt. "Localization in Densely Packed Swarms Using Inter-Robot Collisions as a Sensing Modality." IEEE Transactions on Robotics, Vol. 35, No. 1, pp. 21-34, Feb. 2019. 

. . .

Aggregation and consensus

- "Self-Organised Aggregation without Computation." The International Journal of Robotics Research, 33(8):1145-1161, 2014 pdf


Where is Minimalism Especially Useful?
--------------------------------------


<div class="row">
<div class="column" width="50%">

<div align="center" style="float;padding:24px">
<iframe width="300" height="275"
src="images/gear.mp4"
frameborder="0" allowfullscreen>
</iframe></div>


</div>
<div class="column" width="50%">

![](images/fc.jpg){width=380px class="center"}\

</div>
</div>


My Approach
====

Defining Boundary Interactions
------------------------------


![](images/bounce_examples.jpg){width=700px}

**Bounce rule:** determines action $u \in (0, \pi)$ at boundary.

**Goal:** Plan over strategies of sequential **bounce rules**.



Interesting Baseline Behaviors
------------------------------


Iterating the same rule can cause cycles and trapping regions:

![](images/twoconv.gif){width=300px class="center"}

Combinatorial changes from small perturbations:

![](images/plane.gif){width=300px class="center"}

#### First example inspired by Spagnolie, S. E., Wahl, C., Lukasik, J., & Thiffeault, J. L. (2017). Microorganism billiards. Physica D: Nonlinear Phenomena, 341, 33-44. ####

What About Uncertainty?
-----------------------



![](images/bounce_example_nondet.jpg){width=400px class="center"}

Uncertainty is unavoidable... Plan over **nondeterministic** bounce rules!

. . .

Actions are convex open sets $\tilde{\theta} \subseteq (0,\pi)$

**Safe actions**: *Any* action in $\tilde{\theta}$ from *anywhere* on 
edge $e_i$ will get you to *somewhere* on edge $e_j$.

. . .


**Goal:** along with plan, output a characterization of how much uncertainty the
plan can tolerate (design constraints!)


Geometry Influences Dynamics
----------------------------


Given geometry, we can explicitly analyze state transitions between intervals on
the boundary $\partial P$ under nondeterministic actions $\tilde{\theta}$:

$$f: \partial P \times U \to \partial P$$

. . .

**Observation:** $f$ is easier to analyze when looking at pairs of mutually
visible edges.

. . .

**Observation:** in a single action, the robot can only transition to visible
segments of the boundary.


### Use geometric structure to discretize space of possible trajectories! ###

Our Approach
------------



> 1. Partition boundary using "visibility events"
> 2. Create *safe* edge-to-edge transition graph
> 3. Search for paths and cycles (depending on specification)
> 4. Translate paths to strategies


Visibility Decomposition
------------------------


![](images/new_partial_local_sequence.png){width=600px class="center"}\

. . .

Static obstacles are ok too - same partitioning operation!


Safe Bounce Visibility Graph
----------------------------


![](images/safe_bvg.png){width=750 class="center"}

Algorithm 1 of paper: polygon with $n$ vertices will produce bounce visibility
graph with $O(n^2)$ nodes and $O(n^4)$ edges.


Properties of Safe Bounce Visibility Graph
------------------------------------------


> - Some segments are unreachable under safe actions
> - **Proposition:**  For every polygon $P$ and the resulting partitioned polygon $P'$ under Algorithm
1, each edge $e \in P'$ has at least two safe actions which allow
transitions away from $e$.

![](images/safe_bvg.png){width=500 class="center"}


Example Path Queries
--------------------


Of all paths from A to B (up to bounded length), which allows the most unreliable robot?

. . .

From a given start set, what parts of the polygon boundary are reachable under
uncertainty? How much uncertainty?

. . .

What parts of polygon are reachable under a given set of actions?

. . .

What parts of the polygon are reachable with a constant controller?

. . .

![](images/inserted_two_conv.png){width=700px class="center"}\


Safe Stable Cycles
------------------


A cycle is **stable** when the composition of transition functions is a
*contraction mapping*: two points under the mapping become closer together.

. . .

**Theorem:** For all convex polygons with $n$ edges, there exist constant fixed-angle bouncing
strategies which result in a period $n$ limit cycle regardless of the robot's start position.

. . .

**Proposition:** For all points $s$ on the boundary of all polygons, a constant
fixed-angle controller exists which will cause the robot's trajectory to enter a
stable limit cycle.

![](images/cycles.gif){width=250 style="float:left;padding:12px" class="center"}\ ![](images/bigc.gif){width=350 style="float:right;padding:12px" class="center"}\

Example Cycle Queries
---------------------


> - Is there a safe cycle which visits edge set $E$ (in a particular order, or not)?
>   - Note that safe cycles are "stable," even if they do not have the
>     contraction property for all $s, \theta$.

> - For actions with uncertainty $\pm \epsilon$, is there a reachable cycle which will
    shrink the size of the robot's state estimate below $\delta$?

Summary
-------

We have developed a geometric planner that includes dynamical information and
allows for optimization with respect to uncertainty in position and minimum
required actuation uncertainty.

. . .

So far, all planning is done under nondeterminstic, "worst case" assumptions.

. . .

Not complete, but captures most useful behaviors.

Remaining Goals
===============

Goal 1: Improving the Planner
---------------------

> - Include probabilistic information
>   - Assume we're given probability distribution of actual $\theta$ given a control input
>   - Bayesian updates while searching graph

. . .

> - Exploring different discretizations
> - Exploring sampling-based methods

Goal 2: Improving the Interface
-----------------------

> - This setting lends itself very well to an interactive, visual interface
> - When planning with a complex environment or with multiple robots, creating
the planning specification can be an iterative process
> - Plan: slider for $\tilde{\theta}$, visualization of resulting limit cycles
and their regions of attraction
> - Stretch goal: LTL specifications and plan synthesis
>    - "eventually reach region *A*..."
>    - "stay in region *B* until..."

Goal 3: Extending to Mixtures of Bouncing and Brownian Robots
-----------------------------------------------------


![](images/swimmers.png){width=500px class="center"}\


Extending to Mixtures of Bouncing and Brownian Robots
-----------------------------------------------------

<div align="center" style="float;padding:24px">
<iframe width="600" height="400"
src="images/large_weaselballs.mp4"
frameborder="0" allowfullscreen>
</iframe></div>

Extending to Mixtures of Bouncing and Brownian Robots
-----------------------------------------------------

Research questions:

> - Can introducing robots with stable periodic baseline behavior into a
collection of Brownian agents induce currents? Under what conditions?
> - If the bouncing robots are able to produce a field that the Brownian agents
can respond to (EM field alignment, chemotaxis), can we use single-input global
controls to cluster and/or sort the Brownian agents?
> - What else can we do with distributed control and minimal sensing?



Thank you!
==========

