---
title: Case Studies in Robotics Toolchains
theme: Pittsburgh
color: beaver
header-includes:
	- \usepackage{svg}
	- \usepackage{jeffe}
author: |
    | Alli Nilles
    | \hfill
    | ![](figures/standards.png)
...


Roadmap
-------

1.  Case Studies

    i)  Low level: Arduino
    i)  High level: ROS

2.  Lessons?

    i)  power vs. simplicity vs. flexibility (vs. verifiability?)
    i)  Ideas from functional programming

How to Evaluate Tools?
----------------------

![](./figures/venn.pdf)\


Case Study: Arduino Hacking
-----------------------------

\columnsbegin
\column{.5\textwidth}

-	Measure rotation of rolling ball robot, reconstruct motion
-	Easy to get rough estimate, hard to get exact
-	Need small footprint, onboard data logging

\column{.5\textwidth}

![](./figures/imu.jpg)

\columnsend

Case Study: Takeaways
---------------------

-   Simplicity: where we tell beginners to start matters
    -   Is traditional C++ style programming the best place to start?
-   Powerful: large community
-   Lose flexibility when tied to Arduino platforms/libraries/IDE

Possible solutions:

-   mBed: about as simple and powerful, more flexible through online IDE
-   possible fork into high-level and low-level languages
    -   microPython
    -   llvm for devices?

Case Study: ROS
---------------

\columnsbegin
\column{.5\textwidth}

My use cases:

-   Data logging
-   Playing with Spheros
-   Bluetooth and ROS

\column{.5\textwidth}

![](figures/jade.png)\

\columnsend

Case Study: ROS
---------------

-   flexible: large community, integrated with many platforms
-   powerful: scalable framework, solid protocols
-   simple?
    -   networking issues
    -   versioning issues: gazebo7 for Kinetic, gazebo2 for Indigo
    -   XML / catkin

Case Study 3: ROS
-----------------

```xml

<launch>
    <arg name="world" default="simple_world"/>
    <arg name="init_pos_x" default="0.0"/>
    <arg name="init_pos_y" default="0.0"/>

	<node pkg="gazebo_ros" type="spawn_model"
		name="spawn_robot"
		respawn="false" output="screen"
		args="-param robot_description
        -urdf
        -x $(arg init_pos_x)
        -y $(arg init_pos_y)
        -z $(arg init_pos_z)
        -model youbot">
    </node>
</launch>

```

Alternative
-----------

```yaml

- world: simple_world
- init_pos_x: &init_pos_x 0.0
- init_pos_y: &init_pos_x 0.0
- node:
	- pkg: gazebo_ros
	- type: spawn_model
	- name: spawn_robot
	- respawn: false
	- output: screen
	- args:
		- param robot_description
        - urdf
        - x *arg init_pos_x
        - y *init_pos_y
        - z *arg init_pos_z
        - model youbot

```

Case Study 3: ROS
-----------------

-   Lack of simplicity leads to wasted time
-   Low level timing issues left to user
    -   callbacks, "spinOnce"
    -   hard to enforce logic on Topics: what if I want to do something only
        when I have a pair of new values from two topics that publish at
        different rates?

Possible Solution: Haskell Client
---------------------------------

Credit to Anthony Cowley [^1], UPenn GRASP lab

[^1]:
  [https://github.com/acowley/roshask](https://github.com/acowley/roshask)

```haskell
sayHello =
	Topic $ do threadDelay 1000000
		t <- getCurrentTime
		let msg = S.String ("Hello world " ++ show t)
		return (msg, sayHello)
```
Problems:

-   time delay is brittle and hardcoded
-   delay is orthogonal to task of operating on value
-   verbose

roshask
-------

```haskell
sayHello :: Topic IO S.String
sayHello = repeatM (fmap mkMsg getCurrentTime)
	where mkMsg = S.String . ("Hello world " ++) . show

main = 	runNode "talker"
		$ advertise "chatter" (topicRate 1 sayHello)

```

Advantages:

-   Can optimize topicRate and reuse
-   Operation on data is independent of rate plumbing

Other nice things about roshask:

-   `everyNew` function
-   composable nodes: data on one machine is shared, not streamed, while
    preserving modularity

But why Haskell?
----------------

-   High-level robotic control is functional in style
-   Built around infinite lists: natural for robotics
-   Type safety (already in ROS message types)
-   Lack of side-effects means robots that act more consistently and are easier
    to verify
-   Large community, Foreign Function Interface (FFI) is hardware-friendly
