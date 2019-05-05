# catalan numbers

![cat](/res/cat1.png)

- in how many ways can you triangulate a (n+2)-gon ?
- how many well formed sequences of n pairs of parenthesis is there ?

## explicit formula

you into math ? here you go

$$
C(n) = binom(2n,n) - binom(2n,n+1) = binom(2n,n) / (n+1)
$$

## recursive formula

C(n+1) = sum 0<=k<=n of C(k) * C(n-k)

but why?

lets consider the triangulation of the (n+2)-gon:

we consider the top side as anchor.
we now iterate over all other vertices
and we can consider all possible polygon triangulations on both sides
multiplied since independant
![cat](/res/cat2.png)

uniqueness is given by the triangle that contains this top-edge

<script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML' async></script>


