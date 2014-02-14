import java.util.*;
import java.util.regex.*;
import java.text.*;
import java.math.*;


public class BadNeighbors
{
	public int maxDonations(int[] donations)
	{
		int N = donations.length;
		if(N == 2)
			return Math.max(donations[0],donations[1]);
		int[] dp = new int[N];
		int[] dp2 = new int[N];
		int i,j,max=0;
		for(i=0; i<N-1; ++i){
			dp[i] = donations[i];
			if(i==N) j=1;
			j=0;
			for(; j<i-1; ++j){
				dp[i] = Math.max(dp[i], dp[j]+donations[i]);
				max = Math.max(max, dp[i]);
			}			
		}
		for(i=1; i<N; ++i){
			dp2[i] = donations[i];
			if(i==N) j=1;
			j=0;
			for(; j<i-1; ++j){
				dp2[i] = Math.max(dp2[i], dp2[j]+donations[i]);
				max = Math.max(max, dp2[i]);
			}			
		}
		return max;		
	}
	
<%:testing-code%>
}
//Powered by KawigiEdit 2.1.4 (beta) modified by pivanof
