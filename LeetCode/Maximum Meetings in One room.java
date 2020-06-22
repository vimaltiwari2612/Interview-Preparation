/*
There is one meeting room in a firm. There are N meetings in the form of (S[i], F[i]) where S[i] is the start time of meeting i and F[i] is finish time of meeting 
i. The task is to find the maximum number of meetings that can be accommodated in the meeting room. Print all meeting numbers

Input : s[] = {1, 3, 0, 5, 8, 5}, f[] = {2, 4, 6, 7, 9, 9}
Output : 1 2 4 5
First meeting [1, 2]
Second meeting [3, 4]
Fourth meeting [5, 7]
Fivth meeting [8, 9]

Input : s[] = {75250, 50074, 43659, 8931, 11273, 27545, 50879, 77924},
f[] = {112960, 114515, 81825, 93424, 54316, 35533, 73383, 160252 }
Output : 6 7 1
*/
import java.io.*;
import java.util.*;
class GFG {
	public static void main (String[] args) {

    	        int enter[] = { 1, 3, 0, 5, 8, 5 };  
                int size = enter.length;
                int exit[] = { 2, 4, 6, 7, 9, 9 };   
                int time = 0;
                
                //sort both array, form a sigle POJO called meeting
                List<Meeting> meet = new ArrayList<Meeting>(size);
                
                 for (int i = 0; i <size; i++)  
                    { 
                        Meeting m = new Meeting();
                        // Starting time of meeting i. 
                        m.start = enter[i];  
                          
                        // Finishing time of meeting i 
                        m.end = exit[i];  
                          
                        // Original position/index of meeting 
                        m.position = i + 1;  
                        
                        meet.add(m);
                    } 
                
                Collections.sort(meet, new Comparator<Meeting>(){
                    
                    public int compare(Meeting a, Meeting b){
                        return a.end - b.end;
                    }
                    
                });
                
             
                for(int i = 0;i<size;i++){
                    
                    if(meet.get(i).start > time)
                    {
                     System.out.println(meet.get(i).position); 
                             
                        time = meet.get(i).end;
                    }
                    
                    
                }	        
                	            
                	            
                 
                	        
                	           

	}
	
	
}

class Meeting{
	    int start;
	    int end;
	    int position;
	}