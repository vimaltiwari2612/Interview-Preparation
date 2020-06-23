/*
Suppose there is a circle. There are N petrol pumps on that circle. You will be given two sets of data.
1. The amount of petrol that every petrol pump has.
2. Distance from that petrol pump to the next petrol pump.
Find a starting point where the truck can start to get through the complete circle without exhausting its petrol in between.
Note :  Assume for 1 litre petrol, the truck can go 1 unit of distance.

Example (To be used only for expected output)
Input:
1
4
4 6 6 5 7 3 4 5
Output:
1

Explanation:
Testcase 1: there are 4 petrol pumps with amount of petrol and distance to next petrol pump value pairs as {4, 6}, {6, 5}, {7, 3} and {4, 5}. The first point from 
where truck can make a circular tour is 2nd petrol pump. Output in this case is 1 (index of 2nd petrol pump).
*/

// In java function tour() takes two arguments array of petrol
// and array of distance
class GfG
{
    int tour(int petrol[], int distance[])
    {
	// Your code here
	    int size = petrol.length;
	    
	    int currentPetrolLevel = 0, start = 0, next = 0, count = 0;
	    for(int i = 0; count != size;){
	        count++;
	        if(currentPetrolLevel == 0){
    	        currentPetrolLevel += petrol[i];
    	        currentPetrolLevel -= distance[i];
    	        start = i;
    	        next = (i+1 == size)?0:i+1;
    	        if(i+1 != size)
	                i++;
	            else
	                i = 0;
    	        continue;
	        }
	        
	        currentPetrolLevel += petrol[i];
	        if(currentPetrolLevel > distance[i]){
	            if(i+1 != size)
	                i++;
	            else
	                i = 0;
	        }
	        else{
	            currentPetrolLevel = 0;
	            count = 0;
	            i = next;
	        }
	    }
	    return start;
	    
    }
}