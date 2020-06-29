/*
https://www.geeksforgeeks.org/rat-in-a-maze-backtracking-2/
*/

////////////////***********************************************************************************************//////////////////////

/*
3
4
1 0 0 0 1 1 0 1 0 1 0 0 0 1 1 1
4
1 0 0 0 1 1 0 1 1 1 0 0 0 1 1 1
2
1 0 1 0 

Output:
DRDDRR
DDRDRR DRDDRR
-1

Explanation:
Testcase 2: The given input is in the form
1 0 0 0
1 1 0 1
1 1 0 0
0 1 1 1
For the above matrix the rat can reach the destination at (3, 3) from (0, 0) by two paths ie DRDDRR and DDRDRR when printed in sorted order we get 
DDRDRR DRDDRR.
*/
class RATEMAZEVariant2 {
   
    public static ArrayList<String> printPath(int[][] m, int n) {
        // Your code here
        ArrayList<String> finalPath = new ArrayList<String>();
        boolean a = solve(m,0,0,finalPath);
        Collections.reverse(finalPath);
        return finalPath;
    }
    
    static boolean solve(int[][]m, int x, int y,ArrayList<String> finalPath){
        
        if(x + 1 == m.length && y + 1 == m[0].length && m[x][y] == 1) {
            return true;
        }
        
        if(isSafe(m,x,y)){
            
          
            if(solve(m,x+1,y,finalPath)){ 
                finalPath.add("D");
                return true;
            }
            //right
            if(solve(m,x,y+1,finalPath)){
                finalPath.add("R");
                return true;
            }
            
            
        }
        
        return false;
        
    }
    
    static boolean isSafe(int[][]m, int x, int y){
        return (x>=0 && x<m.length && y>=0 && y<m[0].length && m[x][y] == 1);
    }
    
    
}