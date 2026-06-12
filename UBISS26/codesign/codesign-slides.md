## Outline

- What is co-design?
- Approaches to co-design

# What is Co-Design?

## Collaborative Design

![Source: Andrea Censi](figs/collaborators.png){height=200px}

## Resources and Functionality

>- Resources must be accounted for and assigned *costs*
>- Functionality can be quantified and represented as *constraints*
>- Feasibility vs. optimality of functionality
>- Rather than fixing a certain functionality requirement, we can design functionality *at the same time as* designing resource usage
>- *Concurrent Design*

## Feedback in Design

\centering

![](figs/feedback.png){height=200px}

. . .

Irreducible complexity: either converges, or spirals into infinity.

## Co-Design of Hardware and Control

![Fadini, Gabriele, Thomas Flayols, Andrea Del Prete, and Philippe Souères. "Simulation aided co-design for robust robot optimization." IEEE Robotics and Automation Letters 7, no. 4 (2022): 11306-11313.](figs/codesign-control.png){height=200px}

# Approaches to Solving Co-Design Problems

## Optimization

> - Formulate modules with requirements and functionality as constraint functions
> - Ideally, use linear/quadratic programming
> - Often NP-hard but "fast enough" with careful modelling
> - Requires careful system approximations and simplifications

![\tiny Ziglar, Jason, Ryan K. Williams, and Alfred Wicks. "Context-aware system synthesis, task assignment, and routing." Autonomous Robots 47.2 (2023): 193-210.](figs/ilp-task-modules.png){height=120px}

## Combinatorial Optimization

:::::::::::::: {.columns align=center}
::: {.column width="50%"}
\centering
![Wilhelm, Andrew, and Nils Napp. "Constraint Programming for Component-Level Robot Design." In 2023 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS), pp. 460-466. IEEE, 2023.](figs/bipartite.png){height=150px}
:::
::: {.column width="50%"}
> - "the efficacy of constraint programming critically depends upon the
orderings of variables and their domain values..."
> - requires careful design of heuristics
> - lots of opportunities for study of effective design processes!
:::
::::::::::::::

## Gradient-Driven Optimization

- easier with "smooth" design spaces
- strategies for soft and rigid robots differ

![Spielberg AE. Co-Optimization and Co-Learning Methods for Automated Design of Rigid and Soft Robots (Doctoral dissertation, Massachusetts Institute of Technology).](./figs/smoothing-torque.png){height=150px}

## Simulation-Driven Co-Design

\centering

![Spielberg AE. Co-Optimization and Co-Learning Methods for Automated Design of Rigid and Soft Robots (Doctoral dissertation, Massachusetts Institute of Technology).](figs/sim-loop.png){height=200px}

See also: genetic algorithms, reinforcement learning, etc.

## Monotone Co-Design Problems (MCDPs)

![Source: Andrea Censi](figs/codesign-def.png){height=200px}

## Monotone Co-Design Problems (MCDPs)

![Source: Andrea Censi](figs/codesign-ex.png){height=200px}

## MCDPs and Category Theory

\centering

![\tiny B. Fong, D.I. Spivak, An Invitation to Applied Category Theory, 2019. https://doi.org/10.1017/9781108668804.](figs/profunctors.png){height=175px}

**Takeaway:** Problem is well-structured (and fun). Known algorithms (Kleene's) can efficiently find solutions.

## Monotone Assumption

\centering

When does it break down?

![Source: Andrea Censi](figs/codesign-ex.png){height=200px}

## Applications of MCDPs

![Source: Zardini, Gioele, Nicolas Lanzetti, Andrea Censi, Emilio Frazzoli, and Marco Pavone. "Co-design to enable user-friendly tools to assess the impact of future mobility solutions." IEEE Transactions on Network Science and Engineering 10, no. 2 (2022): 827-844.](figs/transit-codesign.png){height=200px}

## Solution Space of MCDPs

\centering

![Source: Wikipedia, By Nojhan - Own work, CC BY-SA 3.0, https://commons.wikimedia.org/w/index.php?curid=770240](figs/pareto.png){height=200px}

*Pareto Front*

## Automatic Design of Monotone Subsystem Discretizations

![Wilhelm, Andrew, and Nils Napp. "Monotone Subsystem Decomposition for Efficient Multi-Objective Robot Design." In 2025 IEEE International Conference on Robotics and Automation (ICRA), pp. 8114-8120. IEEE, 2025.](figs/pareto2.png){height=200px}

## Quality-Diversity Algorithms

\centering

![Mouret, Jean-Baptiste, and Jeff Clune. "Illuminating search spaces by mapping elites." arXiv preprint arXiv:1504.04909 (2015).](figs/map-elites.png){height=200px}

See also: Marc Toussaint keynote @ WAFR 2026

## Human In-The-Loop

:::::::::::::: {.columns align=center}
::: {.column width="50%"}
- Problem with prior approaches is you must fully model everything before you apply the algorithm
- ``A lot of times, people don't know what they want until you show it to them.'' - Steve Jobs
:::
::: {.column width="50%"}
![Nilles, Alexandra Q., Dylan A. Shell, and Jason M. O'Kane. "Robot design: Formalisms, representations, and the role of the designer." arXiv preprint arXiv:1806.05157 (2018).](figs/design-w-human.png){height=200px}
:::
::::::::::::::


## Summary

> - Structure of robot design problem creates interesting theoretical questions in automated design
> - Traditional optimization approaches struggle with complexity of robot co-design problem
> - There is no getting around careful encoding of resources, constraints, and functionality
> - As systems scale, the importance of principled and high-assurance design methods becomes clear
