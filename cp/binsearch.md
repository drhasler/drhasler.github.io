---
title: binary search
has_math: yes
---

$\newcommand{\N}{\mathbb N}$
Let $f: \N \mapsto \N$ non-decreasing.
If you have to find the minimum $k \in [a,b]$ such that $f(k)=1$
you can binary search over $[a,b]$ in $\log(b-a)$.

```cpp
int lo = a, hi = b+1;
while (lo < hi) {
	int mid = (lo + hi + 1) / 2;
	if (big_enough(mid)) lo = mid;
	else big = mid - 1;
}
// the answer is lo = hi
```

For some problems, it helps to ask yourself whether it is easy
to check that some answer is big enough. You get the answer in $O(\log(b-a) T)$
where $T$ is the time complexity of your checking function. 

