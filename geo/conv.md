---
title: Convexity
has_math: yes
---

computational geometry is a hott topic.

here we will only deal with polygons, and talk a bit about convexity.

in a nutshell, convexity enables you to find the closest edge/vertex to a line,
or construct the intersection of two convex polygons in $\log$ time.

# intersection with a line

we start at any point and consider that the polygon edges are oriented "clockwise"[^1]

we consider a direction (the normal vector to the line) and want to minimize/maximize the dotprod with it,
by moving around the polygon vertices.
this will tell us whether there is an intersection.

once we have this information and the two extreme points, on both "sides", we can find an intersecting segment.

## simple iteration
both task can be performed in O(n) by trying out each vtx, but this is too slow for our standards

## smart iteration
we can use the edge orientation. we know that the dotprod with the normal vector switches sign twice. We need to be careful about on which side we are.[^2]

Binary search ... thus we can do this in $O(\log N)$ 


[^1]: intuitively wrt the center. but for the sake of completeness, since if it is not convex this doesn't mean anything, we "draw" an arrow upward on each edge when it is oriented in such a way that it separates the inner polygon on the right from the outer on the left.

[^2]: if the two edges are oriented the "same" way we need to know which one is in front of the other.