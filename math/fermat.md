---
title: moduli n Lil Fermat
has_math: yes
---

_assuming you are familiar with the basics of modular arithmetic_

## Fermat's little theorem
> If $a$ is not divisible by $p$, then $a^{p-1}-1$ is a multiple of $p$

this means that $a^{p-1}$ is congruent to $1$ but also that
$a^{p-2}$ has to be multiplied by $a$ once more to get $1$.

So for any $p$ prime, we can represent fractions of numbers
in the range $[1,p-1]$.

## computing an inverse
if $a$ and $p$ are coprimes, we have two easy ways of computing the inverse

1. using the _extended_ GCD algorithm, ie. finding the coefficient $b,c$ such that
  $ a * b + p * c = 1 $, complexity is $\log \max(a,p)$
2. with Fermat, we have that $a^{p-2} \equiv 1 \mod p$, complexity $\log p$
but in practice this method works faster

