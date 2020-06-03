/*
Given a string s, find the longest palindromic subsequence's length in s
*/

class Solution {
    public int longestPalindromeSubseq(String a) {
        //reverse the string and find LCS
        String b = new StringBuilder(a).reverse().toString();
        
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