
/*

Given an array of integers (A[])  and a number x, find the smallest subarray with sum greater than the given value.

Examples:
A[] = {1, 4, 45, 6, 0, 19}
   x  =  51
Output: 3
Minimum length subarray is {4, 45, 6}

A[] = {1, 10, 5, 2, 7}
   x  = 9
Output: 1
Minimum length subarray is {10}

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
    	    String[] p = sc.nextLine().split(" ");
    	    int n = Integer.parseInt(p[0]);
    	    int x = Integer.parseInt(p[1]);
    	    int[] p1 = Arrays.stream(sc.nextLine().split(" ")).mapToInt(Integer::parseInt).toArray();
	        int count = Integer.MAX_VALUE,sum = 0,start = 0,end = 0;
	        //create window from start to end
	        for(int i = start; i< n ;){
	            sum = sum + p1[i];
  
	             end = i;
	            
                while(sum > x){
	                count = Math.min(count,end - start + 1);
	                   //reduce the window
	                sum -= p1[start];
	                
	                start ++;
	                
	            }
	            i++;
	            
	        }
	        System.out.println(count);
	        
	        N--;
	    }
	    
	 }
}