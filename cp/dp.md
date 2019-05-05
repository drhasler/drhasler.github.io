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

another example is Fibonacci.
you are probably familiar with the following formula:

$$
f_{i+2} = f_{i}+f_{i+1}
$$

we can naively compute all Fibonacci numbers less than $n$ in $O(n)$

but this is quite a waste of time if you are only interested in finding one coefficient

a pair of consecutive Fibo nbs can be considered as a vector

we can obtain the next pair by multiplying it by a matrix
$$
\renewcommand \pm[1] \begin{pmatrix}#1\end{pmatrix}
f_{1,2} = \pm{ 1 \\ 2 }
= \pm{ 0 & 1 \\ 1 & 1 } \pm{ 1 \\ 1 }
= A f_{0,1}
$$

we can now use binary matrix exponentiation to compute $f_{n,n+1} = A^n f_{0,1}$


