% A Visibility-Based Approach to Computing Nondeterministic Bouncing Strategies
% Alli Nilles, Samara Ren, Israel Becerra, Steven M. LaValle
% December 9, 2018

Minimalist Mobile Robots
============

![](images/robot_spectrum.jpg){width=750px class="center"}\


A Different Motion Model
=============

Instead of planning over $(x,y)$ waypoints, what if we tell the robot, "go forward 
until you can't any more?"

. . .

Compliance: interactions with environment can reduce sensing/estimation requirements!

. . .

![](images/bounce_examples.jpg){width=700px}

**Bounce rule:** determines action $u \in (0, \pi)$ at boundary.

**Goal:** Plan over strategies of sequential **bounce rules**.


Interesting Baseline Behaviors
=====

Iterating the same rule can cause cycles and trapping regions:

![](images/twoconv.gif){width=300px class="center"}

Combinatorial changes from small perturbations:

![](images/plane.gif){width=300px class="center"}


#### First example inspired by Spagnolie, S. E., Wahl, C., Lukasik, J., & Thiffeault, J. L. (2017). Microorganism billiards. Physica D: Nonlinear Phenomena, 341, 33-44. ####


What About Uncertainty?
=======================


![](images/bounce_example_nondet.jpg){width=400px class="center"}

Uncertainty is unavoidable... Plan over **nondeterministic** bounce rules!

. . .

Actions are convex open sets $\tilde{\theta} \subseteq (0,\pi)$

. . .


**Goal:** along with plan, output a characterization of how much uncertainty the
plan can tolerate (design constraints!)


Geometry Influences Dynamics
=====

Actions cause state transitions between intervals on the boundary
$\partial P$ under a transition function

$f: \partial P \times U \to \partial P$

which is defined by environment geometry.

. . .

**Observation:** $f$ has nicer structure when looking only between pairs of edges

**Observation:** in a single action, the robot can only transition to visible
segments of the boundary

### How can we use geometric structure to reason about all possible trajectories? ###

Our Approach
============


> 1. partition boundary using "visibility events"
> 2. create *safe* edge-to-edge transition graph
> 3. search for paths and cycles (depending on specification)
> 4. translate paths to strategies


Visibility Decomposition
====

![](images/new_partial_local_sequence.png){width=600px class="center"}\

. . .

Static obstacles are ok too - same partitioning operation!


Safe Actions
============


A **safe action** set from edge $e_i$ to edge $e_j$ in a polygon is

- a convex interval of actions $\tilde{\theta} \subseteq (0, \pi)$ such that
- $f(s,u) \in e_j$ for any $s \in e_i$ and $u \in \tilde{\theta}$.

. . .

**Any** action from **anywhere** on edge $e_i$ will get you to *somewhere* on
edge $e_j$.

Safe Bounce Visibility Graph
============================

![](images/safe_bvg.png){width=750 class="center"}

Algorithm 1 of paper: polygon with $n$ vertices will produce bounce visibility
graph with $O(n^2)$ nodes and $O(n^4)$ edges.


Properties of Safe Bounce Visibility Graph
=============================

> - some segments are unreachable under safe actions
> - **Proposition:**  For every polygon $P$ and the resulting partitioned polygon $P'$ under Algorithm
1, each edge $e \in P'$ has at least two safe actions which allow
transitions away from $e$.

![](images/safe_bvg.png){width=500 class="center"}

. . .

"you can't come back any time you like... but you can always leave"

Example Path Queries
===============

For a given polygon:

> - What is the strategy with the maximum allowed uncertainty along a path?
> - What are the safe connected components / attractors?

. . .

From a given start set (subset of $\partial P$), what parts of $\partial P$ are
reachable with:

> - some nonzero uncertainty in the controller?
> - given (nonconvex) set of actions?
> - a constant controller (with uncertainty)?


Safe Stable Cycles
=================

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
=============

> - is there a safe cycle which visits edge set $E$ (in a particular order, or not)?
>   - note that safe cycles are "stable," even if they do not have the
>     contraction property for all $s, \theta$.

> - for actions with uncertainty $\pm \epsilon$, is there a reachable cycle which will
    shrink the size of the robot's state estimate below $\delta$?
    

Dirty Laundry
=============

> - Not complete: safe paths exist that we cannot find
> - We can't actually ignore corners always
>    - Boundary sensing modality matters
>    - Corners can be useful!
> - Some of these queries have only been executed "on paper"...
> - Needs experimental validation!

. . .

<div align="center" style="float:left;padding:12px">
<iframe width="300" height="275"
src="images/robot_vid2.m4v"
frameborder="0" allowfullscreen>
</iframe></div>
<div align="center" style="float:right;padding:12px">
<iframe width="300" height="250"
src="images/rotate.mp4"
frameborder="0" allowfullscreen>
</iframe></div>

Future Work
===========

> - How to plan over limit cycles? There are exponentially many, but only some
    are "good" (contracting, admit relatively large error cones, chain together 
    easily with other limit cycles, etc)
> - Corner finding / escaping strategies
> - Code refactor, leading to design of high-level specificiation language
>    - LTL-ish (eventually reach region *A* and stay there forever, stay in region *B* until...)
>    - multirobot propositions: guarantees on robot presence and density

> - Quantify claims of efficiency (energy use), minimality (information processing)
> - More concrete applications
>   - mobile robot monitoring conditions in warehouse / greenhouse / office space
>   - fire-detecting drone
>   - micro-scale agents (environment design)


Thank you!
==========


![](images/tworef1.jpg){width=200 class="center"}\


#### Presentation Template from https://github.com/PeterMosmans/presentation-template ####


