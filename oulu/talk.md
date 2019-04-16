% Robust Robot Behaviors from Simple Sensing and Motion Primitives
% Alli Nilles
% 17 April 2019


Robot Preview
-------------

<div class="center-text"> 

<img src="images/ucdavis_robot.jpg" style="float:left;width:300px">
<img src="images/cycles.gif" style="float:right;width:250px">

</div>

<div class="center-text"> 

<img src="images/weaselballs_movement.gif" style="float:left;width:250px">
<img src="images/improv_demo.gif" style="float:right;width:400px">

</div>


From Physics to Robotics
------------------------


- 2011-2015: degree in Engineering Physics at Colorado School of Mines

![](images/golden.jpg){width=400px class="center"}

. . .

> - Summer 2014: Research with Dr. Jim Crutchfield at UC Davis
> - Questions raised:
>   - What should be in the robot's "brain"?
>   - Can we automatically partition sensor histories into states that are "good"
      at predicting future events?
>   - How does environment structure impact the design/learning of the robot's internal
      representation?

From Physics to Robotics
-------------

> - Fall 2015: met Steve LaValle, started PhD
> - In his past life, he worked on *minimalism* and other interesting questions
    in robotics

![](images/illinois.gif){width=200px} ![](images/cats.jpg){width=200px} ![](images/flowers.jpg){width=300px}


Minimalist Mobile Robots
------------------------


![](images/robot_spectrum.jpg){width=750px class="center"}\


Guiding Principles
------------------

> - compliance and stabilizing dynamics (embedded / embodied computation) can reduce sensing and estimation requirements!
>   - work with physics, not against it ("carve nature at its joints")

> - identify task in information space, then track task-motivated information states, not
    necessarily physical states

A Specific Example
==================

Inspiration
-----------

Source: Nicholas Valera, YouTube
[https://www.youtube.com/watch?v=D_7LZawC-Dw](https://www.youtube.com/watch?v=D_7LZawC-Dw)

<div align="middle" style="padding:12px">
<iframe width="600" height="500" class="center"
src="images/roomba.mp4"
frameborder="0" allowfullscreen>
</iframe></div>



Motion Model
------------


Consider a point robot moving in a polygonal environment.

Ignore motion in interior of polygon (assume, for now, robot can move in
straight lines).

Robot can detect when it encounters a boundary.

![](images/bounce_examples.jpg){width=700px}

**Bounce rule:** determines action $u \in (0, \pi)$ at boundary.

**Goal:** Plan over strategies of sequential **bounce rules**.

Questions
---------

> - How far can the robot get with just one bounce rule (or two, or three...)?
> - How robust are these strategies to uncertainty?
> - What is the effect of environment geometry? What environments are
    easy to navigate with this type of motion and what environments are hard?

Interesting Baseline Behaviors
------------------------------


Iterating the same rule can cause cycles and trapping regions:

![](images/twoconv.gif){width=300px class="center"}

. . .

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
> 3. Search for safe paths and cycles (depending on task)
> 4. Translate paths to strategies

. . .

For more, see our WAFR paper...

A Visibility-Based Approach to Computing Nondeterministic Bouncing Strategies. A. Q. Nilles, Y. Ren, I. Becerra, S. M. LaValle. In the 13th Annual Workshop on the Algorithmic Foundations of Robotics, 2018.


Next Steps
----------

> - Characterize how stabilization from cycles interacts with uncertainty
>   - stable and unstable manifolds for constant bounce strategies

. . .

> - Different model choices: curved paths, higher dimensions
> - Localization with simple sensors (laser beams)

Next Steps
----------


> - Finding best places to augment environment with new obstacles or sensors
> - Software toolbox for designing mobile robot trajectories
>   - Goal: educational game and/or interactive design tool

. . .

![](images/Domjot_table.jpg){width=500px class="center"}


An Even More Minimal Robot?
===========================


Wild Bodies
---------------------

<div align="middle" style="padding:24px">
<iframe width="600" height="500" class="center"
src="images/large_weaselballs.mp4"
frameborder="0" allowfullscreen>
</iframe></div>


Information Spaces for Wild Bodies
----------------------------------

![](images/ispace_example.jpg){width=700 class="center"}

. . .

We can **control** density of bodies on a per-room basis, using environment
design. [^1]

And we can **track** number of bodies per room, using laser beam placement. [^2]

[^1]: Stochastic modeling, control, and evaluation of wild bodies. D. E. Gierl, L. Bobadilla, O. Sanhcez, and S. M. LaValle. In IEEE International Conference on Robotics and Automation, 2014.

[^2]: Counting moving bodies using sparse sensor beams. L. E. Erickson, J. Yu, Y. Huang, and S. M. LaValle. IEEE Transactions on Automation Science and Engineering, 10(4):853--861, 2014.


What are these "uncontrollable" robots good for?
-----------------------------------------------

> - data collection in extreme environments such as space, remote wilderness, ocean
> - micro-scale robots for biological experiments and medical applications
>   - "active Brownian" and "Janus" particles can propel themselves!

. . .

Our platform could serve as a testbed for control approaches (easier to 
manufacture and observe than micro-scale particles)


[^3]: ETH Zurich, Department of Materials YouTube channel
[^4]: Li, Jinxing, et al. "Self-propelled nanomotors autonomously seek and repair cracks." Nano letters 15.10 (2015): 7077-7085.


Examples
--------

<div align="middle" style="padding:24px">
<iframe width="600" height="500" class="center"
src="images/vids_smaller.mp4"
frameborder="0" allowfullscreen>
</iframe></div>



Goals of This Project
-----

> - **hardware** platform for experiments on control of active particle systems
> - **software** library for trajectory analysis and system design
> - **representations and filters** which are useful for scalable
    system control and monitoring

. . .

What tasks do we care about?

> - *coverage:* specify ensemble spatial density
> - *self-assembly:* specify desired distribution of shapes or sizes of assemblies
> - *rendezvous:* all robots meet somewhere, to share state, etc
> - *manipulation:* move or cluster objects in environment


Weaselball Hub Design
---------------------

![](images/weaselballs.jpg){width=700px class="center"}


![](images/weaselball_stacked.jpg){width=250px class="center"}


Particle Simulator
------------------


<div align="middle" style="padding:24px">
<iframe width="350" height="350"
src="images/collisions.mp4"
frameborder="0" allowfullscreen>
</iframe>
<iframe width="350" height="350"
src="images/ren9_1.mp4"
frameborder="0" allowfullscreen>
</iframe>
</div>


Control Ensemble, Not Individuals
---------------------------------

> - By controlling ensemble distributions of shapes and sizes, we can control ensemble dynamics.
> - Self-assembly (and disassembly) and collective manipulation do not have
to be independent tasks!
> - Smaller assemblies are faster, more mobile
> - Larger assemblies are less mobile, tend to be chiral, unless synchronized...

. . .

How to move from attach/detach rules to ensemble distributions? Starting to sound like thermodynamics...

Information States of Assembly
------------------------------


**Example 1: Counting Components** 

- sensor: 
   - $y = 1$ if a connection event happens
   - $y = -1$ if a disconnection event happens
- $\sum_i y_i = N$, the number of disconnected components at stage $i$


Information States of Assembly
------------------------------

**Example 2: "Pressure"**


$$ PV \propto nT $$

> - volume constant (fixed environment)
> - n known, or controllable
> - pressure is force exerted on environmental boundaries (what sensors would we need?)
> - "temperature" is a function of the characteristic velocities of the agents
>    - many, fast agents $\to$ high pressure
>    - fewer, slow agents $\to$ low pressure

. . .

Varied spatial "pressure" leads to manipulation through mechanical interactions

Toward Distributed Population Controllers
-----------------------------------------

Different equilibriums established from different rules for when to "detach".

$$ p(detach | I-state) = \quad ? $$

onboard I-state choices:

> - time since last attachment
> - size of current assembly (requires local comms)
> - frequency of collisions
>    - over what time window?
>    - can we distinguish other robots from the environment?

. . .

system I-state choices:

> - movement of objects (crossing beams)
> - "thermometer" or "pressure sensor" on walls or in certain regions


Next Steps
----------

Try different information spaces and see which correspond well with different
modes of the system.

. . .

Change hub geometry to affect:

- the spatial probability of attaching (directed self-assembly) [^5]
- "scattering" interactions with walls (leave walls at more specific angle)

[^5]: Bhalla, N., Ipparthi, D., Klemp, E., & Dorigo, M. (2014, September). A geometrical approach to the incompatible substructure problem in parallel self-assembly. In International Conference on Parallel Problem Solving from Nature (pp. 751-760). Springer, Cham.

. . .

Co-design environment with controllers and sensors?

. . .

Agents can influence environment to guide robot-robot interactions (stigmergy)? 


Programming Underactuated Robots
================================


Most Robot Programming Looks Like This
--------------------------------------

```python
if __name__ == '__main__':
    pub = rospy.Publisher('turtle1/cmd_vel',Twist)
    rospy.init_node('publisher_node')
    loop_rate = rospy.Rate(5)
    while not rospy.is_shutdown():
        vel=Twist()
        vel.linear.x = 1.0
        vel.angular.z = 1.0
        pub.publish(vel)
        loop_rate.sleep()
```

![](images/turtle.png){width=300px class="center"}


Programming Patterns for Music
------------------------------

![](images/algorave.jpg){width=600px class="center"}

```python
perk drums
pp ->         |z   v     z v   z   v     z v   |(1~2)/2^8^

I know it breaks your heart
Moved to the city in a broke-down car
```

\url{https://deerful.com}
\url{https://algorave.com}


Principles for Usability
------------------------

> - *Closeness of mapping*: "Ideally, the
problem entities in the user's task domain could be mapped directly onto
task-specific program entities, and operations on those problem entities would
likewise be mapped directly onto program operations" [^6]
> - *Diffuseness*: How many symbols or graphic entities are required to express a meaning?
> - *Error-proneness*: Does the design of the notation induce "careless mistakes"?
> - *Hard mental operations*: Are there places where the user needs to resort to  fingers or pencilled annotation to keep track of what's happening?
> - *Progressive evaluation*: Can a partially-complete program be executed to
obtain feedback on "How am I doing"?

[^6]: Green, T. R. G.; Petre, M. (1996). "Usability analysis of visual programming environments: A 'cognitive dimensions' framework". Journal of Visual Languages and Computing. 7: 131–174. CiteSeerX 10.1.1.22.1477. doi:10.1006/jvlc.1996.0009

Initial Prototype
-----------------

From 

```python
if __name__ == '__main__':
    pub = rospy.Publisher('turtle1/cmd_vel',Twist)
    rospy.init_node('publisher_node')
    loop_rate = rospy.Rate(5)
    while not rospy.is_shutdown():
        vel=Twist()
        vel.linear.x = 1.0
        vel.angular.z = 1.0
        pub.publish(vel)
        loop_rate.sleep()
```

to

```python
turtle1 $ forward || left
```


Keep Number of Operators Small
------------------------------

Motion Primitives:

```
rest  
forward 
left  
halfleft
right 
halfright 
```

Combinators:

```
movement $\rightarrow$ & prim 
         $|$ & movement movement 
         $|$ & [movement] 
         $|$ & (movement) 
         $|$ & movement $||$ movement  
         $|$ & transformer movement 
```

Transformers:

```
transformer $\rightarrow$ & reverse 
  $|$ & retrograde 
  $|$ & repeat n 
  $|$ & reflect ax 
  
exp $\rightarrow$ & rs \$ movement 
    $|$ & var $=$ movement
```

Next Steps
----------


Conclusion
-------



Thank you! Questions?
----------


#### Presentation Template from https://github.com/PeterMosmans/presentation-template ####


