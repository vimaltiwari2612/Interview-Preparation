 /*
 Two City Scheduling
 
 
 There are 2N people a company is planning to interview. The cost of flying the i-th person to city A is costs[i][0], and the cost of flying the i-th person to city B is costs[i][1].

Return the minimum cost to fly every person to a city such that exactly N people arrive in each city.

 

Example 1:

Input: [[10,20],[30,200],[400,50],[30,20]]
Output: 110
Explanation: 
The first person goes to city A for a cost of 10.
The second person goes to city A for a cost of 30.
The third person goes to city B for a cost of 50.
The fourth person goes to city B for a cost of 20.

The total minimum cost is 10 + 30 + 50 + 20 = 110 to have half the people interviewing in each city.
 
 */
 
 class Solution {
    public int twoCitySchedCost(int[][] costs) {
        int N = costs.length / 2;
		//memorize with N*N as only one entity changes that is costs.length
        int[][] dp = new int[N + 1][N + 1];
		//dp[i][j] represents the cost when considering first (i + j) people in which i people assigned to city A and j people assigned to city B.
		//init 0th col, all will go to A
        for (int i = 1; i <= N; i++) {
			//add previous guys cost + new guys cost, when all are going to A
            dp[i][0] = dp[i - 1][0] + costs[i - 1][0];
        }
		//init 0th row, all will got to B
        for (int j = 1; j <= N; j++) {
			//add previous guys cost + new guys cost, when all are going to B
            dp[0][j] = dp[0][j - 1] + costs[j - 1][1];
        }
		//itereate
        for (int i = 1; i <= N; i++) {
            for (int j = 1; j <= N; j++) {
				//take min of both
				//either you can send the new guys to A or B 
				//if sending to A, previous value of A i.e. d[i-1][j]  and cost of new guy i.e cost[i-1 + j];
				//if sending to B, previous value of B i.e. d[i][j-1]  and cost of new guy i.e cost[i + j-1];
                dp[i][j] = Math.min(dp[i - 1][j] + costs[i + j - 1][0], dp[i][j - 1] + costs[i + j - 1][1]);
            }
        }
        return dp[N][N];
    }
}