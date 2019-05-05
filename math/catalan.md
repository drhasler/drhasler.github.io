---
title: catalan numbers
has_math: yes
---

![cat](/res/cat1.png)

- in how many ways can you triangulate a (n+2)-gon ?
- how many well formed sequences of n pairs of parenthesis is there ?

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

![cat](/res/cat2.png)

uniqueness is given by the red triangle: the only triangle containing this top-edge.

<script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML' async></script>
