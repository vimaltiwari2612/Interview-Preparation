/*
https://practice.geeksforgeeks.org/explore/?category%5B%5D=Strings&company%5B%5D=Google&difficulty%5B%5D=0&difficulty%5B%5D=1&page=1&company%5B%5D=Google&category%5B%5D=Strings
*/
public class StringInterviewQuestions {
    
    //Function is to check whether two strings are anagram of each other or not.
    public static boolean isAnagram(String a,String b)
    {
        Map<String, Integer> charVsFreqMap = new Map<String, Integer>();
        // populate char vs freq map for first string
        for(String elem : a.split('')){
            if(!charVsFreqMap.containsKey(elem)){
                charVsFreqMap.put(elem,0);
            }
            
            charVsFreqMap.put(elem, charVsFreqMap.get(elem)+1);
        }
        //iterate over second string
        for(String elem : b.split('')){
            //if found
            if(charVsFreqMap.containsKey(elem)){
                //reduce the frequency
                charVsFreqMap.put(elem, charVsFreqMap.get(elem) - 1);
                
            }else{
                //not found, just return
                return false;
            }
        }
        
        //iterate map
        for(Integer i : charVsFreqMap.values()){
            //if any of the frequency is > 0 means, first string has more chars/freq
            //if any of the frequency is < 0 measn, second string has more chars/freq
            if(i != 0){
                return false;
            }
        }
        
        return true;
        
    }
    
    
        /*
    Given a string, eliminate all “b” and “ac” in the string, replace them in-place and iterate over the string once.
    
    Example 1:
    
    Input: str = "aacbacc"
    Output: ac
    Explanation: Iterate once and remove
    occurrence of "b" and "ac"

    */
    public static String remove(String str, String c) {
        
        while(str.indexOf(c) > -1){
            integer index = str.indexOf(c);
            String a = str.substring(0, index);
            string b = str.substring(index+c.length());
            if(index == 0){
                str = b;
            }else if(index == str.length() - 1){
                str = a;
            }else
                str = a+b;
        }
        return str;
        
    }
    
    //Function to check if two strings are isomorphic.
    /*  Two strings str1 and str2 are called isomorphic if there is a one to one mapping possible for every character of str1 to every character of str2 while preserving the order.
        Note: All occurrences of every character in ‘str1’ should map to the same character in ‘str2’
        
        Example 1:
        
        Input:
        str1 = aab
        str2 = xxy
        Output: 1
        Explanation: There are two different
        charactersin aab and xxy, i.e a and b
        with frequency 2and 1 respectively.
        Example 2:
        
        Input:
        str1 = aab
        str2 = xyz
        Output:
        Explanation: There are two different
        charactersin aab but there are three
        different charactersin xyz. So there
        won't be one to one mapping between
        str1 and str2.
    */
    public static boolean areIsomorphic(String str1,String str2) {
        if(str1.length() != str2.length()) return false;
        // Your code here
        Map<Integer, Integer> mapping = new Map<Integer, Integer>();
        Map<Integer, Integer> mapping2 = new Map<Integer, Integer>();
        integer i =0;
        while(i<str1.length()){
            integer f = str1.charAt(i);
            integer s = str2.charAt(i);
            //if both are new
            if(!mapping.containsKey(f) && !mapping2.containsKey(s)){
                mapping2.put(s,f);
                mapping.put(f,s);
            }else if(mapping.get(f) != s ){
                return false;
            }
            i++;
        }
        return true;
    }
    
    
    //Function to find the smallest window in the string s consisting
    //of all the characters of string p.
    /*
        Given two strings S and P. Find the smallest window in the S consisting of all the characters of P.
        
        Example 1:
        
        Input:
        S = "timetopractice"
        P = "toc"
        Output: 
        toprac
        Explanation: "toprac" is the smallest
        substring in which "toc" can be found.
        Example 2:
        
        Input:
        S = "zoomlazapzo"
        P = "oza"
        Output: 
        apzo
        Explanation: "apzo" is the smallest 
        substring in which "oza" can be found.
        */
    public static String smallestWindow(String s, String p)
    {
        
        List<String> itemsFound = new List<String>();
        
        integer SIZE = s.length();
        integer start = 0;
        integer ending = 0;
        integer lastStart = 0;
        integer lastEnding = 0;
        integer count = 0;
        integer j = -1;
        for(String i : s.split('')){
            
            j++;
            if(itemsFound.size() == p.length()) {
                //all found
                ending = j; //previous element
                
                if((ending - start) < count || count == 0){
                    count = ending - start;
                    lastStart = start;
                    lastEnding = ending;
                }
                //close old window here
                itemsFound.clear();
                //start new window
                if(p.indexOf(i) > -1){
                    if(itemsFound.isEmpty()){
                        start = j;
                    }
                    itemsFound.add(i);
                }
                
            }
            else if(itemsFound.contains(i)){
                //do nothing
            }
            else if(p.indexOf(i) > -1){
                if(itemsFound.isEmpty()){
                    start = j;
                }
                itemsFound.add(i);
            }
            //last iteration, cornet case, in which last item is a requested item, in this case, ending won;t be updated to new J, so incremetn it here
            if(j+1 == SIZE-1){
               j++; 
            }
        }
        
        //for last iteration
        if(itemsFound.size() == p.length()){
            //all found
            ending = j; //previous element
            
            if((ending - start) < count || count == 0){
                count = ending - start;
                lastStart = start;
                lastEnding = ending;
            }
        }
        s = s.substring(lastStart,lastEnding);
     
        //if found, reduece window from start till end 
        for(integer i = 0;;){
            String ch = s.substring(i,i+1);
            
            String newStr = s.substring(i+1);
            //if a req. element
            if(p.contains(ch)){
                if(newStr.indexOf(ch) > -1){
                    s = newStr;
                    
                }
                //and not present further, break, its the final answer
                else{
                    break;
                }
            }else{
                s = newStr;
                
            }
            
        }
        
        return s;
    }
    
    
    /*
    Given a string you need to print the size of the longest possible substring that has exactly K unique characters. If there is no possible substring then print -1.

    Example 1:
    
    Input:
    S = "aabacbebebe", K = 3
    Output: 7
    Explanation: "cbebebe" is the longest 
    substring with K distinct characters.
    â€‹Example 2:
    
    Input: 
    S = "aaaa", K = 2
    Output: -1
    Explanation: There's no substring with K
    distinct characters.
    */
    public static integer longestkSubstr(String s, integer k) {
        
        integer size = s.length();
        integer currrentCount = k;
        integer sizeOfStr = 0;
        integer oldStrSize = 0;
        integer startIndex = 0;
        List<String> item = new List<String>();
        String[] arr = s.split('');
        for(integer i = 0 ; i< size ;){
            String elem = arr[i];
            if(item.isEmpty()){
                item.add(elem);
                currrentCount--;
                sizeOfStr++;
            }
            else if(!item.contains(elem)){
                if(currrentCount > 0){
                    currrentCount--;
                    sizeOfStr++;
                    item.add(elem);
                }else{
                    if(oldStrSize < sizeOfStr){
                        oldStrSize = sizeOfStr;
                    }
                    sizeOfStr = 0;
                    currrentCount=k;
                    item.clear();
                    //find the next unique char index, reset the iteration to next
                
                    for(integer j = startIndex ; j < s.length() - 2; j++){
                        if(s.charAt(j) != s.charAt(j+1)){
                            startIndex = j+1;
                            i = j+1;
                            break; 
                        }
                    }
                    continue;
                }
            }else if(item.contains(elem)){
                sizeOfStr++;
            }
          
           i++;
        }
        if(oldStrSize < sizeOfStr){
            oldStrSize = sizeOfStr;
        }
        if(currrentCount > 0) return -1;
        return oldStrSize;
        
    }
    
    /*
    Given three strings A, B and C your task is to complete the function isInterleave which returns true if C is an interleaving of A and B else returns false. 
    C is said to be interleaving A and B, if it contains all characters of A and B and order of all characters in individual strings is preserved.

    Example 1:
    
    Input:
    A = YX, B = X, C = XXY
    Output: 0
    Explanation: XXY is not interleaving
    of YX and X
    Example 2:
    
    Input:
    A = XY, B = X, C = XXY
    Output: 1
    Explanation: XXY is interleaving of
    XY and X.
    */
    public static boolean isInterLeave(String a,String b,String c)
	{
	    String[] itemsInA = a.split('');
	    String[] itemsInB = b.split('');
	    integer lastIndex = -1;
	    //all char of A in C
	    System.debug('processing A '+a);
	    for(String item : itemsInA){
	        system.debug('c '+ c +'  has '+item);
	        integer index = c.indexOf(item); 
	        System.debug(index + ' '+ lastIndex );
	        if(lastIndex == -1){
	            lastIndex = index; continue;
	        }
	        //if not present or check the order is not correct
	        if(index == -1 || lastIndex > index) return false;
	        lastIndex = index;
	    }
	    System.debug('processing B '+b);
	    lastIndex = -1;
	    //all char of B in C
	    for(String item : itemsInB){
	        system.debug('c '+ c +'  has '+item);
	        integer index = c.indexOf(item); 
	        
	        System.debug(index + ' '+ lastIndex);
	        if(lastIndex == -1){
	            lastIndex = index; continue;
	        }
	        //if not present or check the order is not correct
	        if(index == -1 || lastIndex > index) return false;
	        lastIndex = index;
	    }
	    
	    return true;
	}
    
    
    //Find largest word in dictionary
    /*
    Given a string and a string dictionary, find the longest string in the dictionary that can be formed by deleting some characters of the given string. If there are more than one possible results, return the longest word with the smallest lexicographical order. If there is no possible result, return the empty string.

    Example 1:
    
    Input: d = {"ale", "apple", "monkey", "plea"}
           S = "abpcplea"
    Output: "apple" 
    Explanation: After deleting "b", "c"
    "a" S became "apple" which is present
    in d.
    Example 2:
    
    Input: d = {"a", "b", "c"}
           S = "abpcplea"
    Output: "a"
    Explanation: After deleting "b", "p"
    "c", "p", "l", "e", "a" S became 
    "a" which is present in d.
        
    */
    public static String findLongestWord(String S, List<String> dictionary) {
        
        String lastFoundWord = '';
        
        for(String word : dictionary){
            //check if it is present in given S or not
            integer lastIndex = -1;
            boolean found = true;
            for(String letter : word.split('')){
    	        integer index = S.indexOf(letter); 
    	        if(lastIndex == -1){
    	            lastIndex = index; continue;
    	        }
    	         if(lastIndex > index){
	                //might be a repeating letter, so find it's next occurance
	                integer newIndex = S.substring(index+1).indexOf(letter); 
	                if(newIndex != -1 && newIndex > lastIndex){
	                    index = newIndex;
	                }
    	        }
    	        //if not present or check the order is not correct
    	        if(index == -1 || lastIndex > index){
    	            found = false;
    	            break;
    	        }
    	        lastIndex = index;
            }
            
            if(found){
                if(lastFoundWord.length() < word.length()){
                    lastFoundWord = word;
                }
            }
        }
        System.debug(lastFoundWord);
        return lastFoundWord;
    }
    
    
    //sum of all number in a list
    public static Integer sumAll(List<String> items){
        if(items == null || items.size() == 0) return 0;
        //find the max length string
        integer size = 0;
        for(String item : items){
            if(item.length() > size){
                size = item.length();
            }
        }
        
        //not count
        integer count = 0;
        //itereate and convert
        String a = items.get(0);
        
        //do while
        for(integer i = 1 ; i < items.size() ; i++) {
            String b = items[i];
            
            //preppand 0's
            while(b.length() < size){
               b = '0'+b;
            }
             //preppand 0's
            while(a.length() < size){
               a = '0'+a;
            }
            //now let's sum them
            integer j = size - 1;
            integer sum = 0;
            integer carry = 0;
            String newStr = '';
            while(j >= 0){
                integer k = Integer.valueOf(a.substring(j,j+1));
                integer l = Integer.valueOf(b.substring(j,j+1));
                j--;
                sum = (carry + k + l);
                carry = sum/10;
                integer rem = Math.mod(sum,10);
                newStr = rem + newStr;
            }
            if(carry > 0){
                newStr = String.valueOf(carry) + newStr;
            }
            a = newStr;
            if(a.length() > size){ 
                size = a.length();
            }
        }
        return Integer.valueOf(a);
    }
    
    //testing
    public static void testMethods(){
        
        System.assert(StringInterviewQuestions.sumAll(new List<String>{'123','31'}) == 154);
        System.assert(StringInterviewQuestions.sumAll(new List<String>{'20','40','3'}) == 63);
        System.assert(StringInterviewQuestions.sumAll(new List<String>{'100','1','19'}) == 120);
        
        System.assert(StringInterviewQuestions.isAnagram('geeksforgeeks','forgeeksgeeks') == true);
        System.assert(StringInterviewQuestions.isAnagram('allergy','allergic') == false);
        
        System.assert(StringInterviewQuestions.remove('test','t') == 'es');
        System.assert(StringInterviewQuestions.remove('aaabbcc','b') == 'aaacc');
        
        System.assert(StringInterviewQuestions.areIsomorphic('aab','xxy') == true);
        System.assert(StringInterviewQuestions.areIsomorphic('xxx','zzz') == true);
        System.assert(StringInterviewQuestions.areIsomorphic('abcda','xsdex') == true);
        System.assert(StringInterviewQuestions.areIsomorphic('abc','xyy') == false);
        System.assert(StringInterviewQuestions.areIsomorphic('aac','xyz') == false);
        
        System.assert(StringInterviewQuestions.smallestWindow('timetopractice','toc') == 'toprac');
        System.assert(StringInterviewQuestions.smallestWindow('zoomlazapzo','oza') == 'apzo');
        
        System.assert(StringInterviewQuestions.longestkSubstr('aabacbebebe',3) == 7);
        System.assert(StringInterviewQuestions.longestkSubstr('abcd',3) == 3);
        System.assert(StringInterviewQuestions.longestkSubstr('abcdd',4) == 5);
        System.assert(StringInterviewQuestions.longestkSubstr('aaaaa',2) == -1);
        System.assert(StringInterviewQuestions.longestkSubstr('aaabaa',2) == 6);
        System.assert(StringInterviewQuestions.longestkSubstr('a',2) == -1);
        System.assert(StringInterviewQuestions.longestkSubstr('abcd',2) == 2);
        System.assert(StringInterviewQuestions.longestkSubstr('abbbcd',1) == 3); 

        System.assert(StringInterviewQuestions.isInterLeave('YX','X', 'XXY') == false);
        System.assert(StringInterviewQuestions.isInterLeave('XY','X','XXY') == true);
        System.assert(StringInterviewQuestions.isInterLeave('ABC','ADE','ABCADE') == true);
        System.assert(StringInterviewQuestions.isInterLeave('ABC','ADE','AABCDE') == true);
        
        System.assert(StringInterviewQuestions.findLongestWord('abpcplea',new List<String>{'ale', 'apple', 'monkey', 'plea'}) == 'apple');
        System.assert(StringInterviewQuestions.findLongestWord('abpcplea',new List<String>{'a', 'b', 'c'}) == 'a');
        System.assert(StringInterviewQuestions.findLongestWord('treomypjtldegs',new List<String>{'temple', 'temp', 'temples'}) == 'temp');
        
    }

    
}