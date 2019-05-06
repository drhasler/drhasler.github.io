---
title: Range query
has_math: yes
---

given an array a of size N, answer to Q queries of the form
"get the sum of $a_i$ for $l \leq i \leq r$"

if the array is constant, then a cumulative array might be the best option
$A_i = \sum_{k<=i} a_i = A_{i-1} + a_i$ and we get `sum(l,r) = A_r - A_{l-1}`

however modifing an element in the array requires all the coefficients to be recomputed.

Let's introduce better online solutions 

# Binary indexed tree
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

# Segment tree


