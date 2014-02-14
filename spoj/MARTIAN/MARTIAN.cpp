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
//inline int read(int &d) { return scanf("%d",&d);}
 
int N,M,tmp;
int b[505][505];
int y[505][505];
 
int ysums[505][505];
int bsums[505][505];
 
inline int read(int &x){
  x=0;int sign,ch;
  while((ch<'0'||ch>'9')&&ch!='-'&&ch!=EOF) ch=getchar();
  if (ch=='-')
    sign=-1,ch=getchar();
  else sign=1;
  do
    x=(x<<3)+(x<<1)+ch-'0';
  while((ch=getchar())>='0' && ch<='9');
  x*=sign;
  return 1;
}
 
int main(int argc,char** args) 
{
  while(read(N) && read(M) && N!=0 && M!=0) {
    FOR(i,N)FOR(j,M) {
      read(y[i][j]);
    }
    FOR(i,N)FOR(j,M) {
      read(b[i][j]);
    }
    FOR(i,N+1) ysums[i][0]=bsums[i][0]=0;
    FOR(j,M+1) ysums[0][j]=bsums[0][j]=0;
 
    FORS(i,1,N+1) FORS(j,1,M+1) {
      tmp = max(ysums[i-1][j-1], bsums[i-1][j-1]); 
      ysums[i][j] = y[i-1][j-1] + ysums[i][j-1] + max(ysums[i-1][j], bsums[i-1][j]) - tmp;
      bsums[i][j] = b[i-1][j-1] + bsums[i-1][j] + max(ysums[i][j-1], bsums[i][j-1]) - tmp;
    } 
    printf("%d\n",max(ysums[N][M],bsums[N][M]));    
 
  }
}
