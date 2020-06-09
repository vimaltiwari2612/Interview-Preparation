/*
You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

Example 1:

Input: coins = [1, 2, 5], amount = 11
Output: 3 
Explanation: 11 = 5 + 5 + 1
Example 2:

Input: coins = [2], amount = 3
Output: -1

*/

class Solution {
    public int coinChange(int[] coins, int amount) {
        int N = coins.length;
        int[][] m = new int[N+1][amount+1];
            
        //init
        for(int i=0;i<=N;i++){
            for(int j=0;j<=amount;j++){
                if(j==0){
                    m[i][j] = 0; //if  amount = 0, no coins needed
                }
                if(i==0){
                    //if no coins OR no finite set available, set int max val becasue we need infinite coin to make that amount, 
                    m[i][j] = Integer.MAX_VALUE - 1; 
                }
            }
        }
        
        //2nd row init, 
        //needed becasue it has only 1 element in array, and we need to make sum
        //if that one elemnt is can be used to make whole sum, add the count, else add Int max
        for(int i=1;i<=amount;i++){
            if(m[1][i] != 0 && m[1][i] % 2 == 0) {
                //can make sum
                m[1][i] = amount/m[1][i];
            }
            else{
                 m[1][i] = Integer.MAX_VALUE - 1;
            }
        }
        
        //now fill the rest matrix
        for(int i=1;i<=N;i++){
            for(int j=1;j<=amount;j++){
                //default add not taken
                m[i][j] = m[i-1][j];
                //if can accomaodate in sum
                if(coins[i-1] <= j){
                    //find min between -> not adding it (N-1) , OR Add it ( 1 + ) and use the same array (N)
                    m[i][j] = Math.min(m[i-1][j] , 1 +  m[i][j-coins[i-1]]); 
                    //why m[i], because we can use the same value again, it's a unbounded knapsack case
                }
            }
        }
        //check for max condition
        if(m[N][amount] < Integer.MAX_VALUE - 1){
            return m[N][amount];
        }
        else{
            return -1;
        }
        
    }
}