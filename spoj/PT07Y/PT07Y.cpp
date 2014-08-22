#include<cstdio>
#include<iostream>
#include<algorithm>
#include<cstdlib>
#include<cmath>
#include<cassert>
#include<vector>
#include<map>
#include<cstring>
#include<cassert>
#include<queue>

#define FOR(i,n) for(int i=0;i<n;i++)
#define FORS(i,a,n) for(int i=a;i<n;i++)
#define ERR(x) cerr<<#x<<" "<<x<<endl
#define pb push_back
#define FILL(a,b) memset(a,b,sizeof(a))
using namespace std;

typedef vector<int> VI;
typedef long long ll;
typedef long double ld;

inline int print(int d) { return printf("%d",d);}
inline int read(int &d) { return scanf("%d",&d);}

int N,M,tmp;
vector<int> graph[10001];
vector<int> visited;

bool isTree(int node, int prev) {
  if(std::find(visited.begin(), visited.end(), node) != visited.end()) {
    return false;
  }
  visited.push_back(node);
  for(std::vector<int>::size_type i = 0; i != graph[node].size(); i++) {
    if(graph[node][i] == node)
      continue;

    if(!isTree(graph[node][i], node))
      return false;
  }

  return true;
}

int main(int argc, char** args)
{
  read(N);
  read(M);

  int p, q;
  FOR(i,M) {
    read(p);
    read(q);
    graph[p].push_back(q);
  }

  if(isTree(1, 0))
    if(visited.size() == N)
      printf("YES");
    else
      printf("NO");
  else
    printf("NO");
}
