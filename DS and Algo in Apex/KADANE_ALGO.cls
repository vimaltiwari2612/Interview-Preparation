public class KADANE_ALGO {
	/*
        Given an array arr of N integers. Find the contiguous sub-array with maximum sum.
        
        Input:
        N = 5
        arr[] = {1,2,3,-2,5}
        Output:
        9
        Explanation:
        Max subarray sum is 9
        of elements (1, 2, 3, -2, 5) which 
        is a contiguous subarray.
    */
    
    public static integer getMaxSumOfContiguousSubArray(List<Integer> arrayOfIntegers){
        integer SIZE = arrayOfIntegers.size();
        integer maxSum = 0, currentSum = 0 ;
        
        for(integer i = 0 ; i < SIZE ; i++ ){
            
            currentSum += arrayOfIntegers[i];
            if(maxSum < currentSum){
                maxSum = currentSum;
            }
            if(currentSum < 0){
                currentSum = 0;
            }
            
        }
        return maxSum;
    }
    
}