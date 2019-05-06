---
title: Catalan numbers
has_math: yes
---

![hex-triangulation](/res/cat1.png)

- in how many ways can you triangulate a (n+2)-gon ?
- how many well formed sequences of n pairs of parentheses is there ?
- other shady applications

## explicit formula

you into math ? here you go

$$
C_n = \binom{2n}n - \binom{2n}{n+1} = \frac1{n+1} \binom{2n}n
$$

## recursive formula

$$
C_{n+1} = \sum_k^n C_k \ C_{n-k}
$$

but why?

lets consider the triangulation of the (n+2)-gon:

we consider the top side as anchor.
we now iterate over all other vertices and form a red triangle.
We can then consider all possible polygon triangulations on both sides.

![red-triangulation](/res/cat2.png)

uniqueness is given by the red triangle: the only triangle sharing this top-edge.

## parentheses

how can the number of ways of triangulating an n+2 polygon match the number of well formed
sequences of n pairs of parentheses ?
We can think of parentheses sequences as mountains:
```
(()())()
 /\/\ 
/    \/\
```
Assuming we have this correspondance for smaller n, the first positive index (divided by 2) at which the mountain is touching the ground is the same as the one the red triangle points to. then we can see that it splits the first elevated mountain chain from the rest. :)
