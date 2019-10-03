---
title: Lecture 11
subtitle: Forward Kinematics
author: |
    | Alli Nilles 
    | Modern Robotics Chapter 4
date: October 3, 2019
aspectratio: 169
...


Admin
=====

> - Homework 4 should be demonstrated individually to your TA in lab by next
week.
> - Homework 5 is due this Friday.
> - Lab 2 is due this week.

Last Time
=========


![](images/3Rchain.jpg){width=500px class="center"}\


$$
T(\theta) = e^{[\mathcal{S_1}]\theta_1} \ldots
e^{[\mathcal{S_{n-1}}]\theta_{n-1}} e^{[\mathcal{S_{n}}]\theta_{n}} M
$$


Approach
========

> - Choose a fixed, global base frame $\{s\}$
> - Choose an "end effector" frame $\{b\}$ fixed to the robot
> - Choose a "zero position" for all joints
> - Let $M \in SE(3)$ be the configuration of $\{b\}$ in the $\{s\}$ frame when
robot is in zero position

. . .

$M$ defines the initial pose of the end effector in the global frame.

. . .

Transforming $M$ transforms the pose of the end effector!


Applying Joint Motions
======================


1. Define screw axis $S_i$ for each joint in the zero position in global frame
    - for revolute joints, this is the axis of rotation $\omega$ and the
        "tangential velocity" $v = - \omega \times q$

. . .

2. Compute $e^{[S_i] \theta}$ for each screw motion

. . .

3. Multiply terms in correct order (furthest joint affects $M$ first)

. . .

$$
T(\theta) = e^{[\mathcal{S_1}]\theta_1} \ldots
e^{[\mathcal{S_{n-1}}]\theta_{n-1}} e^{[\mathcal{S_{n}}]\theta_{n}} M
$$


Actual Form of Matrix Exponential
=================================


![](images/expansion.jpg){width=600px class="center"}\

. . .

![](images/explicit1.jpg){width=700px class="center"}\

![](images/explicit2.jpg){width=400px class="center"}\

How to Compute?
===============

![](images/explicit1.jpg){width=700px class="center"}\

How to compute $e^{[\omega]\theta}$?

. . .

Same way we compute any matrix exponential!

$$
e^{[\omega]\theta} = I + [\omega]\theta + [\omega]^2 \frac{\theta^2}{2!} + [\omega]^3 \frac{\theta^3}{3!}
+ \ldots
$$

But what is $[\omega]^3$?

Computing Exponential Coordinate of Rotation
============================================

\begin{align*}
e^{[\omega]\theta} & = I + [\omega]\theta + [\omega]^2 \frac{\theta^2}{2!} + [\omega]^3 \frac{\theta^3}{3!}
+ \ldots \\
e^{[\omega]\theta} & = I + (\theta - \frac{\theta^3}{3!} + \frac{\theta^5}{5!} -
\ldots) [\omega] + 
(\frac{\theta^2}{2!} - \frac{\theta^4}{4!} + \frac{\theta^6}{6!} - 
\ldots) [\omega]^2
\end{align*}

. . .

And we know that

\begin{align*}
\sin{\theta} & = \theta - \frac{\theta^3}{3!} + \frac{\theta^5}{5!} - \ldots \\
\cos{\theta} & = 1 - \frac{\theta^2}{2!} + \frac{\theta^4}{4!} - \ldots
\end{align*}

Computing Exponential Coordinate of Rotation
============================================

So we have

$$
e^{[\omega]\theta} = I + \sin{\theta} [\omega] + (1-\cos{\theta}) [\omega]^2
$$

. . .

What kind of movement does this represent?

. . .

What is the difference between this and $e^{[S_i]\theta}$?


One More Example
================

![](images/RRP.png){width=250px class="center"}\


Example
=======

What is $M$?

. . .

$$
M = \begin{bmatrix}
1 & 0 & 0 & 0 \\
0 & 1 & 0 & L_3 \\
0 & 0 & 1 & L_1 + L_2 \\
0 & 0 & 0 & 1 \\
\end{bmatrix}
$$

. . .

What are $\omega_i$ and $v_i$ for each joint?

. . .

$\omega_1 = (0, 0, 1)$ and $v_1 = (0,0,0)$

. . .

$\omega_2 = (1, 0, 0)$ and $v_2 = (0,L_1 + L_2,0)$

. . .

$\omega_3 = (0, 0, 0)$ and $v_3 = (0,1,0)$


PoE in the End-Effector Frame
=============================

We have the identity

$$
e^{M^{-1} P M} = M^{-1} e^{P} M
$$

. . .

which can be rewritten as

$$
e^P M = M e^{M^{-1} P M}
$$


PoE in the End-Effector Frame
=============================

![](images/tranformToBody1.jpg){width=600px class="center"}\

. . .

![](images/tranformToBody2.jpg){width=600px class="center"}\

. . .

![](images/tranformToBody3.jpg){width=600px class="center"}\

What is $M^{-1} [S_i] M$?

. . .

![](images/tranformToBody4.jpg){width=600px class="center"}\


Now, fun stuff!
===============

<div class="row">
<div class="column" width="70%">

<div align="center" style="float;padding:24px">
<iframe width="500" height="400"
src="images/mochibot.mp4">
</iframe></div>

</div>
<div class="column" width="30%">

Keio University and University of Tokyo, IROS 2018

</div>
</div>

Closed Kinematic Chains
=======================

What if my robot isn't just a chain, but has branches or loops?

![](images/closed.jpg){width=600px class="center"}\

Where is the "base"??


Closed Kinematic Chains
=======================

Break and turn into a tree:

![](images/open.jpg){width=500px class="center"}\

Closed Kinematic Chains
=======================

Write down transformations for each branch:

![](images/upper.jpg){width=500px class="center"}\

![](images/lower.jpg){width=500px class="center"}\


Closed Kinematic Chains
=======================

But we need to enforce closure:

![](images/equality.jpg){width=600px class="center"}\

Very difficult to characterize even in simple cases, often impossible!

Four-Bar Linkages
=================


<div class="row">
<div class="column" width="50%">

<div align="center" style="float;padding:24px">
<iframe width="300" height="300"
src="images/pumpjack.mp4">
</iframe></div>

</div>
<div class="column" width="50%">

![](images/trammel.gif){width=300px class="center"}\

</div>
</div>

Other types of joints
=====================

![](images/joints.jpg){width=600px class="center"}\

Discussion on Representations
===============================


Our fancy screw motion matrix exponential is just another way to write down
homogenous transformations in three dimensions!

. . .

Our usual homogenous transformation matrices can also be used for forward
kinematics (this is usually called the Denavit-Hartenberg (DH) representation).

. . .

With DH parameterization, we define a frame for each link in the frame of the
previous link. So to compute the position of the end effector, a frame for each
link must be defined in terms of the previous link.

. . .

With screw motions, we have only two reference frames (the base and the end
effector), and then each joint screw motion is defined in the base frame.


URDF
====

![](images/urdf.png){width=700px class="center"}\

![](images/universal.jpg){width=300px class="center"}\

Wow!
====


