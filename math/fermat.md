---
title: lil Fermat
has_math: yes
---

# Fermat's little theorem
> If $p$ is prime and $a$ is not divisible by $p$, then $a^{p-1}-1$ is a multiple of $p$

Let $p$ prime, $0 < a < p$.
We can find $k$ such that $k a \equiv 1$ by computing $a^{p-2}$.  
This allows us to store and perform operations on fractions in an efficient manner.

# computing an inverse
If $a$ and $p$ are coprimes, we have two easy ways of computing the inverse

1. using the _extended_ GCD algorithm, ie. finding the coefficient $b,c$ such that
$ a b + p c = 1 $, complexity is $O(\log \max(a,p))$
2. with Fermat, when $p$ is prime, we have that $a^{p-2} \equiv 1 \mod p$, complexity is $O(\log p)$
but in practice this method works faster

