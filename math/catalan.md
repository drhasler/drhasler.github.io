---
title: Catalan numbers
has_math: yes
---

The Catalan numbers is a sequence that appears in various counting problems
such as:

- In how many ways can you triangulate a (n+2)-gon?
- How many well formed sequences of n pairs of parentheses is there?

![hex-triangulation](/res/cat1.png)

## Explicit formula

As you may have guessed, this is the answer:

$$
C_n = \binom{2n}n - \binom{2n}{n+1} = \frac1{n+1} \binom{2n}n
$$

## Recursive formula

The recursive formula should help you understanding what is happening:

$$
C_{n+1} = \sum_{k=0}^n C_k \ C_{n-k}
$$

We will show ho this relates to the two problems we introduced at the beginning.

### Triangulations

We want to count the number of triangulations a (n+2)-gon could have:

- consider the top side as anchor.
- now iterate over all other vertices and to form the red triangle.
- for each splitting, we consider all possible polygon
  triangulations on both sides.

![red-triangulation](/res/cat2.png)

Uniqueness is given by the red triangle: the only triangle sharing this top-edge.

### Parentheses

How can the number of triangulations of a (n+2)-gon
match the number of well formed
sequences of n pairs of parentheses ?  
We can think of parentheses sequences as mountains:
```
(()())()
 /\/\ 
/    \/\
```
Assuming we have this correspondance for smaller n,
the first positive index (divided by 2) at which the mountain
is touching the ground is the same as the one the red triangle
points to. then we can see that it splits the first elevated
mountain chain from the rest.
