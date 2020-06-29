/*
Given a square chessboard of N x N size, the position of Knight and position of a target is given. We need to find out minimum steps a Knight will 
take to reach the target position.

Print the minimum steps the Knight will take to reach the target position.

Constraints:
1<=T<=100
1<=N<=20
1<=knight_pos,targer_pos<=N

Example:
Input:
2
6
4 5
1 1
20
5 7
15 20

Output:
3
9
*/


import java.util.*;
import java.lang.*;
import java.io.*;
class GFG
 {
   
	public static void main (String[] args)
	 {
	    Scanner sc = new Scanner(System.in);
	    int N = sc.nextInt();
	    sc.nextLine();
	    while(N > 0){
	        //code
	        int size = sc.nextInt();
	        sc.nextLine();
	        int[] knightCor = Arrays.stream(sc.nextLine().split(" ")).mapToInt(Integer::parseInt).toArray(); 
	        int[] target = Arrays.stream(sc.nextLine().split(" ")).mapToInt(Integer::parseInt).toArray(); 
	        int o = knightTour(size,knightCor[0],knightCor[1],target[0],target[1]);
	        System.out.println(o);
	        N--;
	    }
	 }
	 
	 
	 public static int knightTour(int size,int x,int y, int xt, int yt){
	     
	    if(x == xt && y == yt) return 0;
	     
	      // x and y direction, where a knight can move 
        int dx[] = { -2, -1, 1, 2, -2, -1, 1, 2 }; 
        int dy[] = { -1, -2, -2, -1, 1, 2, 2, 1 }; 
        //visited 
        int[][] visited = new int[size+1][size+1];
        //queuq
        LinkedList<Cell> cells = new LinkedList<Cell>();
        
        cells.add(new Cell(x,y,0));
        //BFS
        while(!cells.isEmpty()){
            Cell c = cells.removeFirst();
            visited[c.x][c.y] = 1;
            
            for(int i = 0;i<8;i++){
                int x1 = c.x + dx[i];
                int y1 = c.y + dy[i];
                
                if(x1 == xt && y1 == yt) return c.dis +1;
                //add all valid corodianted to queuq
                if(isInside(x1,y1,size) && visited[x1][y1] != 1){
                    cells.add(new Cell(x1,y1,c.dis + 1));
                }
            }
        }
        
        return Integer.MAX_VALUE;
	    
	 }
	 
	 // inside Board 
    static boolean isInside(int x, int y, int N) 
    { 
        if (x >= 1 && x <= N && y >= 1 && y <= N) 
            return true; 
        return false; 
    } 
}

// Class for storing a cell's data 
    class Cell { 
        int x, y; 
        int dis; 
  
        public Cell(int x, int y, int dis) 
        { 
            this.x = x; 
            this.y = y; 
            this.dis = dis; 
        } 
    } 