/*
Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Example:

Input: [0,1,0,3,12]
Output: [1,3,12,0,0]
Note:

You must do this in-place without making a copy of the array.
Minimize the total number of operations.
*/

class Solution {
    public void moveZeroes(int[] num) {
        int j = 0;
        for(int i=0;i < num.length ; i++){
            if(num[i] != 0 ){
                int temp = num[i];
                num[i] = num[j];
                num[j] = temp;
                j++;
            }
           
        }
    }
}