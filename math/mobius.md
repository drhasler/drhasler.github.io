---
title: Möbius
has_math: yes
---

The Möbius function $\mu$ is defined the following way:  
if $n$ has a prime factor of multiplicity greater than $1, \mu(n) = 0$  
otherwise $\mu(n) = (-1)^k$ where $k$ is the number of prime factors.

```cpp
const int N = 1e6;
const int sqN = 1e3;

vector<int> pr; // primes up to sqN
int mu[N];

void primes() {
    pr.push_back(2);
    for (int i=3;i<sqN;i+=2) {
        for (int p:pr) if (i%p==0) goto skip;
        pr.push_back(i);
skip:;
    }
}

void mobius() {
    mu[1] = 1;
    fill(mu+2,mu+N,-1);
    for (int i=2;i<N;i++) {
        for (int p:pr) {
            if (i*p>=N || p>i) break;
            if (i%p==0) { mu[i*p]=0; break; } // mult > 1
            else mu[i*p] = mu[i] * mu[p]; // distinct or 0
        }
    }
}
```

### complexity analysis
- **primes** $O(N)$
- **mobius** $O(N)$ - as each composite $m$ has a smallest divisor $p$,
  we only write to $\mu(m)$ when $i = m/p$

is it of any use ?
meet the Möbius inversion

$$
g(n) = \sum_{d|n} f(d) \implies
f(n) = \sum_{d|n} \mu(d) g(n/d)
$$

this can help with simple inclusion/exclusion over the prime factors:  
[codeforces 1139D](https://codeforces.com/contest/1139/problem/D)
is a great example
