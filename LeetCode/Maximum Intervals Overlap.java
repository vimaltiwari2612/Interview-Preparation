/*
Consider a big party where a log register for guest’s entry and exit times is maintained. Find the time at which there are maximum guests in the party. Note that 
entries in register are not in any order.

The first line of input contains an integer T denoting the number of test cases. Then T test cases follow. Each test case contains an integer n denoting the size of the entry and exit array. Then the next two line contains the entry and exit array respectively.

Output:
Print the maximum no of guests and the time at which there are maximum guests in the party.

Constraints:
1<=T<=10^5
1<=N<=10^5
1<=entry[i],exit[i]<=10^5

Example:
Input:
2
5
1 2 10 5 5
4 5 12 9 12
7
13 28 29 14 40 17 3 
107 95 111 105 70 127 74 

Output:
3 5
7 40

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
    	        int size = sc.nextInt();
    	        sc.nextLine();
	            int[] enter = Arrays.stream(sc.nextLine().split(" ")).mapToInt(Integer::parseInt).toArray();
	            int[] exit = Arrays.stream(sc.nextLine().split(" ")).mapToInt(Integer::parseInt).toArray();
	            
	            int max = 0,i=0,j=0,fi = 0,time = 0;
	            Arrays.sort(enter);
	            Arrays.sort(exit);
	            
	            while(i<size && j < size){
	                if(enter[i] <= exit[j]){
	                    max++;
	                    
	                    if(fi < max){
	                        fi = max;
	                        time = enter[i];
	                    }
	                    i++;
	                }
	                else{
	                    j++;
	                    max--;
	                }
	                    
	            }
	            System.out.println(fi+" "+time );
	            N--;
	        }
	 }
}