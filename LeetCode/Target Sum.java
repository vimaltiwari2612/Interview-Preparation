/*
You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.

Find out how many ways to assign symbols to make sum of integers equal to target S.

Example 1:

Input: nums is [1, 1, 1, 1, 1], S is 3. 
Output: 5
Explanation: 

-1+1+1+1+1 = 3
+1-1+1+1+1 = 3
+1+1-1+1+1 = 3
+1+1+1-1+1 = 3
+1+1+1+1-1 = 3

There are 5 ways to assign symbols to make the sum of nums be target 3.
*/

class Solution {
    public int findTargetSumWays(int[] nums, int S) {
        
        int size = nums.length;
        if(size == 0) return 0;
        if(size == 1 ) {
            if(Math.abs(nums[0]) != Math.abs(S)){
                return 0;
            }
            else{
                return 1;
            }
        } 
            
        int range = 0;
        for(int i = 0;i<size;i++){
            range += nums[i];
        }
        
        if(range < S) return 0;
        
        // target sum using + and -
        /*
            possible combinations are
            a+b-c-d+e = S
            OR
            a+b+e - (c+d) = S
            S1 - S2 = S
            S1 + S2 = Range
            adding both equations
            2S1 = S + Range
                
                S1 = (S+Range)/2;
        */
        
        return subsetSum(nums,size,(S+range)/2);
    }
    
    int subsetSum(int[] arr,int N,int sum){
        
       int[][] mat = new int[N+1][sum+1];
        
       //init
        for(int i = 0;i<N;i++){
            for(int j = 0;j<sum;j++){
                if(i==0)
                    mat[i][j] = 0;
                if(j==0)
                    mat[i][j] = 1;
            }
        }
        
        for(int i = 1;i<=N;i++){
            for(int j = 1;j<=sum;j++){
                
                if(arr[i-1]<=j){
                    mat[i][j] = mat[i-1][j] + mat[i-1][j-arr[i-1]];
                }
                else{
                    mat[i][j] = mat[i-1][j];
                }
            }
        }
        
        return mat[N][sum];
    }
}