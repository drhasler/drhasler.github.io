
# catalan numbers
- in how many ways can you triangulate a (n+2)-gon ?
![cat](../res/catalan1.png)
- how many well formed sequences of n pairs of parenthesis is there ?

## explicit formula
if you are into math you would probably prefer an explicit formula

C(n) = binom(2n,n) - binom(2n,n+1) = binom(2n,n) / (n+1)

## recursive formula

C(n+1) = sum 0<=k<=n of C(k) * C(n-k)

but why?

lets consider the triangulation of the (n+2)-gon:

we consider the top side and its left vertex as anchor

we now iterate over all other vertices
![cat](../res/catalan2.png)

uniqueness is given by the triangle that contains this edge
and we can consider all possible polygon triangulations on both sides
multiplied since independant

