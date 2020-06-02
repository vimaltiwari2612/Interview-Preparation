/*
*
*Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

Note that after backspacing an empty text, the text will continue empty.

Example 1:

Input: S = "ab#c", T = "ad#c"
Output: true
Explanation: Both S and T become "ac".
*
*/
class Solution {
    public boolean backspaceCompare(String S, String T) {
      
        return filter(S).equals(filter(T));
    }
    
    private String filter(String k){
        String p="";
        Stack<Character> backSpaces = new Stack<Character>();
        for(int i=k.length() - 1 ; i>=0; i--)
        {
            char c = k.charAt(i);
            if(c == '#'){
                //push in stack
                backSpaces.push(c);
            }
            else{
                //check is something
                if(!backSpaces.isEmpty())
                    backSpaces.pop(); //pop it and leave it
                else
                    p = String.valueOf(c) + p; //consider it
            }
           
        }
        return p;
    }
    
    
}