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
 
int t;
int M[3001][3001];
char a[3001], b[3001];

int dp(int i, int j) {
  if(M[i][j] > -1)
    return M[i][j];

  if(a[i-1] == b[j-1])
    M[i][j] = min(1+dp(i, j-1), min(1+dp(i-1, j), dp(i-1, j-1)));
  else
    M[i][j] = min(1+dp(i, j-1), min(1+dp(i-1, j), 1+dp(i-1, j-1)));

  return M[i][j];
}
 
int main(int argc,char** args) 
{
  scanf("%i", &t);
  FOR(i, t) {
    scanf("%s", a);
    scanf("%s", b);

    memset(M, -1, sizeof(M[0][0]) * 3001 * 3001);
    FOR(j, 3001) {
      M[j][0] = j;
      M[0][j] = j;
    }

    printf("%i\n", dp(strlen(a), strlen(b)));
  }
}
