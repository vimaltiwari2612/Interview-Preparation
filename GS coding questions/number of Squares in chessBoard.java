/*
Find total number of Squares in a N*N cheesboard.

solution : Series of N*N + (N-1)(N-1) + ... so on

Example:
Input:
2
1
2

Output:
1
5

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
	            int c = sc.nextInt();
	            //sc.nextLine();
	            int p = 0;
	            while(c > 0){
	                p += (c*c);
	                c--;
	            }
	            System.out.println(p);
	            
	            N--;
	        }
	 }
}