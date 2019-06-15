---
title: Search trees
has_math: yes
---

In this article I will cover the following topics:

- Binary search trees
- Balanced binary search tree
- Unordered map (pls wait)

# Binary Search Tree
> Each node has a key, a value, and potentially a left and/or right child.

We maintain an invariance: the left subtree of each node contains
smaller keys and the right one bigger ones.

```cpp
struct node {
    int key,val;
    node *left=nullptr, *right=nullptr; // subtrees
    node(int k, int v) : key(k), val(v) {}
} root;

int search(node *cur, int k) {
    if (cur->key==k) return cur->val:
    if (cur->key < k && cur->left) return search(cur->left, val);
    if (cur->key > k && cur->right) return search(cur->right, val);
    return -1;
}

// inserts or overwrites
void insert(node *cur, int k, int v) {
    if (cur->key == k) cur->val = v;
    else if (cur->key < k) {
        if (cur->left) insert(cur->left, k, v);
        else cur->left = new node(k,v);
    } else { // if (cur->key > k) {
        if (cur->right) insert(cur->right, k, v);
        else cur->right = new node(k,v);
    }
}
```

> To find the node corresponding to the key k just run `search(&root,key)`,

A search can take up to linear time with respect to the height of the tree.

## Balanced BST
> The height of a tree is the lenght of the longest simple path starting at its root.  
> A balanced tree has balanced subtrees and the difference between its left and right subtree heights is at most 1.
> Its height is in $O(\log N)$.

In the following sections we will describe self-balancing BST:  
we will insert keys as they appear, with no prior knowledge on the dataset.

## Rotation

We can change the structure of a BST while preserving its invariance
in a constant time operation: a rotation.

```
right rotation on b (a,b are nodes 1,2,3 subtrees)
   b          a   
 a   3  ->  1   b 
1 2            2 3
```

Using two consecutive rotations we can make a tree more balanced.
```
  a          a            b   
1     c  -> 1   b   ->  a   c 
    b  4       2  c    1 2 3 4
   2 3           3 4          
```

## AVL tree
An [AVL tree](https://en.wikipedia.org/wiki/AVL_tree)
stores an additional information in each node to remain
balanced: the difference between its subtrees heights.

This allows us to spot unbalanced subtrees easily.
After each insertion we percolate back to the root in $O(\log N)$
and perform rotations if needed.

---

## Red-Black tree
> also known as _2-4 tree_, _2-3-4 tree_ or _B-tree of order 4_

tbh i find it quite painful but more details on the implementation are coming soon

red-black trees are used in the C++ std library, as their flexibility for insertion
and removal cause the costly rotations to be more rare.

## K-D tree
working in higher dimensions ? a $k$-D(imensional)
tree is splitting the space recursively,
at depth $d$, the space is splitted along the dimension $d \mod k$.

we still have $O(\log n)$ complexity on average for lookup,
insertion and deletion  
however the worst case complexity is $O(n)$
because the balancing operation is very costly...

## offline solutions
if all the keys are known beforehand,
one can use classical datastructures similar to
[segment trees](/ds/rq.html)
that offer similar theoretical complexity
but are in practice faster

# Unordered maps
using hashing we can reduce a larger range to one that can fit in memory,
the hash function is a mapping to a hash table.  
if our hashing function is good, it is unpredictable and collisions
should have probability $k/N$ where $k$ is the number of keys inserted
and $N$ is the size of the hash table.  
if a collision occurs (a different key is assigned to the same bucket)
we can simply iterate until the next free spot (but this makes deletion
more complicated) or associate another data structure such as linked lists to store
what is in the bucket.

if we set $N$ large enough we can reduce the complexity of all common operations
(search, insertion, deletion) to $O(1)$

