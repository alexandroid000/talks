---
title: Design of Boundary Interactions for Minimalist Mobile Robots
author: |
    | Alli Nilles 
    | Thesis Proposal
date: February 26, 2020
aspectratio: 169
bibliography: thesisrefs.bib
csl: ieee.csl
...


Outline
-------

> - Context and Related Work
> - Model Definitions
> - Examples of Dynamical Properties
> - Control, Planning, and Tasks
> - Remaining Thesis Work
> - Possible Extensions

Context
=======

Environment Boundaries Can Be Useful!
---------------------------------------

![](images/roomba.gif){height="300px" class="center"}



Some Definitions
----------------

> - *contact*: state of physical touching
> - *collision*: contact; with more implied mechanical interaction (friction,
sliding, etc)
> - *boundary interaction*: umbrella term; "what does the robot do when it reaches
a boundary in its environment?"
>   - can be physical model (i.e., reflection law)
>   - can be a distribution over trajectories, data-driven

. . .

<font size="2">Jeffrey Aguilar, Tingnan Zhang, Feifei Qian, Mark Kingsbury, Benjamin McInroe, Nicole Mazouchova, Chen Li, Ryan Maladen, Chaohui Gong, Matt Travers, Ross L. Hatton, Howie Choset, Paul B. Umbanhowar, Daniel I. Goldman, 
"A review on locomotion robophysics: the study of movement at the intersection of robotics, soft matter and dynamical
systems."
<a
href="https://arxiv.org/abs/1602.04712">https://arxiv.org/abs/1602.04712</a></font>


Minimalism and Compliance
-----------------

![](images/grasp.gif){width=450px class="center"}\


<font size="2">Dr. Matt Mason, CMU</font>


Minimalism and Compliance
-------------------------

**Compliance**: work *with* geometry. Can be passive mechanical compliance, or active compliance in
planning/control.


<div class="row">
<div class="column" width="60%">

![](images/fine-motion.jpg){width=300px class="center"}\

</div>
<div class="column" width="40%">

<font size="2">T. Lozano-Perez, M. Mason, R. H. Taylor, "Automatic synthesis of fine-motion strategies for robots." IJRR,
1984.</font>

</div>
</div>


Planning and Control
--------------------

> - *compliance*:
> - *conformance*:
> - *preimage*:
> - *funnel*:


-----------------------------

![](images/robot_spectrum.jpg){width=750px class="center"}\



Minimalist Boundary Interactions
-----------------------------

<div class="row">
<div class="column" width="50%">

![](images/bitbots.jpg){width=350px class="center"}\


</div>
<div class="column" width="50%">


- Localization [^1]
- Mapping [^2][^3]
- Navigation [^3][^4]
- Coverage [^4]
- Pursuit-evasion [^2]

[^1]: O'Kane, J. M., & LaValle, S. M. Localization with limited sensing. IEEE Transactions on Robotics, 2007.
[^2]: M. Katsev, A. Yershova, B. Tovar, R. Ghrist, and S. M. LaValle. IEEE Transactions on Robotics, 2011.
[^3]: Tovar, B., Murrieta-Cid, R., & LaValle, S. M. Distance-optimal navigation in an unknown environment without sensing distances. IEEE Transactions on Robotics, 2007.
[^4]: Lewis, J. S., & O’Kane, J. M. Planning for provably reliable navigation using an unreliable, nearly sensorless robot. The International Journal of Robotics Research, 2013.

</div>
</div>



Minimalist Boundary Interactions
-----------------------------

<div class="row">
<div class="column" width="50%">

![](images/okane_unreliable.gif){height=300px class="center"}\

</div>
<div class="column" width="50%">

Lewis, J. S., & O’Kane, J. M. Planning for provably reliable navigation using an unreliable, nearly sensorless robot. The International Journal of Robotics Research, 2013.

</div>
</div>


Bouncing Robots
---------------

<div class="row">
<div class="column" width="50%">

Iterating the same boundary interaction can cause cycles and trapping regions:

![](images/twoconv.gif){width=300px class="center"}


</div>
<div class="column" width="50%">

Combinatorial changes from small perturbations:

![](images/plane.gif){width=300px class="center"}

</div>
</div>

#### Left example inspired by Spagnolie, S. E., Wahl, C., Lukasik, J., & Thiffeault, J. L. (2017). Microorganism billiards. Physica D: Nonlinear Phenomena, 341, 33-44. ####


Micro-Robots
------------

<div class="row">
<div class="column" width="40%">

![](images/reorient.gif){width=300px class="center"}

<font size="3"> 

C. Bechinger, et. al. **Active particles in complex and crowded environments.** Reviews of Modern Physics, 2016.

Kantsler, V., et. al. **Ciliary contact interactions dominate surface scattering of swimming
eukaryotes.** PNAS, 2013.

</font></div>
<div class="column" width="60%">

![](images/swimmers.png){width=400px class="center"}\

</div>
</div>

Goal 1: Robust, Predictable Movement Primitives
-----


![](images/flow.png){width=500px class="center"}\


Goal 2: Motion Planning and Tasks
---------------------------------


Goal 3: Design Interfaces
-------------------------



Questions
---------

<div class="center">

What tasks can these robots complete? 

</div>

. . .

<div class="center">

Can we find minimal requirements on sensing, actuation, control, memory?

</div>

. . .

<div class="center">

Given that the feasible design space is large and complex, how to best represent,
concretize, and automate the design process?

</div>

Model Definitions
====


Modelling Assumptions
---------------------

> - Robot position modelled as a *point* in a *polygonal environment* (possibly with polygonal
obstacles).
> - Robots move in *straight lines* until they encounter a boundary.
> - Plans are executed in *event-based* way; action $u_k$ taken at stage $k$,
the $k$th time the robot encounters a boundary.
> - We know the exact map of the environment at planning time.



Defining Boundary Interactions
------------------------------


![](images/bounce_examples.jpg){width=700px}

. . .

**Bounce rule:** determines action $u \in (0, \pi)$ at boundary.

**Goal:** Planner produces sequence of **bounce rules**.


Modelling Uncertainty
---------------------


![](images/bounce_example_nondet.png){width=400px class="center"}

Uncertainty is unavoidable... Plan over **nondeterministic** bounce rules!

. . .

What kinds of error and nondeterminism does this include?

Defining Safe Actions
---------------------

**Safe actions**: Given two edges in the environment polygon $e_i$ and $e_j$, an interval 
of actions $\tilde{u}_{i,j} \subseteq (0, \pi)$ is *safe* iff any action $u \in
\tilde{u}_{i,j}$ executed from any point in $e_i$ will cause the robot to transition
to a point in $e_j$ in one stage.

. . .

**Observation:** in a single action, the robot can only transition to visible
segments of the boundary.


Geometry Influences Dynamics
----------------------------

Given geometry, parameterize points on outer boundary and obstacles.

We can explicitly compute a functional form for state transitions between points on
the boundary $\partial P$:

$$f: \partial P \times U \to \partial P$$

. . .

**Observation:** $f$ is easier to analyze when looking at pairs of mutually
visible edges.


### Use visibility structure to discretize space of possible trajectories! ###

Geometry Influences Dynamics
----------------------------

![](images/contract.png){width=600px class="center"}\


$f$ is a *contraction mapping* iff $|\frac{f(x, \theta) - f(y,\theta)}{x-y} | < 1$

. . .

Can be used to reduce uncertainty!

Reducing Uncertainty Through Geometry
----------------------------

![](images/bounce_preimages.png){width=600px class="center"}\

How to Implement?
-----------------

> - iRobot Create with bump sensors and side-facing range sensor:
  "rotate-to-parallel"
> - uniquely identifiable laser "trip wires"
> - geo-fencing with GPS or visible boundaries
> - overhead observation and deformable robots

Creating a Planner
==================


Our Approach
------------


**Planning Problem:** Given start and goal points on the boundary of the
polygonal environment, create a sequence of safe
nondeterministic actions that takes the robot from the start point to an
interval containing the goal.


> 1. Partition boundary using "visibility events"
> 2. Create *safe* edge-to-edge transition graph between segments on boundary
> 3. Search for paths and cycles (depending on specification)
> 4. Translate paths to strategies


Visibility Decomposition
------------------------



![](images/new_partial_local_sequence.png){width=550px class="center"}\

. . .

Equivalence relation on points along boundary with respect to what edges of
original polygon they can "see". Static obstacles use same partitioning operation!


Forming the Safe Bounce Visibility Graph
----------------------------


![](images/safe_bvg.png){width=750 class="center"}

**Nodes**: Edges of *partitioned* polygon.

**Edges**: Directed. Present if safe action exists between edge $e_i$ and edge
$e_j$. Edge holds data on safe angle interval.

. . .

Algorithm 1 of WAFR paper: polygon with $n$ vertices will produce bounce visibility
graph with $O(n^2)$ nodes and $O(n^4)$ edges.


Searching the Safe Bounce Visibility Graph
------------------------------------------


Can use different search algorithms for different specification types.

. . .

If we want to give our robot a constant control input, can use breadth-first search with constraint
intersection.

. . .

If we want to bound the maximum distance travelled by the robot, can use Dijkstra's algorithm.


. . .


In all cases, along with a plan, we also get a characterization of how much uncertainty the
plan can tolerate (design constraints!)


Other Example Queries
--------------------

Of all paths from A to B (up to bounded length), which allows the most unreliable robot?

. . .

From a given start set, what parts of the polygon boundary are reachable?

. . .

Given a finite set of actions, what parts of the boundary are reachable?

. . .

What parts of the polygon are reachable with a constant controller?

. . .

![](images/inserted_two_conv.png){width=700px class="center"}\


Actively Reducing Uncertainty
==================


Stable Cycles
------------------

<div class="row">
<div class="column" width="50%">

![](images/cycles.gif){width=250 style="float:left;padding:12px" class="center"}\


</div>
<div class="column" width="50%">

![](images/bigc.gif){width=350 style="float:right;padding:12px" class="center"}\

</div>
</div>

. . .

To write down a transition function for an entire cycle, compose individual
transition functions until the composition is a return map.

. . .

A cycle is **stable** when this return map is a
*contraction mapping*: two points under the mapping become closer together.

. . .

**Proposition:** For all start points on the boundary of all polygons, a constant
fixed-angle controller exists which will cause the robot's trajectory to enter a
stable limit cycle.

Safe Cycles
-----------

**Safe cycle:** a cycle in the safe bounce visibility graph. May or may not have
stabilizing property.

. . .

**Safe stable cycles:** Given a constant action interval at each stage, we can bound the worst-case
uncertainty in robot position if each transition is a contraction mapping in all
cases.

. . .

### Example Cycle Queries

> - Is there a safe cycle which visits edge set $E$ (in a particular order, or not)?
> - For actions with uncertainty $\pm \epsilon$, is there a reachable cycle which will
    shrink the size of the robot's state estimate below $\delta$?

Summary
-------

We have developed a geometric planner that includes dynamical information and
allows for optimization with respect to uncertainty in position and actuation.

. . .

So far, all planning is done under nondeterminstic, "worst case" assumptions.

. . .

Not complete: "splitting" state into two different segments is not
allowed. This means not all nondeterministic actions are explored.

Future Work and Side Projects
===============


Goal 1: Sensor Feedback and Planning in Information Space
---------------------------------------------------------

We've been assuming the robot has a counter and knows the current stage. What if
we instead assume that the robot has a set of constant controllers and can only
switch as a function of sensor feedback?

. . .

Imagine adding "laser beams" to the system: lines that emit a signal when they
are crossed by a robot.

> - if beams are already placed, and robot doesn't know where it starts, how can it 
>     maximally shrink uncertainty in location?
> - if we're given $k$ beams, where to place to aid localization?


Goal 2: Improving the Planner
---------------------

- Include probabilistic information
  - Assume we're given probability distribution of actual $\theta$ given a control input
  - Bayesian updates while searching graph

. . .

- Better interface and specification language
  - visualizations of coverage, trapping regions, etc
  - Stretch goal: LTL specifications and plan synthesis
    - "eventually reach region *A*..."
    - "stay in region *B* until..."
  - How to specify patterns in space and time?

Side Project on Interfaces
--------------------------

<div align="center" style="float;padding:24px">
<iframe width="600" height="400"
src="images/improv_demo.mp4"
frameborder="0" allowfullscreen>
</iframe></div>

with Dr. Amy LaViers. Choreographers and movement observers have lots of
technologies for specifying movement!

Goal 3: Minimalism for Underactuated Multi-Robot Systems
-----------------------------

Traditional planning techniques don't scale well to multi-robot systems.

. . .

Can giving up precise control of individual robots actually help us?

. . .

> - Mayya, Siddharth, Pietro Pierpaoli, Girish Nair, and Magnus Egerstedt. **Localization in densely packed swarms using interrobot collisions as a sensing modality.** IEEE Transactions on Robotics (2018).
> - Gauci, Melvin, Jianing Chen, Wei Li, Tony J. Dodd, and Roderich Groß. **Self-organized aggregation without computation.** IJRR (2014).
> - Becker, Aaron, Golnaz Habibi, Justin Werfel, Michael Rubenstein, and James McLurkin. **Massive uniform manipulation: Controlling large populations of simple robots with a common input signal.** IROS (2013).

Micro-Scale Inspired Applications
--------------------------------

![](images/swimmers.png){width=400px class="center"}\


C. Bechinger, R. Leonardo, H. Löwen, C. Reichhardt, G. Volpe, and G. Volpe.
**Active particles in complex and crowded environments.** Reviews of Modern Physics,
(2016).


Micro-Scale Inspired Applications
-----------------------------------------------------


![](images/cilia.jpg){width=500px class="center"}

V. Kantsler, J. Dunkel, M. Polin, and R. Goldstein. **Ciliary contact interactions dominate surface scattering of swimming eukaryotes.** PNAS (2013).


Micro-Scale Inspired Applications
-----------------------------------------

<div align="center" style="float;padding:24px">
<iframe width="600" height="400"
src="images/large_weaselballs.mp4"
frameborder="0" allowfullscreen>
</iframe></div>

Micro-Scale Inspired Applications
-----------------------------------------

<div align="center" style="float;padding:24px">
<iframe width="600" height="400"
src="images/4B-tl.mp4"
frameborder="0" allowfullscreen>
</iframe></div>


Micro-Scale Inspired Applications
-----------------------------------------

<div align="center" style="float;padding:24px">
<iframe width="400" height="275"
src="images/gear.mp4"
frameborder="0" allowfullscreen>
</iframe></div>

Understanding spatial density and boundary interactions is key step toward
manipulation!


Micro-Scale Inspired Applications
-----------------------------------------

Research questions:

> - Can introducing agents with controllable boundary interactions into a
collection of Brownian agents induce currents? Under what conditions?
> - If the bouncing robots are able to produce a signal that the Brownian agents
can respond to (EM field alignment, chemotaxis), can we cluster and/or sort the Brownian agents?
> - What is the role of environment geometry in group dynamics? How do we design
environments for sorting and otherwise studying microswimmers?

Conclusion
----------

> - "Bouncing robot" model is cool and applies to a wide range of physical
systems!
> - Compliance and minimalism are cool principles and still useful!
> - Lots of "low hanging fruit" left to work on, especially when looking at sensor
models / information spaces / low-complexity controllers.


Thank you!
==========

