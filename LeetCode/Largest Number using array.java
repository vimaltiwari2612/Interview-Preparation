/*
Given a list of non negative integers, arrange them such that they form the largest number.

Example 1:

Input: [10,2]
Output: "210"
Example 2:

Input: [3,30,34,5,9]
Output: "9534330"
*/

class Solution {
    public String largestNumber(int[] nums) {
        
        List<Long> li = new ArrayList<Long>();
        int count = 0;
        for(int a : nums){
            if(a == 0) count++;
            li.add((long)a);
        }
        if(count == nums.length) return "0";
        Collections.sort(li, new Comparator<Long>(){
            
            public int compare(Long a, Long b){
                
                long c = Long.parseLong(String.valueOf(a+""+b));
                long d =  Long.parseLong(String.valueOf(b+""+a));
                if(c > d){
                    return -1;
                }else{
                    return 1;
                }
               
            }
        });
        String f = "";
        System.out.println(li);
        for(Long a : li){
            f += String.valueOf(a);
        }
        //remove trailing zeros is any
        
        return f;
    }
}