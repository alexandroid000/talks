---
aspectratio: 169
title: Lecture 10
subtitle: Forward Kinematics
author: |
    | Alli Nilles 
    | Modern Robotics Chapter 4
date: October 1, 2019
...

What is "Forward Kinematics"?
=============================


**Kinematics**: a branch of *classical mechanics* that describes motion of
bodies without considering forces. AKA "the geometry of motion"

. . .

**Forward kinematics**: a specific problem in robotics. Given the individual state of each
joint of the robot (in a local frame), what is the position of a
given point on the robot in the global frame?


. . .

![](images/ur5_example.jpg){width=600px class="center"}\


Beginning Assumptions
=====================

> - Our robot is a kinematic chain, made of rigid *links* connected by movable
*joints*
> - No branches or loops (will discuss later)
> - All joints have one degree of freedom and are *revolute* or *prismatic*

. . .

![](images/1DOFjoints.jpg){width=520px class="center"}\

Product of Exponentials Formula
===============================

**Key Idea:** Model each joint as applying a screw motion to all links beyond
it.

. . .

Let each joint $i$ have an associated parameter $\theta_i$ that defines its
configuration (rotation angle for revolute joints, translation amount for
prismatic).

. . .

Initialization:

> - Choose a fixed, global base frame $\{s\}$
> - Choose an "end effector" frame $\{b\}$ fixed to the robot
> - Put all joints in "zero position"
> - Let $M \in SE(3)$ be the configuration of $\{b\}$ in the $\{s\}$ frame when
robot is in zero position

Product of Exponentials Formula
===============================

For each joint $i$, define the *screw axis* as a unit vector $\omega_i$ pointing
along the axis of rotation in the base frame, as well as a displacement term
$v_i$ equal to the distance from the origin of the base frame.

$$ \mathcal{S}_i = \begin{bmatrix} \omega_i \\ v_i \end{bmatrix} $$

. . .

**Note:** this is a screw *axis*, not a screw *motion*.

Product of Exponentials Formula
===============================

The screw axis $\mathcal{S}_i$ can be expressed in matrix form as

$$
[\mathcal{S}_i] = \begin{bmatrix}
[\omega_i] & v \\
0 & 0
\end{bmatrix}
$$

where $[ \ldots ]$ is the skew symmetric form.

. . .

**Reminder:**
Given arbitrary $(R,p) \in SE(3)$, we can find a screw axis $\mathcal{S} =
(\omega, v)$ and a scalar $\theta$ such that

$$
e^{[\mathcal{S}]\theta} = \begin{bmatrix}
R & p \\
0 & 1
\end{bmatrix}
$$

. . .

This form composes nicely through multiplication, giving us the **Product of
Exponentials (PoE)** formula!

A Side Note on Representations
===============================

So this fancy screw motion matrix exponential is just another way to write down
homogenous transformations in three dimensions!

. . .

Our usual homogenous transformation matrices can also be used for forward
kinematics (this is usually called the Denavit-Hartenberg (DH) representation).

. . .


But screw motions are a more *natural* model for the kinds of robots we are
discussing.

. . .

With DH parameterization, we define a frame for each link in the frame of the
previous link. So to compute the position of the end effector, a frame for each
link must be defined.

. . .

With screw motions, we have only two reference frames (the base and the end
effector), and then each joint screw motion is defined in the base frame.



Simple Example
==============


![](images/3Rchain.jpg){width=700px class="center"}\


Video
=====


<div align="center" style="float:left;padding:24px">
<iframe width="300" height="275"
src="images/robot_vid2.m4v"
frameborder="0" allowfullscreen>
</iframe></div>


#### Presentation Template from https://github.com/PeterMosmans/presentation-template ####


