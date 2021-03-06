---
title: Palindromes
has_math: yes
---
> A palindrome is a word that reads the same backwards.

# Longest Palindromic Substring
Given a string of length $n$, find its longest substring which is a palindrome.  

The most naive approach would be to consider all $n^2$ substrings
and check whether they are palindromic.
_complexity_ $O(n^3)$

One can notice that if string $s$ is not a palindrome,
for any $a,b \ | \ |a|=|b|, \ asb$ will not be a palindrome.
Thus, for each one of the $2n-1$ positions the _center_ of the palindrome
could be in, we only seek for the LPS sharing this center,
by extending it from the center.
_complexity_ $O(n^2)$

However, there is a last point that will help us
bring the complexity down to _linear_ :  
A substring of a palindrome is palindromic if and only if its
_mirror image_ is palindromic.

Here is my implementation of [Manacher's algorithm](https://en.wikipedia.org/wiki/Longest_palindromic_substring):

```cpp
string os; cin >> os; // original string
int len = os.size();
string s(2*len+1,'_')
for (int i=0; i<len; i++) s[2*i+1] = os[i]; // interleaving
len = 2*len+1:
int L,R=-1; // left and right boundaries of rightmost palindrome
for (int c=0; c<len; c++) { // center
    int l = c<R ? min(pal[L+R-c],R-c) : 0; // length
    for (l++; c-l>=0 && c+l<len && s[c-l]==s[c+l]; l++); // extend
    pal[c] = --l;
    if (c+l > R) { // reset
        L = c-l;
        R = c+l;
    }
}
```
> Interleaving allows us to consider all $2n-1$ centers, to find both
  even and odd sized LPS.

This algorithm runs in linear time, as we enter the inner loop only
if we are increasing $R$.

