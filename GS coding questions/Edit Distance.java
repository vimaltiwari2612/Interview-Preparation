/*
Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.

You have the following 3 operations permitted on a word:

Insert a character
Delete a character
Replace a character
Example 1:

Input: word1 = "horse", word2 = "ros"
Output: 3
Explanation: 
horse -> rorse (replace 'h' with 'r')
rorse -> rose (remove 'r')
rose -> ros (remove 'e')
Example 2:

Input: word1 = "intention", word2 = "execution"
Output: 5
Explanation: 
intention -> inention (remove 't')
inention -> enention (replace 'i' with 'e')
enention -> exention (replace 'n' with 'x')
exention -> exection (replace 'n' with 'c')
exection -> execution (insert 'u')
*/
class Solution {
    public int minDistance(String word1, String word2) {
         int aLen = word1.length();
         int bLen = word2.length();
        
        int[][] mat = new int[aLen+1][bLen+1];
	    //init
        //for first row, distance will be no. of character for each at any point of time
	    for(int i = 0; i<=aLen ; i++){
	        mat[i][0] = i;
	    }
	    //for first col, distance will be no. of character for each at any point of time
	    for(int j = 0;j<=bLen ; j++){
	           mat[0][j] = j;
	    }
	    
         //for others
	    for(int i = 1; i<=aLen ; i++){
	        for(int j = 1;j<=bLen ; j++){
                //if same, no need to do anything
	            if(word1.charAt(i-1) == word2.charAt(j-1))
	                mat[i][j] = mat[i-1][j-1];
	           else
                   //else do the operation and add the cost(+1)
                   // mat[i-1][j-1]: replace
                   //mat[i-1][j] : insert
                   //mat[i][j-1] : delete
	                mat[i][j] = Math.min(mat[i-1][j-1],Math.min(mat[i-1][j],mat[i][j-1])) + 1 ;
	        }
	    }
	    return mat[aLen][bLen];
    }
}