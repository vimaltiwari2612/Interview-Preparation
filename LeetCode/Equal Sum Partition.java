class Solution {
    public boolean canPartition(int[] nums) {
        int sum = 0;
        for(int i=0;i<nums.length;i++){
            sum += nums[i];
        }
        
        if(sum % 2 != 0) return false;
        
        return subsetSum(nums,sum/2,nums.length);
    }
    
    private boolean subsetSum(int[] arr , int sum , int n){
        
       boolean matrix[][] = new boolean[n+1][sum+1];
       
       for(int i=0;i<n;i++){
           for(int j=0;j<sum;j++){
               
              if(i == 0)
                matrix[i][j] = false;
               
               if(j == 0)
                   matrix[i][j] = true;
           }
       }
        
       for(int i=1;i<=n;i++){
           for(int j=1;j<=sum;j++){
                //if weight is less than capacity
               if(arr[i-1] <= j){
                                  //consider                OR  don't
                    matrix[i][j] = (matrix[i-1][j-arr[i-1]] || matrix[i-1][j]);
               }
               else{
                   //don't
                   matrix[i][j] = matrix[i-1][j];
               }
           }
       }
        return matrix[n][sum];
    }
}