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
revealjs-url: ./reveal.js/
resource-path: ["/home/alli/common/figs/","."]
css: ["css/metropolis.css"]
aspectratio: 169
width: 800
height: 450
self-contained: true
bibliography: thesisrefs.bib
csl: ieee.csl
...


Roadmap
-------

> - Modelling simple robots
> - Dynamics of "bouncing robot" trajectories
> - Design for different tasks
> - Review of contributions and implications for future work

reverse order of title:

- how to model simple robots and what kinds of simplicity we care about, and why
    - climate crisis requires monitoring of many types of ecosystems with limited sensing/communication
        - weaselballs, gates -> clean up trash/oil
- how to model boundary interactions, dynamical consequences (limit cycles)
    - learning can replace analytic understanding of dynamics if the learning module
      can find stable gaits / motion patterns
- implications for where these robots do well, where they struggle
    - "complex, crowded environments"
    - WAFR2020 shows importance of sensor design, even coarse sensing
- final overview of contributions

What Is a Robot?
----------------

sensing, action, perception loops

sensing, actuation, computation, communication, power

robotics "stack" and where I focus

What Makes a Robot "Simple"?
-----------------------

:::::::::::::: {.columns}
::: {.column width="50%"}



![An ATLAS robot using a vacuum cleaner. From IHMC
[@ackerman2016ihmc].](atlas_vacuum.gif){height=300px class="center"}

:::
::: {.column width="50%"}

![From Mike Johnson, YouTube [^1]](roomba.gif){height=300px class="center"}

:::
::::::::::::::

[^1]: https://www.youtube.com/watch?v=Q06G-bvGOXE


When Do We Want a "Simple" Robot?
------------------------------------

- Some environments lead to unavoidable constraints
    - Communication can be constrained by size, distance, transmission medium
    - Computation can be constrained by size, security/privacy needs
    - Cost (multiple redundant robots vs. one general purpose robot)
- Ease of testing and verification (and eventually, automated design)
- Robust, emergent behaviors vs. brittle, "optimal" behaviors



Why Do We Want to Understand Boundary Interactions?
---------------------------------------------------

- Useful or necessary to navigate in complex and crowded environments
- Intuitively useful for decreasing uncertainty and creating robust trajectories



Recent Interest in Intentional Collisions
---------------------------------

:::::::::::::: {.columns}
::: {.column width="50%"}

![Z. Lu, Z. Liu, G. Correa, K. Karydis. **Motion Planning for Collision-resilient Robots in Unknown Maps with Risk Reward
Trade-off.** IROS 2020](figs/collide-arclab.gif){width=600px class="center"}

:::
::: {.column width="50%"}

![M. Mote, M. Egerstedt, E. Feron, A. Bylard, M. Pavone, **Collision-Inclusive Trajectory Optimization for Free-Flying
Spacecraft.** Journal of Guidance, Control, and Dynamics 2020.](figs/space-collide-mote.gif){width=300px class="center"}

:::
::::::::::::::


Developments at Small Scales
-------------------



:::::::::::::: {.columns}
::: {.column width="50%"}


![ Kantsler, et. al. **Ciliary contact interactions dominate surface scattering of swimming
eukaryotes.** PNAS, 2013.](reorient.gif){height=200px class="center"}

![Di Leonardo, et al. "Bacterial ratchet motors." PNAS, 2010.](gear.gif){class="center" height=200px}

:::
::: {.column width="50%"}

![C. Bechinger, et. al. **Active particles in complex and crowded environments.** Reviews of Modern 
Physics, 2016.](swimmers.png){height=300px class="center"}

:::
::::::::::::::

Overlap With Locomotion and Manipulation
----------------------------------------

:::::::::::::: {.columns}
::: {.column width="50%"}

![manipulation]()

:::
::: {.column width="50%"}

![](figs/obs-dist.gif)\

:::
::::::::::::::


*Designing* Boundary Interactions
-------------------------------


![](bounce_examples_w_monotone_fixed.png){width=600px class="center"}\

. . .


> - models deliberately chosen to encompass many different physical realizations
> - space of possibilities is large; we choose a few appplications to ground but focus more on characterizing the design space
> - not always optimizing for the same thing (shortest path, fewest bounces, mechanical design...)

Related Work
------------

## Manipulation

> - Intelligent use of constraints / contact can enable robust robot behaviors
> - Mason, Goldberg, Erdmann, Lozano-Pérez, etc.

## Robophysics

> - Jeffrey Aguilar, Tingnan Zhang, Feifei Qian, Mark Kingsbury, Benjamin McInroe, Nicole Mazouchova, Chen Li, Ryan Maladen, Chaohui Gong, Matt Travers, Ross L. Hatton, Howie Choset, Paul B. Umbanhowar, Daniel I. Goldman,  "A review on locomotion robophysics: the study of movement at the intersection of robotics, soft matter and dynamical systems."


Minimalist Boundary Interactions
-----------------------------

![Lewis, J. S., & O’Kane, J. M. Planning for provably reliable navigation using an unreliable, nearly sensorless robot. The International Journal of Robotics Research, 2013.](okane_unreliable.gif){height=270px class="center"}\

The Importance of Being in Corners


Minimalist Boundary Interactions
-----------------------------

:::::::::::::: {.columns}
::: {.column width="50%"}

![](bitbots.jpg){width=350px class="center"}\

:::
::: {.column width="50%"}



- **Localization** with limited sensing (O'Kane, LaValle 2007)
- Localization using limit cycles (Alam, Bobadilla, Shell 2017)
- **Mapping** (Bitbots, LaValle et. al. 2011)
- **Navigation** (Tovar, Murrieta-Cit, LaValle 2007) (Lewis, O'Kane 2013)
- **Coverage** (Lewis, O'Kane 2013)
- **Pursuit-evasion** (Bitbots)

- O'Kane, J. M., & LaValle, S. M. Localization with limited sensing. IEEE Transactions on Robotics, 2007.
- M. Katsev, A. Yershova, B. Tovar, R. Ghrist, and S. M. LaValle. IEEE Transactions on Robotics, 2011.
- Tovar, B., Murrieta-Cid, R., & LaValle, S. M. Distance-optimal navigation in an unknown environment without sensing distances. IEEE Transactions on Robotics, 2007.
- Lewis, J. S., & O’Kane, J. M. Planning for provably reliable navigation using an unreliable, nearly sensorless robot. The International Journal of Robotics Research, 2013.

:::
::::::::::::::

Wild Bodies
-----------

![](weaselballs-gates.gif){width=400px class="center"}\

####  Bobadilla, L., Sanchez, O., Czarnowski, J., Gossman, K., & LaValle, S. M. (2012). Controlling wild bodies using linear temporal logic. In Robotics: Science and Systems.


Roadmap
-------

> - What can you do with a bouncing robot?
> - What guarantees do we have about bouncing robots?
> - Highlights of other projects in multi-agent systems, programming languages
> - Future directions

Bouncing Robots
---------------

:::::::::::::: {.columns}
::: {.column width="50%"}

Iterating the same boundary interaction can cause cycles and trapping regions:

![example inspired by Thiffeault, et. al. Microorganism billiards. Physica D: Nonlinear Phenomena, 2017](twoconv.gif){width=300px class="center"}

:::
::: {.column width="50%"}

Big changes from small perturbations:

![](plane.gif){width=300px class="center"}

:::
::::::::::::::


Methodology
-----------

Switch between controllable baseline behaviors to complete tasks

Behaviors I have focused on are:

cycling, funnelling, wildness

![](flow.png){width=500px class="center"}\


Modelling Assumptions
---------------------

> - Robot position modelled as a *point* in a *polygonal environment* (possibly with polygonal obstacles).
> - Robots move in *straight lines* until they encounter a boundary.

. . .

![](bounce_examples.jpg){width=600px}


Modelling Uncertainty
---------------------


![](bounce_example_nondet.png){width=400px class="center"}

Uncertainty is unavoidable... Plan over **nondeterministic** bounce rules!


How to Implement?
-----------------


- Differential drive with bump sensors and side-facing range sensor ("rotate-to-parallel")
- Contact sensor and mechanical alignment of robot body ("rotate-until-free")
- Boundaries can be virtual (laser beams, GPS, visible boundaries, etc)


<div align="center" style="float:left;padding:24px">
<iframe width="300" height="275"
src="figs/robot_vid2.m4v"
frameborder="0" allowfullscreen>
</iframe></div>
<div align="center" style="float;padding:24px">
<iframe width="300" height="250"
src="figs/rotate.mp4"
frameborder="0" allowfullscreen>
</iframe></div>

<div align="center" style="float:left">
<img src="figs/Petronics-logo.png" style="width:200px">
</div>

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

:::::::::::::: {.columns}
::: {.column width="50%"}


![](cycles.gif){width=250 class="center"}\

:::
::: {.column width="50%"}


To write down a transition function for an entire cycle, compose individual
transition functions until the composition is a return map.


A cycle is **stable** when this return map is a
*contraction mapping*: two points under the mapping become closer together.


**Proposition:** For all start points on the boundary of all polygons, a constant
fixed-angle controller exists which will cause the robot's trajectory to enter a
stable limit cycle.

::::::::::::::
:::




Planning for Nondeterministic Bouncing Strategies
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

> - Does not take into account knowledge about initial conditions
> - Does not allow state splitting during the search (robot state is maintained
as one contiguous set of points along the environment boundary)
> - Does not take into account how some state transitions reduce uncertainty



Self-Assembly
-------------


![Stanford YouTube Channel [^2]](figs/protein.gif){class="center" height=200px}

[^2]: \url{https://www.youtube.com/watch?v=Pjt1Q2ZZVjA}




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

1. Control of macro states ("pressure", "temperature") can enable
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


Interfaces and Design
---------------------

![](visualizer.jpg){class="center" width=600px}

Interfaces and Design
---------------------

![](improv_demo.gif){class="center" width=600px}

with Dr. Amy LaViers. Choreographers and movement observers have lots of
technologies for specifying movement! Published MOCO 2018.

![](pent_chaos.png){class="center" width=130px}

![](cycles.gif){class="center" width=200px}


"Grand Challenges" of Robotics (according to Rodney Brooks)
------------------------------

- Aging population
- Urbanization
- Climate change


Acknowledgements
----------------


Thank you!
==========
