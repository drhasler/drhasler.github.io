---
title: Dynamic programming
has_math: yes
---

DP is a fancy name for greedy algorithms which are usually storing some extra informations to compute the next state.

The simplest example i can think of is the longest common subsequence

```cpp
using namespace std;

const int MAX_LEN = 1e4;

int dp[MAX_LEN][MAX_LEN];

int main() {
    string s1,s2;
    cin >> s1 >> s2;
    for (int i = 0; i <= s1.size(); i++) for (int j = 0; j <= s2.size(); j++) {
        if (j < s2.size()) dp[i][j+1] = max(dp[i][j+1],dp[i][j]);
        if (i < s1.size()) dp[i+1][j] = max(dp[i+1][j],dp[i][j]);
        if (i < s1.size() && j < s2.size())
            dp[i+1][j+1] = max(dp[i+1][j+1],dp[i][j]+(s1[i]==s2[j]));
    }
    cout << dp[s1.size()][s2.size()] << endl;
}
```

this leads to many quadratic and cubic algorithms.

## linear transforms

another example of DP application is Fibonacci.
you are probably familiar with the following formula:

$$
f_{i+2} = f_{i}+f_{i+1}
$$

we can naively compute all Fibonacci numbers less than $n$ in $O(n)$

but this is quite a waste of time if you are only interested in finding one number of the sequence 

a pair of consecutive Fibonacci numbers can be considered as a vector

we can obtain the next pair by multiplying it by a matrix

$$
\newcommand\pma[1]{\begin{pmatrix}#1\end{pmatrix}}
f_{1,2} = \pma{ 1 \\ 2 }
= \pma{ 0 & 1 \\ 1 & 1 } \pma{ 1 \\ 1 }
= A f_{0,1}
$$

we can now use binary exponentiation to compute $A^n$ and obtain $f_{n,n+1} = A^n f_{0,1}$
in $O(\log n)$ time. This technique is very useful and can be used whenever the next state
is a linear combination of the previous one.

### masks
masks are often used to provide a "canonical" access to the vector elements,
however the previous algorithms works in $O(n^3 \log k)$, where $n$ is the size of the vector
and $k$ is the power to which the transition matrix is raised.

For applications such as tiling, one can often considerably reduce the size of the vector by mapping the masks
to a smaller range of "reachable" masks. If the number of states is reduced by a factor of $m$, the algorithm
will run $m^3$ times faster.

## trees

Finally DP can also be used on trees, through one or two DFS. It is generally labeled as DP
if we have to merge informations about the subbranches, this information can sometimes be
contained in vectors. You have to be careful about the way you are merging them into the parent one.

