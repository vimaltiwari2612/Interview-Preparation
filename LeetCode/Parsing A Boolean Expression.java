/*
Return the result of evaluating a given boolean expression, represented as a string.

An expression can either be:

"t", evaluating to True;
"f", evaluating to False;
"!(expr)", evaluating to the logical NOT of the inner expression expr;
"&(expr1,expr2,...)", evaluating to the logical AND of 2 or more inner expressions expr1, expr2, ...;
"|(expr1,expr2,...)", evaluating to the logical OR of 2 or more inner expressions expr1, expr2, ...
 

Example 1:

Input: expression = "!(f)"
Output: true
Example 2:

Input: expression = "|(f,t)"
Output: true
Example 3:

Input: expression = "&(t,f)"
Output: false
Example 4:

Input: expression = "|(&(t,f,t),!(t))"
Output: false
*/


class Solution {
    public boolean parseBoolExpr(String expression) {
        
        Stack<Character> s = new Stack<Character>();
        expression = expression.replaceAll(",","");
        
        String p = "";
        for(char c : expression.toCharArray()){
            
            s.push(c);
          
            if(c == ')'){
                while(s.peek() != '('){
                    char d = s.pop();
                    if(d == 't' || d == 'f'){
                       p = String.valueOf(d) + p;
                    }
                }
                s.pop();
                char exp = s.pop();
                boolean b = solveExp(exp,p);
                if(b) s.push('t');
                else s.push('f');
                  p = "";
            }
           
        }
        
        if(s.peek() == ')'){
             while(s.peek() != '('){
                    char d = s.pop();
                    if(d == 't' || d == 'f'){
                       p = String.valueOf(d) + p;
                    }
                }
                s.pop();
                char exp = s.pop();
                boolean b = solveExp(exp,p);
                if(b) s.push('t');
                else s.push('f');
                  p = "";
        }
        return s.peek() == 't'? true:false;
    }
    
    private boolean solveExp(char exp, String p){
        
                if(exp == '&'){
                    return !p.contains("f");
                }
                else if(exp == '|'){
                   return p.contains("t");
                }
                else if(exp == '!'){
                    if(p.contains("t"))
                        return false;
                    else
                        return true;
                }
        return false;
    }
}