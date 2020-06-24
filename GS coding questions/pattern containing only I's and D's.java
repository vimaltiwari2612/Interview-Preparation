/*
Given a pattern containing only I's and D's. I for increasing and D for decreasing.
Devise an algorithm to print the minimum number following that pattern.
Digits from 1-9 and digits can't repeat.

	Input
	5
	D
	I
	DD
	IIDDD
	DDIDDIID

	Output
	21
	12
	321
	126543
	321654798
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
	        char[] c = sc.nextLine().toCharArray();
	        int size = c.length;
	        int Dsize = 0, Isize=0, count=0, currentCount = 0;
	        int  i = 0;
	        String num = "";
	        for(; i < size ; i++){
	            //if D
	            if(c[i] == 'D'){
	                //once I's Break
	                if(Isize != 0){
					/* this condition only when String starts with I, current count will be 0*/
	                   if(currentCount == 0){
                           currentCount++;
                            num += String.valueOf(currentCount);
                       }
	                    //populate string
	                    while(Isize > 1){
	                        currentCount++;
	                        num += String.valueOf(currentCount);
	                        Isize--;
	                    }
	                }
	                Isize = 0;
	                //count the D's
	                 Dsize++;
	            }
	            //if I
	            else if(c[i] == 'I'){
	                //once D's break
	                if(Dsize != 0){
	                    Dsize++;
	                   
	                   currentCount += Dsize;
	                   count = currentCount;
	                    //populate string
	                    while(Dsize > 0){
	                        num += String.valueOf(count);
	                        count--;
	                        Dsize--;
	                    }
	                 
	                }
	                Isize++;
	                Dsize = 0;
	            }
	          
	        }
    	   
    	   if(Dsize != 0){
    	                    Dsize++;
    	                   
    	                   currentCount += Dsize;
    	                   count = currentCount;
    	                    //populate string
    	                    while(Dsize > 0){
    	                        num += String.valueOf(count);
    	                        count--;
    	                        Dsize--;
    	                    }
     
    	                }
    	               
    	               
    	           if(Isize != 0){
				   /* this condition only when String starts with I, current count will be 0*/
                       if(currentCount == 0){
                           currentCount++;
                            num += String.valueOf(currentCount);
                       }
    	                    while(Isize > 0){
    	                        currentCount++;
    	                        num += String.valueOf(currentCount);
    	                        Isize--;
    	                    }
    	                    
    	             
    	                    
    	                }
	        
	        System.out.println(num);
	        N--;
	    }
	 }
}