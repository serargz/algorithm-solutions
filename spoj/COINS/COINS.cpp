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
  
int N;
map<int, int> M;
 
// inline int read(int &x){
//   x=0;int sign,ch;
//   while((ch<'0'||ch>'9')&&ch!='-'&&ch!=EOF) ch=getchar();
//   if (ch=='-')
//     sign=-1,ch=getchar();
//   else sign=1;
//   do
//     x=(x<<3)+(x<<1)+ch-'0';
//   while((ch=getchar())>='0' && ch<='9');
//   x*=sign;
//   return 1;
// }

int dp(int n) {
  if(n == 0) return 0;
  if(M.count(n) == 1) return M[n];

  return max(n, dp(n/2) + dp(n/3) + dp(n/4));
}
 
int main(int argc,char** args) 
{
  while(read(N) != EOF) {
    printf("%d\n", dp(N));
  }
}