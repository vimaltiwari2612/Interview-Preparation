

/*
Below are the permutations of string ABC.
ABC ACB BAC BCA CBA CAB
TIme complexity : O(n*n!) Note that there are n! permutations and it requires O(n) time to print a permutation
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
	    while(N>0){
	        String a = sc.nextLine();
	        permutation(a,0,a.length()-1);
	        N--;
	        System.out.println();
	    }
	 }
	
	 static void permutation(String a, int i, int j){
	        
	      if(i==j)
	        System.out.print(a+" ");
	        
	     for(int k = i; k <= j ; k++){
	         a = swap(a,i,k);//fixing the first letter
	         permutation(a,i+1,j); //call for remainig string
	         a = swap(a,i,k); //backtrack, restore the original state for next iteration
	     } 
	    
	 }
	 
	 static String swap(String a, int i, int j){
	     char[] charArray = a.toCharArray(); 
        char temp = charArray[i] ; 
        charArray[i] = charArray[j]; 
        charArray[j] = temp; 
        return String.valueOf(charArray);
	     
	 }
	
}