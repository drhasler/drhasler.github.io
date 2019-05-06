---
title: Möbius
has_math: yes
---

the Möbius function $\mu$ is defined the following way:

if $n$ has a prime factor of multiplicity $\gt 1, \mu(n) = 0$

else $\mu(n) = (-1)^k$ where $k$ is the number of prime factors

```cpp
const int N = 1e6;
const int sqN = 1e3;

vector<int> pr; // primes up to sqN
int mu[N];

void primes() {
    pr.push_back(2);
    for (int i=3;i<sqN;i+=2) {
        for (int p:pr) if (i%p==0) goto bad;
        pr.push_back(i);
bad:;
    }
}

void mobius() {
    mu[1] = 1;
    fill(mu+2,mu+N,-1);
    for (int i=2;i<N;i++) {
        for (auto &p:pr) {
            if (i*p>=N || p>i) break;
            if (i%p==0) { mu[i*p]=0; break; } // mult > 1
            else mu[i*p] = mu[i] * mu[p]; // distinct or 0
        }
    }
}
```

### complexity analysis
- **primes** $O(\sqrt N \log \log \sqrt N )$ [sieve of Erastosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)
- **mobius** $O(N)$ - as each composite $m$ has a smallest divisor $p$, and is only overwritten when $i = m/p$

is it of any use ?
meet the Möbius inversion

$$
g(n) = \sum_{d|n} f(d) \implies
f(n) = \sum_{d|n} \mu(d) g(n/d)
$$

this can help with simple inclusion/exclusion over the prime factors:

[codeforces 1139D](https://codeforces.com/contest/1139/problem/D)
is a great example
