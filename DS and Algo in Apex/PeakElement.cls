public class PeakElement {
	/*
        Given an array of integers. Find a peak element in it. An array element is a peak if it is NOT smaller than its neighbours. For corner elements, we need to consider only one neighbour. 
        
        
        
        Example:
        
        
        Input: array[]= {5, 10, 20, 15}
        
        Output: 20
        
        The element 20 has neighbours 10 and 15,
        
        both of them are less than 20.
        
        
        
        Input: array[] = {10, 20, 15, 2, 23, 90, 67}
        
        Output: 20 or 90
        
        The element 20 has neighbours 10 and 15, 
        
        both of them are less than 20, similarly 90 has neighbours 23 and 6

	*/
    
    
    public static integer peakElement(List<Integer> intArray, integer left, integer right){
       
        
        if(intArray == null || intArray.size() == 1 || left == right) return -1;

        integer mid = (right + left)/2;
        //if it is a peak elem
        if(isPeak(intArray,mid)) return intArray[mid];
        //if not, check left
        integer leftSide = peakElement(intArray, left, mid -1);
        //check right
        integer rightSide = peakElement(intArray, mid+1, right);
        //which ever is +ive
        if(leftSide > -1 ) return leftSide;
        else if(rightSide > -1 ) return rightSide;
        return -1;
    }
    
    public static boolean isPeak(List<Integer> intArray, integer mid){
        return (intArray[mid -1] < intArray[mid] && intArray[mid] > intArray[mid +1]);
    }
}