/*
Largest Sum Contiguous Subarray

Simple idea of the Kadane’s algorithm is to look for all positive contiguous segments of the array

*/

class Solution {
    public int maxSubArray(int[] nums) {
        
        int sum = 0, max_sum = Integer.MIN_VALUE;
        int size = nums.length,start =0,end = 0,currentStart = 0; 
        for(int i = 0; i<size;i++){
            //form the sum
            sum += nums[i];
            //sum greter than found till now, update the max sum
            if(sum > max_sum){
                max_sum = sum; 
				//maintain window indices to print the subarray
				start = currentStart;
				end = i;
            }
            //if sum < 0, make it zero, so tha the window can be changed, since it is 0, window changes
            if(sum < 0){
				sum = 0; 
				currentStart = i+1; //move the window ahead
			}
        }
        return max_sum;
    }
}