---
title: Range query
has_math: yes
---

given an array a of size N, answer to Q queries of the form
"get the sum of $a_i$ for $l \leq i \leq r$"

if the array is constant, then a cumulative array might be the best option
$A_i = \sum_{k \leq i} a_k = A_{i-1} + a_i$ and we get
$\sum_{l \leq i \leq r} = A_r - A_{l-1}$

however modifing an element in the array requires all the coefficients to be recomputed.

Let's introduce better online solutions 

# Binary indexed tree

![not mine, dont copystrike pls](http://mrl.kr/wordpress/wp-content/uploads/2016/02/2.jpg)

**BIT** or **Fenwick tree** is the most lightweight and fastest option
for range sum queries and updates. It is very straight forward but still
cryptic _af_. Using two's complement rule: `x&-x` returns `x`s lowest set bit.

```cpp
const int N = 1e5;
int fen[N],a[N];

void add(int val, int at) {
    for ( ; at < N; at += at&-at)
        fen[at] += val;
}

int sum(int l, int r) {
    int ans = 0;
    for ( ; r; r = r&-r)
        ans += fen[r];
    for ( l--; l; l -= l&-l)
        ans -= fen[l];
    return ans;
}

int main() {
    int n,q; cin >> n >> q;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
        add(a[i],i);
    }
    for (int i = 1; i <= n; i++) {
        int l,r; cin >> l >> r;
        cout << get(l,r) << ' ';
    }
    cout << endl;
}
```

The Fenwick tree is made for querying partial sums, but doesn't work for more diverse applications.

# Segment tree

Segment trees are more flexible, and the implementation is easier to remember.
In fact all indices of the array are shifted by N,
and the parent of each node is has half the index.

![pic from CF](http://i.imgur.com/GGBmcEP.png)

In this picture we can see that for a request we will have two pointers
one left and one to the right _(the right bound has to be exclusive for the
sum we are interested in to be between the two)_,
we will go up as long as possible. But when it is not possible to go straight up,
or when the index is odd, we have to "align" it and its only then that we process this range.
When the two pointers meet, we are done.

```cpp
const int N = 1<<18; // has to be power of 2
int T[2*N], a[N];

int sum(int l,int r) {
    int ans = 0;
    l += N, r += N+1; // r exclusive
    while (l<r) {
        if (l&1) ans += T[l++];
        if (r&1) ans += T[--r];
        l/=2, r/=2;
    }
    return sum;
}

void add(int val, int at) {
    for (at += N; at; at/=2) T[at] += val;
}

void build() {
    for (int i=0;i<N;i++) T[i+N] = a[i];
    for (int i=N-1;i;i--) T[i] = T[2*i]+T[2*i+1];
}
```

# Sqrt decomposition
square root decomposition is even more "general" than segtrees in its applications.
in square root decomposition we store a tree of sqrt segments, and each for each segment we can store
information. it support both range updates and queries.
when processing a range, we have at most $2 \sqrt N$ elements to process
individually and $\sqrt N$ segments. Thus all operations can be bounded by $\sqrt N$.
