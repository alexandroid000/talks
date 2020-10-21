---
title: |
    | Designing Boundary Interactions
    | for Simple Mobile Robots
author: |
    | Alexandra (Alli) Nilles 
date: |
    | Thesis Advisor: Dr. Steven M. LaValle
    | Committee: Dr. Nancy M. Amato, Dr. Sayan Mitra, Dr. Todd D. Murphey
    | October 21, 2020
sponsors: <img src="/home/alli/common/figs/sponsors.png" width="800" style="background:none;border:none;box-shadow:none;margin-bottom:100px">
resource-path: ["/home/alli/common/figs/","."]
css: ["css/metropolis.css"]
aspectratio: 169
width: 800
height: 450
self-contained: true
bibliography: thesisrefs.bib
csl: ieee.csl
...


What Is a Robot?
----------------

- Required: sensing, computation, action
- Also important: communication, power, form

:::::::::::::: {.columns}
::: {.column width="33%"}

![Wall-E](wall-e.jpg){height=200px}


:::
::: {.column width="33%"}

![Robot and Frank](robot_and_frank.webp){height=200px}

:::
::: {.column width="33%"}

![Interstellar](interstellar_robot.jpg){height=200px}

:::
::::::::::::::

What is a Mobile Robot?
-----------------------

:::::::::::::: {.columns}
::: {.column width="50%"}


![Kuka robot, image from Robo Sapiens Automation.](kuka.jpg)

:::
::: {.column width="50%"}

![Amazon robot, image from AP News, 30 December 2019.](amazon3.jpeg)

:::
::::::::::::::

"General purpose" mobile robot design
--------------------------------------

:::::::::::::: {.columns}
::: {.column width="70%"}

- Develop or choose hardware (car, differential drive, etc..)
- Construct or be provided a map
- Develop state estimation / localization
- Develop control system to follow given trajectories
- Plan collision-free paths
- User interface (choosing goals / waypoints in workspace)

:::
::: {.column width="30%"}

![Robotics and Automation News, 2016](car_lidar.jpg){width=300px}

:::
::::::::::::::

. . .


Still very hard! What if for certain tasks, we didn't have to do all this?


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

No all-purpose technical definition of "simple"... Long history of minimalism as
a lens for analyzing robotic systems. See "The Compass that Steered Robotics", 
Goldberg, Erdmann, Egerstedt, many others...


When Do We Want a "Simple" Robot?
------------------------------------

- Robot is too small for usual hardware
- Environment makes usual sensors, communicators, etc less effective
- When we want to minimize cost or resource usage
- Want to get formal guarantees on behavior
    - No "unexpected" behaviors
    - Make some behavior impossible (safety, privacy)
    - Prove robustness (to sensor failure, model errors, ...)


What is a Boundary Interaction?
-------------------------------

Physical collision, virtual "boundary", or even another robot!

:::::::::::::: {.columns}
::: {.column width="50%"}


![iRobot [^3]](modewall.jpg){width=300px}


:::
::: {.column width="50%"}

![Husqvarna [^4]](husqvarna.jpg){width=300px}



[^3]: \url{https://homesupport.irobot.com/app/answers/detail/a_id/10219/~/the-dual-mode-virtual-wall%C2%AE-barrier-is-not-confining-roomba-to-desired-areas.}
[^4]: \url{https://shop.husqvarna.com/us/automower-115h}

:::
::::::::::::::

Why Do We Want to Understand Boundary Interactions?
---------------------------------------------------

- Can be necessary to navigate in complex and crowded environments
- Newly enabled by developments in robot materials, sensors
- Intuitively useful for decreasing uncertainty (lessons from locomotion, manipulation)

. . .

:::::::::::::: {.columns}
::: {.column width="50%"}

![Feifei Qian, Dan Koditschek, IJRR 2020](figs/obs-dist.gif)

:::
::: {.column width="50%"}

![Manipulation Lab, Dr. Matt Mason, CMU](grasp.gif)

:::
::::::::::::::


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
eukaryotes.** PNAS, 2013.](reorient.gif){height=150px class="center"}

![Di Leonardo, et al. "Bacterial ratchet motors." PNAS, 2010.](gear.gif){class="center"
height=150px}

:::
::: {.column width="50%"}

![C. Bechinger, et. al. **Active particles in complex and crowded environments.** Reviews of Modern 
Physics, 2016.](swimmers.png){height=300px class="center"}

:::
::::::::::::::


Emergence, Collective Intelligence, and Minimalism
------------------------

For robust emergent behaviors, we want to find mapping between local actions and global behavior.

. . .

Not often easy or intuitive. Options to bridge the gap: parameterize design space and sweep,
reinforcement learning, control, dynamical system segmentation, statistical mechanics, information spaces...

. . .

Boundary interactions are an under-explored control mode, with promise for
analytic guarantees, and are amenable to many "lines of attack."

. . .

- Roderich Groß, Natural Robotics Lab, computation-free swarming
- Smarticles, MURI on Collective Behavior (Randall, Goldman, Strano, Richa, England, Murphey)
- S. Mayya, G. Notomista, D. Shell, S. Hutchinson, and M. Egerstedt. "Non-uniform robot densities in vibration driven swarms using phase separation theory." IROS, 2019.
- Collective intelligence: Radhika Nagpal, Kirstin Petersen
- LaValle, Yu, Liberzon "Rendezvous without coordinates"


*Designing* Boundary Interactions
-------------------------------

- Choose models to cover range of implementations
- Use appplications to ground model choice, but focus more on characterizing the design space
- Make tools that leave optimization options open (shortest path, robustness, mechanical design...)

. . .

> Design activity... is a process of **satisficing** rather than optimizing;
> producing any one of what might well be a large range of satisfactory solutions
> rather than attempting to generate the one hypothetically-optimum solution.
> 
> -- Nigel Cross, *Designerly Ways of Knowing*

My Work
-------

:::::::::::::: {.columns}
::: {.column width="50%"}

Characterization and planning for model system, bouncing robots:

![](twoconv.gif){height=150px class="center"}\ 


Prototype programming language:

![](improv_demo.gif){height=150px class="center"}\

:::
::: {.column width="50%"}

Experimental testbed for self-assembling wild bodies:

![](weaselballs_movement.gif){height=150px class="center"}\


Many other (published and unpublished) projects...

:::
::::::::::::::

Bouncing Robots
---------------

:::::::::::::: {.columns}
::: {.column width="50%"}

Iterating the same boundary interaction can cause cycles and trapping regions:

![example inspired by Thiffeault, et. al. Microorganism billiards. Physica D: Nonlinear Phenomena, 2017](twoconv.gif){width=300px class="center"}

:::
::: {.column width="50%"}

Big changes in workspace from small perturbations:

![See also Erickson, LaValle ICRA 2013](plane.gif){width=300px class="center"}

:::
::::::::::::::


What Can You Do With a Bouncing Robot?
-----------------------------

![Lewis, J. S., & O’Kane, J. M. Planning for provably reliable navigation 
using an unreliable, nearly sensorless robot. IJRR,
2013.](okane_unreliable.gif){height=200px class="center"}

- **Navigation** (Lewis, O'Kane IJRR 2013; )
- **Coverage** (Lewis, Feshbach, O'Kane, IROS, 2018)
- **Localization** with limited sensing (O'Kane, LaValle, IEEE Transaction on Robotics, 2007)
- Localization *and* coverage using limit cycles (Alam, Bobadilla, Shell 2017)
- **Mapping** (LaValle et. al. 2011)
- **Object Clustering** (Kim, Shell, ICRA 2015)

Modelling Assumptions
---------------------

- Robot position modelled as a *point* in a *polygonal environment* (possibly with polygonal obstacles).
- Robots move in *straight lines* until they encounter a boundary.

. . .

![](bounce_examples_w_monotone_fixed.png){width=600px class="center"}\


Modelling Uncertainty
---------------------


Uncertainty is unavoidable... Plan over **nondeterministic** bounce rules!


![](bounce_example_nondet.png){width=400px class="center"}


Geometry Influences Dynamics
----------------------------

Define transition function $f$ between points on environment boundary: consider
a pair of mutually visible line segments.

![](contraction_map_cond.png){width=350px class="center"}\

$f$ is a *contraction mapping* iff $|\frac{f(x, \theta) - f(y,\theta)}{x-y} | < 1$


Geometry Influences Dynamics
----------------------------

For two mutually visible straight-line segments, this quantity (the *contraction
coefficient*) is independent of $x, y$ and depends only on $\theta$ and the
internal angle $\phi$ between the segments.

. . .

:::::::::::::: {.columns}
::: {.column width="50%"}

Can be used to check if transition between segments decreases uncertainty!

:::
::: {.column width="50%"}

![](bounce_images.gif){width=300px class="center"}\

:::
::::::::::::::


Limit Cycles
------------------

:::::::::::::: {.columns}
::: {.column width="70%"}


To write down a transition function for an entire cycle, compose individual
transition functions until the composition is a return map:

$$ F = f_1 \circ f_2 \circ \dots \circ f_n $$

A cycle is **stable** when $F$ is a
*contraction mapping*: two points under the mapping become closer together.

:::
::: {.column width="30%"}

![](cycles.gif){width=250 class="center"}\

:::
::::::::::::::

. . .

**Proposition:** For all start points on the boundary of all polygons, a constant
fixed-angle controller exists which will cause the robot's trajectory to enter a
stable limit cycle. (WAFR 2018)

Planning for Nondeterministic Bouncing Strategies
---------

**Planning Problem:** Given map, and start and goal sets on the boundary of the
polygonal environment, create a sequence of safe
nondeterministic actions that takes the robot from any point in the start set
to some point in the goal set.

. . .

Approach:

1. Partition boundary using "visibility events"
2. Create discrete *bounce visibility graph* using boundary segments
3. Search for paths and cycles (depending on specification)
4. Translate paths to strategies (sequences of nondeterministic "bounce rules")


Visibility Decomposition
------------------------

Equivalence relation on points along boundary with respect to what edges of
original polygon they can "see".


:::::::::::::: {.columns}
::: {.column width="50%"}

![](L_poly.jpg){width=300px class="center"}\

:::
::: {.column width="50%"}

![](L_diagram.jpg){width=300px class="center"}\

:::
::::::::::::::

Discrete representation: bounce visibility graph encodes *possible* transitions between these segments.


Defining Safe Actions
---------------------

Let an *action* for a bouncing robot be the heading of the robot as it leaves a
boundary (recall *rules* specify how actions are produced).

. . .

**Safe actions**: Given two segments $s$ and $g$ in the environment polygon, an
action set $(\theta_{min}, \theta_{max})$ is **safe** from $s$ to $g$ iff:

. . .

any action $\theta \in (\theta_{min}, \theta_{max})$,

. . .

executed from any point on $s$,

. . .

will cause the robot to transition to some point on $g$.


Forming the Safe Bounce Visibility Graph
----------------------------

**Nodes**: Boundary segments of *partitioned* polygon.

**Edges**: Directed edge created between nodes $i$ and $j$ if safe action exists between segment $i$ and
segment $j$.

. . .

Algorithm 1 of WAFR 2018 paper: polygon with $n$ vertices will produce bounce visibility
graph with $O(n^2)$ nodes and $O(n^4)$ edges.


Forming the Safe Bounce Visibility Graph
------------------------

:::::::::::::: {.columns}
::: {.column width="50%"}

![](L_poly.jpg){width=300px class="center"}\

:::
::: {.column width="50%"}

![Visibility Graph in Partitioned
Polygon](lp_bounce_visibility_graph.png){width=275px class="center"}

![Refined Safe Action Graph](lp_bounce_safe_action_graph.png){width=275px class="center"}

:::
::::::::::::::


Operations over the Safe Bounce Visibility Graph
--------------------------

Edges of graph can store data: maximum distance under that set of transitions,
maximum contraction coefficients, safe angle interval, etc. Allows for different
planning criteria.

. . .


**Query:** How far can we get with a constant nondeterministic bounce rule?

**Translates to:** use breadth-first search with constraint intersection on safe
angle intervals at each step.

![](inserted_two_conv.png){width=700px class="center"}\


More Examples of Search Queries
--------------------

Query: Get from start to goal while travelling less than X distance.

Approach: Search while bounding the maximum distance travelled by the robot by
labelling each edge with the maximum distance travelled in that transition set.

. . .

Query: Make a plan that is overall stabilizing.

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

Limitations:

- Assumes robot could start anywhere in start node/segment.
- Does not allow state splitting during the search.
- Does not refine search using information about uncertainty reduction.


Analyzing Reachability And Connectedness
-----------------------------------------


![](heat_map.png){height=190px}\ ![](scc_heatmap.png){height=190px}\ ![](wcc_heatmap.png){height=190px}\ 


Related to *link distance*, *art gallery* problems in computational geometry.


Beyond Bouncing Robots
----------------------

![](roomba_mars.jpg){width=400px}\


Wild Bodies
-----------

:::::::::::::: {.columns}
::: {.column width="60%"}

![L. Bobadilla, O. Sanchez, J. Czarnowski, K. Gossman, S. M. LaValle (2012). Controlling wild bodies using linear temporal logic. In Robotics: Science and Systems.](weaselballs-gates.gif){width=400px class="center"}

:::
::: {.column width="40%"}

![](pent_chaos.png){width=200px}\

:::
::::::::::::::


Self-Assembly
-------------


![Stanford YouTube Channel [^2]](figs/protein.gif){class="center" height=200px}

[^2]: \url{https://www.youtube.com/watch?v=Pjt1Q2ZZVjA}


Weaselball Hub Design
---------------------

<div class="center-text"> 

<img src="figs/weaselball_design_iterations.png" style="float:left;height:150px">
<img src="figs/weaselball_design4.jpg" style="float:right;height:150px">

</div>

:::::::::::::: {.columns}
::: {.column width="40%"}

<img src="figs/weaselball_stacked.jpg" style="float:left;height:200px">

:::
::: {.column width="60%"}

Work with Justin Wasserman, Austin Born, Chris Horn, John Born. Future work would include **controllable detatching** (electro-permanent magnets or
shape-memory alloys).

:::
::::::::::::::


Self-Assembly and Object Clustering
----------------

![Nilles, A., Wasserman, J., Born, A., Horn, C., Born, J., & LaValle, S. M. **A Hardware and Software Testbed for Underactuated Self-Assembling Robots.** 
In 2019 International Symposium on Multi-Robot and Multi-Agent Systems.](collective_formation.gif){class="center" height=200px}

![](figs/box3.gif){class="center" height=200px}

Motion Tracking and Analysis
----------------------------

:::::::::::::: {.columns}
::: {.column width="40%"}


![](weaselball_long_duration.png){height=200px}\

![](janus.mp4){height=200px}\

:::
::: {.column width="60%"}

![](rotation_heatmap.png){width=300px}

![](synchronizationRealLife.mp4){width=400px}\

:::
::::::::::::::


Research Insights and Questions
----------------------

1. Weaselballs are a pretty good example of "active Brownian" agents.
1. Control of macro states ("pressure", "temperature") can enable manipulation and other useful tasks.
2. Robot-robot interactions affect these macro-states.
3. Robot-boundary interactions affect these macro-states.
4. How to tune and design these interactions without running into the curse of dimensionality?


Information Requirements of Collision-Based Micro-Manipulation (WAFR 2020)
------------

![](environment_and_triangles.png){class="center" width=600px}

![Tommy Berrueta](tommy.jpg){width=100px}\ ![Ana Pervan](ana.jpg){width=100px}\


Information Requirements of Collision-Based Micro-Manipulation (WAFR 2020)
------------

![](FSMs.png){class="center" width=600px}

How much information do you need to know you're lost?

Interesting Takeaways
--------------

- Sensors only need to provide coarse spatial or directional information
- Given information history, three types of state estimation:
  - what states could I have started in to create this information history?
  - what states could I currently be in?
  - what states could I reach in the future (with a given controller)?


How Do We Tell Robots What To Do?
---------------------------------

- With Python or C++ scripts
- Maybe, adapt some kind of logic (probably LTL) to your task domain.
- Usually have precise control of individual robots. How to adapt to underactuated/emergent systems?
- Increasing interest in natural language interactions with humans to ease this burden.
- Maybe we won't ever be able to design robot motions in "one shot." How to enable iteration on motion strategies?
- Maybe the most useful thing the computer can do is provide feedback, so humans catch errors quickly.

Interfaces and Design
---------------------

![](improv_demo.mp4){class="center" width=600px}

with Dr. Amy LaViers, Dr. Mattox Beckman, Chase Gladish, Jordan Parker. Choreographers and movement observers have lots of
technologies for specifying movement! Published MOCO 2018.

Improv Details
---------------

:::::::::::::: {.columns}
::: {.column width="40%"}

![](improv_code_ex.jpg){width=300px class="center"}\

:::
::: {.column width="60%"}

![](improv-flowcart.png){width=400px class="center"}\

Design criteria (based on *Cognitive Dimensions of Notations*):

- closeness of mapping
- succinctness
- minimize hard mental operations
- allow progressive evaluation

:::
::::::::::::::


Let's be Creative!
------------------

:::::::::::::: {.columns}
::: {.column width="50%"}

![](design.png){width=300px class="center"}\

:::
::: {.column width="50%"}

![](some_cards.small.jpg){width=350px class="center"}\

:::
::::::::::::::


Conclusion
----------

Common Threads
-------------


- From simple interactions to robust behaviors
- Choice of representation really matters
- System design is an iterative process; tools should respect that



"Grand Challenges" of Robotics (Rodney Brooks)
------------------------------

- Aging population
- Urbanization
- Climate change

. . .

Minimalism as a route to sustainability?

. . .

E-kagen robots (Koichi Suzumori): "good enough" or "irresponsible". Less focus on extreme accuracy, more
on being robust and gentle.

:::::::::::::: {.columns}
::: {.column width="50%"}

![A. Molchanov, A. Breitenmoser, G. Sukhatme. Active Drifters: Towards a Practical Multi-Robot System for Ocean Monitoring. ICRA 2015.](drifter.jpg){height=200px}

:::
::: {.column width="50%"}

![](bees.jpg){height=200px}

:::
::::::::::::::


Acknowledgements
----------------

:::::::::::::: {.columns}
::: {.column width="20%"}

![](samara.jpg){height=90px}


![](wami.jpg){height=90px}

:::
::: {.column width="20%"}

![](israel.jpg){height=90px}

![](justin.jpg){height=90px} 

:::
::: {.column width="20%"}

![](yuliy.jpg){height=90px}

![](austin.jpg){height=90px} 

:::
::: {.column width="20%"}

![](amy.jpg){height=90px}

![](jordan.jpg){height=90px} 

:::
::: {.column width="20%"}

![](workshop.jpg){height=90px}

<p style="font-size:0.7em">
More undergrads: Chris Horn, John Born, Chase Gladish, Michael Zeng, Thomas
Driscoll, Jon Park
</p>

:::
::::::::::::::


:::::::::::::: {.columns}
::: {.column width="20%"}

![](nancy.png){height=90px}

![](uiuc-cs.jpg){height=90px}\

:::
::: {.column width="20%"}

![](sayan.jpg){height=90px}

![](geo.jpg){height=90px}\

:::
::: {.column width="20%"}

![](todd.jpg){height=90px}

![](hubler.jpg){height=90px}

:::
::: {.column width="40%"}

![](alli-steve-seth.jpg){height=200px}

:::
::::::::::::::



Thank you! Questions?
----------


Sources
-------


How to Implement?
-----------------

- Differential drive with bump sensors and side-facing range sensor ("rotate-to-parallel")
- Contact sensor and mechanical alignment of robot body ("rotate-until-free")
- Boundaries can be virtual (laser beams, GPS, visible boundaries, etc)

. . .

<div align="center" style="float:left;padding:0px">
<iframe width="275" height="275"
src="figs/robot_vid2.m4v"
frameborder="0" allowfullscreen>
</iframe></div>
<div align="center" style="float;padding:0px">
<iframe width="275" height="275"
src="figs/rotate.mp4"
frameborder="0" allowfullscreen>
</iframe>
<div align="center" style="float:right">
<img src="figs/Petronics-logo.png" style="width:200px">
</div>
</div>
