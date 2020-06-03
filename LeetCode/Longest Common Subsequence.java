/*
Given two strings text1 and text2, return the length of their longest common subsequence.

A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.

 

If there is no common subsequence, return 0.

 

Example 1:

Input: text1 = "abcde", text2 = "ace" 
Output: 3  
Explanation: The longest common subsequence is "ace" and its length is 3.
Example 2:

Input: text1 = "abc", text2 = "abc"
Output: 3
Explanation: The longest common subsequence is "abc" and its length is 3.
Example 3:

Input: text1 = "abc", text2 = "def"
Output: 0
Explanation: There is no such common subsequence, so the result is 0.
 

*/

class Solution {
    public int longestCommonSubsequence(String a, String b) {
         int[][] m = new int[a.length() + 1][b.length()+1];
        //init
        for(int i=0;i<a.length();i++){
            for(int j=0;j<b.length();j++){
                if(i == 0 || j == 0) 
                    m[i][j] = 0;
            }
        }
        
        //memorization
        for(int i=1;i<=a.length();i++){
            for(int j=1;j<=b.length();j++){
              
                //if same
                if(a.charAt(i-1) == b.charAt(j-1))
                    m[i][j] = 1 + m[i-1][j-1];
                else 
                    m[i][j] = Math.max(m[i-1][j],m[i][j-1]);
            }
        }
        return m[a.length()][b.length()];
    }
}