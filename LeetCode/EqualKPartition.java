class Solution {
    public boolean canPartitionKSubsets(int[] nums, int k) {
      int sum = 0;
        for(int i=0;i<nums.length;i++){
            sum += nums[i];
        }
        
        if(sum % k != 0) return false;
       
        //if we can find, how many array exists whose sum =  sum /k;
        //the count should be equal to k
       
        return (subsetSum(nums,sum/k,nums.length) >= k);
    }
    
    
    //total subsets poosible of sum
    private int subsetSum(int[] arr , int sum , int n){
        
       int matrix[][] = new int[n+1][sum+1];
       
       for(int i=0;i<=n;i++){
           for(int j=0;j<=sum;j++){
               
              if(i == 0)// when array is 0, any sum is not possible
                matrix[i][j] = 0;
               
               if(j == 0)//when sum is 0, empty set is possible
                   matrix[i][j] = 1;
           }
       }
        
       for(int i=1;i<=n;i++){
           for(int j=1;j<=sum;j++){
                //if weight is less than capacity
               if(arr[i-1] <= j){
                                  //consider                OR  don't
                    matrix[i][j] = (matrix[i-1][j-arr[i-1]] + matrix[i-1][j]);
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