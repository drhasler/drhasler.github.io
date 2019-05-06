---
title: Eulerian path
---

Given a graph, find if there is a path going through all edges only once

First we need to make sure the graph is connected. Now that this is out of the way,
there is an Eulerian path if and only if none or two of the vertices have an odd degree.

If there are odd degree vertices, the path will start at one and end at the other,
otherwise, it has to be a circuit (where we end at the vertex we started at).

We will construct this path by removing the edges we followed during the traversal.
Besides for the ending vertex, after removing the edges of the traversal, the degree of the
vertex we are at is odd, and becomes even after leaving it.
There is one edge that "leads" to the end and the others have to be cycles.

_a more rigorous proof would be appreciated_

```cpp
const int N = 1e5;
const int M = 1e5;

struct edge {
	int to,id;
};
vector<edge> e[N];
int e_at[N];
list<int> euler_path;
bool seen[N];

void euler(list<int>::iterator& it, int v) {
	for (;e_at[v]<e[v].size();e_at[v]++) {
		int u,id; tie(u,id) = e[v][e_at[v]];
		if (seen[id]) continue;
		seen[id] = 1;
		euler(it,v);
	}
	it = euler_path.insert(it,v);
}

int main() {
	int n,m; cin >> n >> m;
	for (int i=0;i<m;i++) {
		int a,b; cin >> a >> b;
		e[a].push_back({b,i});
		e[b].push_back({a,i});
	}
	// assuming it is connected
	int start = 0;
	for (int i=0;i<n;i++) if (e[i].size()&1) {
		start = i;
		break;
	}
	euler(euler_path.begin(), start);
	for (int v : euler_path) cout << v << ' ';
	cout << endl;
}
```
_i suggest you rtfm to understand linked lists_
