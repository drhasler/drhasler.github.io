---
has_math: yes
---

# Spanning Trees
A spanning tree of a connected undirected graph is a tree (acyclic graph) containing all vertices of the graph, and a subset of its edges

## Minimum Spanning Tree
A minimum spanning tree of a weighted graph is a spanning tree with minimal sum of its edges weights (assumed to be non-negative for simplicity sake). It is not unique.

You need to be confident with the two best known MST algorithms
> **Kruskal's**: start with a forest and connect them using smallest edges first  
> **Prime's**: start with a single vertex and add nearest neighbor until connected

## Number of distinct spanning trees
There are known formulæ for specific graphs.

### Cayley
For example the number of spanning trees of a connected graph of n vertices is
given by Cayley's formula: $n^{n-2}$.  
Proof for n>1: we uniquely identify each spanning tree set by its connected component containing vertex 1, if we remove all edges touching vertex 2. Lets denote the size of this connected component k.
Then (hopefully math is not broken)

$$
C_n
= \sum_{k=1}^{n-1} k \binom n k C_k C_{n-k}
= \sum_{k=1}^{n-1} k \binom n k k^{k-2} (n-k)^{n-k-2}
= n^{n-2}
$$

_pls check math_

### Kirchhoff
A more general statement is Kirchhoff's theorem.
We construct the laplacian matrix of the graph: take a diagonal matrix containing the degree of each vertex and remove from it the 0-1 adjacency matrix.
The number of spanning trees is equal to any cofactor of this matrix :o
