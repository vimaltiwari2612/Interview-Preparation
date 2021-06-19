public class K_Largest_Elements {
	/*
    Given an array Arr of N positive integers, find K largest elements from the array.  The output elements should be printed in decreasing order.
    
        Input: 
        N = 5, K = 2
        Arr[] = {12, 5, 787, 1, 23}
        Output: 787 23
        Explanation: 1st largest element in the
        array is 787 and second largest is 23.
    */
    public static List<integer> getKLargestElements(List<integer> arrayOfIntegers, integer K){
        List<integer> finalResult = new List<integer>();
        if(arrayOfIntegers != null && arrayOfIntegers.size() > 0 && K > 0){
            //sort - it uses merge which is O(nlogn)
            arrayOfIntegers.sort();
            //traverse in reverse direction
            for(integer i = arrayOfIntegers.size() - 1; i>=0 ; i--){
                if(K > 0){
                    finalResult.add(arrayOfIntegers[i]);
                    K--;
                }else{
                    break;
                }
            }
        }
        return finalResult;
    }
   
}