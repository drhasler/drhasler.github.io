---
title: Search trees
has_math: yes
---

this might be moved to something like datastructures..

- Binary search trees
- Balanced binary search tree
- Unordered map

# BST
each node has a key, a value, and potentially a left and or right child

we maintain an invariance that is for each node, the left subtree contains
the smaller keys and the right one the bigger.

to find the node corresponding to the key k just run `search(&root,key)`,

```cpp
struct node {
    int key,val;
    node *le=nullptr, *ry=nullptr;
    node(int k, int v) : key(k), val(v) {}
} root;

int search(node *cur, int k) {
    if (cur->key==k) return cur->val:
    if (cur->key < k && cur->le) return search(cur->le, val);
    if (cur->key > k && cur->ry) return search(cur->ry, val);
    return -1;
}

// assuming the key is not in there
void insert(node *cur, int k, int v) {
    if (cur->key == k) cur->val = v;
    else if (cur->key < k) {
        if (cur->le) insert(cur->le, k, v);
        else cur->le = new node(k,v);
    } else { // if (cur->key > k) {
        if (cur->ry) insert(cur->ry, k, v);
        else cur->ry = new node(k,v);
    }
}
```

however, if we insert integers in an increasing order, we will get an unbalanced tree
the first fix would be to shuffle the vector first, but this is neither always possible
nor elegant.

# Balanced BST
_the height of a tree is the lenght of the longest simple path starting at its root_

_a balanced tree has balanced subtrees and the difference between its left and right subtree heights is at most 1_

a balanced subtree has height $O(\log N)$

> **Online BST** here we will insert keys as they appear, with no prior knowledge on the dataset.

## rotation
one incremental solution to get a more balanced tree is to consider an unbalanced tree for which the difference between the height of the left and the right subtrees is bigger than 1.
we can "rotate" this particular node in order to reduce this gap.

```
right rotation (2,4 are nodes 1,3,5 subtrees)
   4          2
 2   5  ->  1   4
1 3            3 5
```

## AVL tree
a straight fwd way of representing this balance is the AVL tree.
lets store in each node the height of the corresponding subtree.
we can easily spot unbalanced subtrees and do a rotation.
After each insertion we percolate back up $O(\log N)$ and perform rotations if needed.
_dont forget to update the height of each node_

## Red-Black tree
**aka 2-4 tree, 2-3-4 tree, B-tree of order 4**
these are quite special trees.

tbh i find it quite painful but more details on the implementation are coming soon

red-black trees are used in the C++ std library, as their flexibility for insertion
and removal cause the costly rotations to be more rare.

## K-D tree
working in higher dimensions ? a $k$-D(imensional) tree is splitting the space recursively,
at depth $d$, the space is splitted along the dimension $d \mod k$.

we still have $O(\log n)$ complexity on average for 
however the worst case complexity, $O(n)$
because the balancing operation is very costly..


# offline stuff
data structures like segtree and BIT aka Fenwick are coming up as well

