/*
Given two strings str1 and str2, return the shortest string that has both str1 and str2 as subsequences.  If multiple answers exist, you may return any of them.

(A string S is a subsequence of string T if deleting some number of characters from T (possibly 0, and the characters are chosen anywhere from T) results in the string S.)

 

Example 1:

Input: str1 = "abac", str2 = "cab"
Output: "cabac"
Explanation: 
str1 = "abac" is a subsequence of "cabac" because we can delete the first "c".
str2 = "cab" is a subsequence of "cabac" because we can delete the last "ac".
The answer provided is the shortest such string that satisfies these properties.
 
*/

class Solution {
    public String shortestCommonSupersequence(String str1, String str2) {
        String common = LCS(str1,str2);
        String finalStr = "";
        for(String a : common.split("")){
            int k = str1.indexOf(a);
            int p = str2.indexOf(a);
            finalStr += str1.substring(0,k) + str2.substring(0,p)+a;
            str1 = str1.substring(k+1);
            str2 = str2.substring(p+1);
        }
        finalStr += str1 + str2;
       
        return finalStr;
    }
    
    private String LCS(String a, String b){
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
        
        //return the lCS
        String p="";
        //take full length
        int i=a.length(), j = b.length();
        while(i>0 && j>0){
           
            //if same, move diagonally
            if(a.charAt(i-1) == b.charAt(j-1))
            {
                i--;
                j--;
                p = String.valueOf(a.charAt(i-1)) + p;
            }
            else{
                //move up
                if(m[i-1][j] > m[i][j-1]){
                    i--;
                }
                else{
                    //move left
                    j--;
                }
            }
              
        }
        
        return p;
    }
}


/////////////////*********************Solution with no extra string manipulation********************//////////////////////////
class Solution {
    public String shortestCommonSupersequence(String str1, String str2) {
        return LCS(str1,str2);
    }
    
    private String LCS(String a, String b){
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
        
        //return the lCS
        String p="";
        //take full length
        int i=a.length(), j = b.length();
        while(i>0 && j>0){
           
            //if same, move diagonally
            if(a.charAt(i-1) == b.charAt(j-1))
            {
                i--;
                j--;
                p = String.valueOf(a.charAt(i)) + p;
            }
            else{
                   
                
                //move up
                if(m[i-1][j] > m[i][j-1]){
                   p = String.valueOf(a.charAt(i-1)) + p;
                    i--;
                    
                }
                else{
                    //move left
                   p = String.valueOf(b.charAt(j-1)) + p;
                    
                    j--;
                }
              
            }
            
        }
    
        while(i>0){
            p = String.valueOf(a.charAt(i-1)) + p;
            i--;
        }
        while(j>0){
            
            p = String.valueOf(b.charAt(j-1)) + p;
            j--;
        }
        
        return p;
    }
}