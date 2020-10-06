---
title: |
    | Designing Boundary Interactions
    | for Simple Mobile Robots
author: |
    | Alexandra (Alli) Nilles 
date: |
    | Thesis Advisor: Dr. Steven M. LaValle
    | October 21, 2020
sponsors: <img src="/home/alli/common/figs/sponsors.png" width="800" height="100">
aspectratio: 169
self-contained: true
resource-path: ["/home/alli/common/figs","."]
bibliography: thesisrefs.bib
csl: ieee.csl
...



Robotics "Stack"
----------------


Roadmap
-------

reverse order of title:

- how to model simple robots and what kinds of simplicity we care about, and why
    - micro-robots
    - insects (ant/termite collisions in tunnels)
    - climate crisis requires monitoring of many types of ecosystems with
  limited sensing/communication
        - weaselballs, gates -> clean up trash/oil
- how to model boundary interactions, dynamical consequences (limit cycles)
    - learning can replace analytic understanding of dynamics if the learning module
      can find stable gaits / motion patterns
- designing these interactions for different tasks
    - hierarchical control
    - implications for interfaces and design: "there are lots of different good solutions"
- implications for where these robots do well, where they struggle
    - "complex, crowded environments"
    - WAFR2020 shows importance of sensor design, even coarse sensing


Environment Boundaries Can Be Useful in the Face of Uncertainty!
---------------------------------------

![](roomba.gif){height="300px" class="center"}


Lessons from Manipulation
-------------------------

<div class="row">
<div class="column" width="60%">

![](grasp.gif){width=350px class="center"}\

</div>
<div class="column" width="40%">


> - Intelligent use of constraints / contact can enable robust robot behaviors
> - Mason, Goldberg, Erdmann, Lozano-Pérez, etc.


</div>
</div>



Definitions
-----------

> - *contact*: state of physical touching
> - *collision*: contact with implied mechanical interaction (friction, sliding, etc)
> - *boundary interaction*: umbrella term; "what does the robot do when it reaches
a boundary in its environment?"
>   - can be an analytic model (i.e., reflection law)
>   - can be a distribution over trajectories, data-driven
>   - boundaries can be walls, laser beams, GPS boundaries, etc

. . .

#### Jeffrey Aguilar, Tingnan Zhang, Feifei Qian, Mark Kingsbury, Benjamin McInroe, Nicole Mazouchova, Chen Li, Ryan Maladen, Chaohui Gong, Matt Travers, Ross L. Hatton, Howie Choset, Paul B. Umbanhowar, Daniel I. Goldman,  "A review on locomotion robophysics: the study of movement at the intersection of robotics, soft matter and dynamical systems."

Related Work
============


Minimalist Boundary Interactions
-----------------------------

<div class="row">
<div class="column" width="50%">

![](bitbots.jpg){width=350px class="center"}\


</div>
<div class="column" width="50%">


- **Localization** with limited sensing (O'Kane, LaValle 2007)
- Localization using limit cycles (Alam, Bobadilla, Shell 2017)
- **Mapping** (Bitbots, LaValle et. al. 2011)
- **Navigation** (Tovar, Murrieta-Cit, LaValle 2007) (Lewis, O'Kane 2013)
- **Coverage** (Lewis, O'Kane 2013)
- **Pursuit-evasion** (Bitbots)

[^1]: O'Kane, J. M., & LaValle, S. M. Localization with limited sensing. IEEE Transactions on Robotics, 2007.
[^2]: M. Katsev, A. Yershova, B. Tovar, R. Ghrist, and S. M. LaValle. IEEE Transactions on Robotics, 2011.
[^3]: Tovar, B., Murrieta-Cid, R., & LaValle, S. M. Distance-optimal navigation in an unknown environment without sensing distances. IEEE Transactions on Robotics, 2007.
[^4]: Lewis, J. S., & O’Kane, J. M. Planning for provably reliable navigation using an unreliable, nearly sensorless robot. The International Journal of Robotics Research, 2013.

</div>
</div>


Minimalist Boundary Interactions
-----------------------------


![](okane_unreliable.gif){height=270px class="center"}\


#### Lewis, J. S., & O’Kane, J. M. Planning for provably reliable navigation using an unreliable, nearly sensorless robot. The International Journal of Robotics Research, 2013.

Wild Bodies
-----------

![](weaselballs-gates.gif){width=400px class="center"}\

####  Bobadilla, L., Sanchez, O., Czarnowski, J., Gossman, K., & LaValle, S. M. (2012). Controlling wild bodies using linear temporal logic. In Robotics: Science and Systems.


Micro-Robots
------------

<div class="row">
<div class="column" width="40%">

![](reorient.gif){width=300px class="center"}

<font size="3"> 

C. Bechinger, et. al. **Active particles in complex and crowded environments.** Reviews of Modern Physics, 2016.

Kantsler, V., et. al. **Ciliary contact interactions dominate surface scattering of swimming
eukaryotes.** PNAS, 2013.

</font></div>
<div class="column" width="60%">

![](swimmers.png){width=400px class="center"}\

</div>
</div>



Bouncing Robots
---------------

<div class="row">
<div class="column" width="50%">

Iterating the same boundary interaction can cause cycles and trapping regions:

![](twoconv.gif){width=300px class="center"}


</div>
<div class="column" width="50%">

Combinatorial changes from small perturbations:

![](plane.gif){width=300px class="center"}

</div>
</div>

####  Toward the design and analysis of blind, bouncing robots. L. H. Erickson and S. M. LaValle. ICRA, 2013

#### Left example inspired by Thiffeault, et. al. Microorganism billiards. Physica D: Nonlinear Phenomena, 2017


Research Goals
==============

Goal 1: Robust, Predictable Movement Primitives
-----


![](flow.png){width=500px class="center"}\


<div class="center">
</div>


Goal 2: Planning and Tasks
--------------------------

<div class="center">
How to get from start to goal? With minimal control complexity? How much
uncertainty can a plan tolerate?
</div>

. . .

<div class="center">
What tasks can these robots complete? 
</div>


Goal 3: Tools for System Design and Analysis
-------------------------

<div class="center">
Can we find minimal requirements on sensing, actuation, control, memory for a
given task?
</div>

. . .

<div class="center">
Can we more formally understand the trade-offs between sensing,
actuation, computation, and memory?
</div>

. . .

<div class="center">
Given a large, well-characterized space of robot designs, how can automated
tools aid the design and verification process?
</div>


Results: Bouncing Robots
=======

Modelling Assumptions
---------------------

- Robot position modelled as a *point* in a *polygonal environment* (possibly with polygonal
obstacles).
- Robots move in *straight lines* until they encounter a boundary.


![](bounce_examples.jpg){width=700px class="center"}



Modelling Uncertainty
---------------------


![](bounce_example_nondet.png){width=400px class="center"}

Uncertainty is unavoidable... Plan over **nondeterministic** bounce rules!

. . .

What kinds of error and nondeterminism does this include?

How to Implement?
-----------------

> - differential drive with bump sensors and side-facing range sensor ("rotate-to-parallel")
> - virtual boundaries (laser beams, GPS, visible boundaries, etc)
> - contact sensor and mechanical alignment of robot body ("rotate-until-free")

. . .

![](reorient.gif){width=300px class="center"}


Geometry Influences Dynamics
----------------------------

Given geometry, parameterize points on outer boundary and obstacles.

We can explicitly compute transition function $f$ between points on
the boundary.

![](contraction_map_cond.png){width=350px class="center"}\


Geometry Influences Dynamics
----------------------------

$f$ is a *contraction mapping* iff $|\frac{f(x, \theta) - f(y,\theta)}{x-y} | < 1$

. . .

For two mutually visible straight-line segments, this quantity (the *contraction
coefficient*) is independent of $x, y$ and depends only on $\theta$ and the
internal angle $\phi$ between the segments.

. . .

Can be used to reduce uncertainty!


![](bounce_images.gif){width=150px class="center"}\



Limit Cycles
------------------

<div class="row">
<div class="column" width="35%">

![](cycles.gif){width=250 class="center"}\


</div>
<div class="column" width="65%">

To write down a transition function for an entire cycle, compose individual
transition functions until the composition is a return map.


A cycle is **stable** when this return map is a
*contraction mapping*: two points under the mapping become closer together.


**Proposition:** For all start points on the boundary of all polygons, a constant
fixed-angle controller exists which will cause the robot's trajectory to enter a
stable limit cycle.


</div>
</div>



Results: Nondeterministic Planning
==================


Approach
---------


**Planning Problem:** Given start and goal sets on the boundary of the
polygonal environment, create a sequence of safe
nondeterministic actions that takes the robot from any point in the start set
to some point in the goal set.

> 1. Partition boundary using "visibility events"
> 2. Create *safe edge-to-edge transition graph* using boundary segments
> 3. Search for paths and cycles (depending on specification)
> 4. Translate paths to strategies

Nondeterministic Planning
-------------------------


We know the exact map of the environment at planning time.

. . .

**Bounce rule:** action to take at boundary, convex subset $u \subseteq (0, \pi)$.

. . .

Planner produces sequence of **bounce rules**.

Visibility Decomposition
------------------------

Equivalence relation on points along boundary with respect to what edges of
original polygon they can "see".

![](new_partial_local_sequence.png){width=400px class="center"}\


Defining Safe Actions
---------------------

**Safe actions**: Given two edges ($e_{start}$ and $e_{goal}$) in the environment polygon, an interval of
bounce angles is **safe** iff:

. . .

any action in the interval,

. . .

executed from any point on $e_{start}$,

. . .

will cause the robot to transition to some point on $e_{goal}$.


Forming the Safe Bounce Visibility Graph
----------------------------

**Nodes**: Edges of *partitioned* polygon.

**Edges**: Directed. Present if safe action exists between edge $e_i$ and edge
$e_j$. Edge holds data on safe angle interval.

. . .

Algorithm 1 of WAFR 2018 paper: polygon with $n$ vertices will produce bounce visibility
graph with $O(n^2)$ nodes and $O(n^4)$ edges.


Forming the Safe Bounce Visibility Graph
----------------------------


![](safe_bvg.png){width=750 class="center"}


Examples of Search Queries
--------------------------

If we want to give our robot a constant control input, can use breadth-first search with constraint
intersection.

![](inserted_two_conv.png){width=700px class="center"}\

Examples of Search Queries
--------------------

We can search while bounding the maximum distance travelled by the robot by
labelling each edge with the maximum distance travelled by any transition
represented by that edge.

. . .

Can search for only contracting paths, or keep the total state expansion/contraction under a bounded
amount.

. . .

Of all paths from A to B (up to bounded length), which allows the most unreliable robot?

. . .

In all cases, along with a plan, we also get a characterization of how much uncertainty the
plan can tolerate (design constraints!)

Completeness and Correctness
----------------------------

This is an exact planner, so all found solutions are correct, and it will not
return any infeasible plans.

. . .

However, it is **not** complete, for three reasons:

> - currently does not take into account knowledge about initial conditions
> - does not allow state splitting during the search (robot state is maintained
as one contiguous set of points along the environment boundary)
> - does not take into account how some state transitions reduce uncertainty


Applications, Tasks, and Interfaces
==================


Directed Self-Assembly and Manipulation
----------------------


<div class="row">
<div class="column" width="50%">

![](gear.gif){class="center" width=200px}

</div>
<div class="column" width="50%">

![](ratchet.jpg){class="center" width=400px}


</div>
</div>


####  Di Leonardo, Roberto, et al. "Bacterial ratchet motors." Proceedings of the National Academy of Sciences (2010)

####  Klavins, Eric. "Programmable self-assembly." IEEE Control Systems Magazine 27, 2007.

Weaselball Hub Design
---------------------

<div class="center-text"> 

<img src="weaselball_design_iterations.png" style="float:left;height:150px">
<img src="weaselball_design4.jpg" style="float:right;height:150px">

</div>

<div class="row">
<div class="column" width="60%">

Next step: **controllable detaching** (electro-permanent magnets or
shape-memory alloys) 


</div>
<div class="column" width="40%">

![](weaselball_stacked.jpg){class="center" height=200px}


</div>
</div>


Assembly Example
----------------

![](collective_formation.gif){class="center" height=200px}


####  Nilles, A., Wasserman, J., Born, A., Horn, C., Born, J., & LaValle, S. M. (2019, August). A Hardware and Software Testbed for Underactuated Self-Assembling Robots. In 2019 International Symposium on Multi-Robot and Multi-Agent Systems (MRS) (pp. 7-9). IEEE.

Key Research Insights and Questions
----------------------

1. Control of macro states ("pressure", "temperature") could enable
manipulation and other useful tasks.
2. Robot-robot interactions affect these macro-states.
3. Robot-boundary interactions affect these macro-states.
4. How to tune and design these interactions?

####  Mayya, Siddharth, Gennaro Notomista, Dylan Shell, Seth Hutchinson, and Magnus Egerstedt. "Non-uniform robot densities in vibration driven swarms using phase separation theory." IROS, 2019.




Manipulation (WAFR 2020)
------------

![](environment_and_triangles.png){class="center" width=600px}


Manipulation (WAFR 2020)
------------

![](FSMs.png){class="center" width=600px}


Interesting Takeaways
--------------

> - movement primitives lend themselves well to abstraction
> - given information history, three types of state estimation:
>   - what states could I have started in to create this information history?
>   - what states could I currently be in?
>   - what states could I reach in the future (with a given controller)?


Corralling
----------

![](corralling.gif){class="center" width=400px}

Interfaces and Design
---------------------

![](visualizer.jpg){class="center" width=600px}

Interfaces and Design
---------------------

![](improv_demo.gif){class="center" width=600px}

with Dr. Amy LaViers. Choreographers and movement observers have lots of
technologies for specifying movement! Published MOCO 2018.

Remaining Goals and Approach
============================

Main Goal: "The Bouncing Robot Design Game"
-------------------------------------------


<div class="row">
<div class="column" width="50%">

Combine and extend work so far into an interactive tool for designing bouncing
robot systems.

Space of possible systems designs is large!


I see this as a first step toward a CAD tool for micro-robotic assembly systems.


</div>
<div class="column" width="50%">

![](design_short.png){class="center" width=300px}\


</div>
</div>

Features of Design Tool
-----------------------

Interface:

> - More visualizations, such as coverage, sample trajectories for plans, 
  trapping regions, etc.
> - Interactive placement of sensors, geometry, gates, etc.
> - "Toolbox" of low-level controllers (ex: bounce rules and initial conditions
needed to create cycle in selected region)
> - User iteratively builds hierarchical controller.

System Sensor Placement
-----------------------

Proposed first sensors:

> - colored "laser beams" that emit a signal when they are crossed by a robot
> - chemical comparators and globally switchable chemical "sources"

. . .

Most useful sensors are ones with computable spatial preimages, because they 
induce a natural environment discretization. Can compare and optimize wrt
planner discretization.


Planning in Information Space
-----------------------------

Given user-defined regions within the environment (target regions), we want to
be able to design *flows*: collective robot movement patterns that achieve a
task.

. . .

For some tasks, like ones that require visiting some regions in a particular order, we can use the
existing planner to automatically compute solutions.

. . .


User and program work together to create controller.


Abstractions on Dynamics
------------------------

Given initial conditions and a controller:

> - visualize and bound persistent states, using contraction properties
> - analyze ergodicity for coverage applications?

. . .

Both of these could be "data-driven" over forward simulations of the nondeterministic
dynamical system. Also plan to continue work on analytical characterizations of
the dynamical systems.

![](pent_chaos.png){class="center" width=130px}


Stretch goal
------------

LTL specifications and plan synthesis

. . .

"eventually reach region *A*..."

"stay in region *B* until..."

Conclusion
----------

- "Bouncing robot" model is cool and applies to a wide range of physical
systems!
- Compliance and minimalism are cool principles and still useful!
- Lots of very cool problems to work on, especially when looking at sensor
models / information spaces / low-complexity controllers.

![](cycles.gif){class="center" width=200px}


Thank you!
==========

