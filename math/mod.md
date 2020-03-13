---
title: Modular arithmetic
has_math: yes
---

# Modular arithmetic
In modular arithmetic, we consider integers under an equivalence relation.
We will denote the modulus $m$.

$$
\newcommand{\Z}{\mathbb{Z}}
a \sim b \iff a = b + k m $, for some $ k \in \Z
$$


## Algebraic structure
In general $Z/mZ$ is a commutative ring.
It means that it has a group structure given by
the + operation and 0 as neutral element,
and a second operation * (with 1 as neutral element)
which is associative and distributive wrt +

An interesting case is when $m = p$ is prime.
$Z/pZ$ then becomes a field, which means that all non zero elements
have a multiplicative inverse in $Z/pZ$

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

