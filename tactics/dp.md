---
title: Dynamic programming
has_math: yes
---

[Dynaminc programming](https://en.wikipedia.org/wiki/Dynamic_programming)
is a technique for solving problems when the computations of the subproblems
are the same. DP typically uses tabulation,
meaning that we solve the problem _bottom up_
(computing subproblems first), whereas
[memoization](https://en.wikipedia.org/wiki/Memoization)
optimizes _top down_ computations (dividing and solving each
subproblem) by checking if a computation had already been done.

> Example: finding the longest common subsequence of two strings
```cpp
const int MAX_LEN = 1e3;
int dp[MAX_LEN][MAX_LEN];

string s1,s2;
cin >> s1 >> s2;
for (int i = 0; i <= s1.size(); i++) for (int j = 0; j <= s2.size(); j++) {
    if (j < s2.size()) dp[i][j+1] = max(dp[i][j+1],dp[i][j]);
    if (i < s1.size()) dp[i+1][j] = max(dp[i+1][j],dp[i][j]);
    if (i < s1.size() && j < s2.size())
        dp[i+1][j+1] = max(dp[i+1][j+1],dp[i][j]+(s1[i]==s2[j]));
}
```
> the LCS is `dp[s1.size()][s2.size()]`

Tabulation often leads to _simple_ quadratic and cubic algorithms.

## Linear transforms
We can use DP to compute the Fibonacci sequence:
$$
F_0 = 0 \ F_1 = 1 \
F_{i+2} = F_i + F_{i+1}
$$

Thus we can compute the first $n$ Fibonacci numbers in $O(n)$.  
However computing the $n$th Fibonacci number can be achieved in $O(\log n)$:  
We consider a pair of consecutive Fibonacci numbers as a vector.
Obtaining the next pair is simply the result of a matrix multiplication.

$$
\newcommand\pma[1]{\begin{pmatrix}#1\end{pmatrix}}
f_{2,3} = \pma{ 1 \\ 2 }
= \pma{ 0 & 1 \\ 1 & 1 } \pma{ 1 \\ 1 }
= A f_{1,2}
$$

Using binary exponentiation to compute $A^n$, we obtain
$f_{n,n+1} = A^n f_{0,1}$
in $O(\log n)$ time.
This technique is very useful and can be used whenever
we can define a fixed lenght state which
is a linear transform of its previous instance.

### masks
Masks are often used to provide a "canonical" access to the vector elements,
however the previous algorithms works in $O(n^3 \log k)$,
where $n$ is the size of the state-vector
and $k$ is the power to which the transition matrix is raised.

For applications such as tiling,
one can often considerably reduce the size of the vector by mapping the masks
to a smaller range of "reachable" states.
If the number of states is reduced by a factor of $m$, the algorithm
will run $m^3$ times faster.

## trees

Finally DP can also be used on trees, through one or two DFS. It is generally labeled as DP
if we have to merge informations about the subbranches, this information can sometimes be
contained in vectors. You have to be careful about the way you are merging them into the parent one.

