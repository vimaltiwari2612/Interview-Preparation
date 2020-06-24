/*
Given a string S consisting of lowercase latin letters, arrange all 
its letters in lexographical order using Counting Sort.
		Input:
		2
		5
		edsab
		13
		geeksforgeeks
		Output:
		abdes
		eeeefggkkorss

		Explanation:
		Testcase 1: In lexicographical order , string will be abdes.
		Testcase 2: In lexicographical order , string will be eeeefggkkorss.
*/

class GfG
{
    
    // Function to do count sort
    // seq[]: input array
    // return the sorted input array of character
    public static char[] countSort(char seq[])
    {
        // add your code here    
        
        int[] arr = new int[256];
        int j = 0;
        for(char c: seq){
            ++arr[(int)c];
        }
        
        for(int i = 0;i<256;i++){
            if(arr[i] > 0){
                int n = arr[i];
                while(n > 0){
                    seq[j] = (char)i;
                    j++;
                    n--;
                }
            }
        }
        return seq;
    }
}