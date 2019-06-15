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

Here we will be constructing an _online_ balanced BST:  
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
  a          a           b   
1     c  -> 1   b   ->  a   c 
    b  4       2  c    1 2 3 4
   2 3           3 4          
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

