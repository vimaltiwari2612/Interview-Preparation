/*
Count pairs with given sum:
Approach: Two Different methods have already been discussed here. Here, a method based on sorting will be discussed.

Sort the array and take two pointers i and j, one pointer pointing to the start of the array i.e. i = 0 and another pointer pointing to the end of the array i.e. j = n – 1.
If arr[i] + arr[j] is
Greater than the sum then decrement j.
Lesser than the sum then increment i.
Equals to the sum then count such pairs.

Input
2
4 6
1  5  7 1
4 2
1 1 1 1
Output
2
6
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
	        String inp = sc.nextLine();
	        String ip = sc.nextLine();
	        int count = 0;
	        int[] p = Arrays.stream(inp.trim().split("\\s+")).mapToInt(Integer::parseInt).toArray();
	        int size = p[0];
	        int target = p[1];
	        p = Arrays.stream(ip.trim().split("\\s+")).mapToInt(Integer::parseInt).toArray();
	        Map<Integer,Integer> m = new HashMap<Integer,Integer>();
	        //sorting nlogn
	        Arrays.sort(p);
	        //find the max point from last, set pointer there
	        int j = size - 1;
	        for(int i = size - 1 ; i >=0 ;i--)
	            if(target <= p[i]) j--;
	        /*
	         If arr[i] + arr[j] is
                Greater than the sum then decrement j.
                Lesser than the sum then increment i.
                Equals to the sum then count such pairs.
	        */
	        for(int i = 0;i<j;){
	            
	            int sum = p[i]+p[j];
	            //move ahead to left
	            if(sum < target){
	                i++;
	            }
	            //count all, till equal
	            else if(sum == target){
	                   int k = i;
	                   while(sum == target && i < j){
	                       count++;
	                       i++;
	                       sum = p[i]+p[j];
	                   }
	                   j--;//move right
	                   i=0;//reset to start
	            }
	            //sum greater than target, reduce from right
	            else if(sum > target){
	                j--;
	            
	            }
	           
	        }
	          System.out.println(count);
	        N--;
	    }
	 }
}