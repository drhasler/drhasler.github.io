---
title: Möbius
has_math: yes
---

the Möbius function $\mu$ is defined the following way:

if $n$ has a prime factor of multiplicity $\gt 1, \mu(n) = 0$

else $\mu(n) = (-1)^k$ where $k$ is the number of prime factors

```cpp
const int N = 1e6;

bool is_pr[N];
vector<int> pr;
int mu[N];

void primes() {
    for (int i=2;i<N;i++) {
        for (int p:pr) if (i%p==0) goto bad;
        pr.push_back(i);
        is_pr[i] = 1;
bad:;
    }
}

void mobius() {
    mu[1] = 1;
    for (int i=2;i<N;i++) {
        if (is_pr[i]) mu[i] = -1;
        for (auto &p:pr) {
            if (i*p>=N) break;
            if (i%p==0) { mu[i*p]=0; break; } // mult > 1
            else mu[i*p] = mu[i] * mu[p]; // distinct or 0
        }
    }
}
```

complexity of this thing is coming up soon

is it of any use ?
meet the Möbius inversion

$$
g(n) = \sum_{d|n} f(d) \implies
f(n) = \sum_{d|n} \mu(d) g(n/d)
$$

this can help with simple inclusion/exclusion over the prime factors

