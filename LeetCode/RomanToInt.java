class RomanToInt {
   public static int romanToInt(String s) {
	if (s == null || s.length() == 0)
		return -1;
        HashMap<Character, Integer> map = new HashMap<Character, Integer>();
        map.put('I', 1);
        map.put('V', 5);
        map.put('X', 10);
        map.put('L', 50);
        map.put('C', 100);
        map.put('D', 500);
        map.put('M', 1000);
        int len = s.length(), result = map.get(s.charAt(len - 1));
           //reverse iterate
        for (int i = len - 2; i >= 0; i--) {
            if (map.get(s.charAt(i)) >= map.get(s.charAt(i + 1))) //if next is greater
                result += map.get(s.charAt(i)); //add
            else
                result -= map.get(s.charAt(i));//subtract
        }
        return result;
    }
}