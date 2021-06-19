public class TripletWithSumZero {
    /*
        Given an array of integers. Check whether it contains a triplet that sums up to zero. 
        
        Example 1:
        
        Input: n = 5, arr[] = {0, -1, 2, -3, 1}
        Output: 1
        Explanation: 0, -1 and 1 forms a triplet
        with sum equal to 0.
        Example 2:
        
        Input: n = 3, arr[] = {1, 2, 3}
        Output: 0
        Explanation: No triplet with zero sum exists. 
        */
    public static boolean hasTripletWithSumZero(List<Integer> arr){
        if(arr == null || arr.size() < 3) return false;
        arr.sort();
        integer size = arr.size();
        integer i = 0 , j = 2;
        for(; j < size ;){
            integer a = arr[i];
            integer b = arr[j-i];
            integer c = arr[j];
            if((a + b + c) == 0) return true;
            i++;
            j++;
        }
        return false;
    }
}