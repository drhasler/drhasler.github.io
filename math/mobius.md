---
title: Möbius
has_math: yes
---

the Möbius function $\mu$ is defined the following way:

if $n$ has a prime factor of multiplicity $\gt 1, \mu(n) = 0$

else $\mu(n) = (-1)^k$ where $k$ is the number of prime factors

```cpp
void mobius(int N) {
    vector<int> pr;
    vector<bool> is_pr(N,1);
    is_pr[0] = is_pr[1] = 0;
    for (int i=2;i<N;i++) {
        if (is_pr[i]) {
            pr.push_back(i);
            mu[i] = -1;
        }
        for (auto &p:pr) {
            if (i*p>=N) break;
            is_pr[i*p]=0;
            if (i%p==0) { mu[i*p]=0; break; } // mult > 1
            else mu[i*p] = mu[i] * mu[p]; // distinct or 0
        }
    }
}
```

is it of any use ?
meet the inverse Möbius formula

$$
g(n) = \sum_{d|n} f(d) \implies
f(n) = \sum_{d|n} \mu(d) g(n/d)
$$

this can help with simple inclusioin exclusion over the prime factors

