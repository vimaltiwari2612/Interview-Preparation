/*

LRU Cache
-	Least recently used will be removed, using queue, the rear point one will be removed

*/

// design the class in the most optimal way

class LRUCache
{
    // store keys of cache 
    private static Deque<Integer> dq = new LinkedList<Integer>();
    //2nd table
    private static Map<Integer,Integer> lruCache = new HashMap<Integer,Integer>();
    //capacity
    private static int capacity = 0;
    LRUCache(int cap)
    {
        // Intialize the cache capacity with the given
        capacity = cap;
        //init all collections
        dq = new LinkedList<Integer>();
        lruCache = new LinkedHashMap<Integer,Integer>();
       
    }

    // This method works in O(1)
    public static int get(int key)
    {
      
        if(!dq.contains(key)) return -1;
        //take value
        int k = lruCache.get(key);
        //remove it from queue
        dq.remove(key);
        //set it again, so that it becomes recent one, least moves to lower points
         dq.add(key);
        return k;
    }

    // This method works in O(1)
    public static void set(int key, int value)
    {
        //check for key in cache          
        if(!dq.contains(key)){
            //if not found, need to insert
            //check the size
            if(dq.size() == capacity){
                //remove the least used, which will be at rear of queue
                dq.removeFirst();
            }
        }else{
            //if found, remove it, we will add everythng at end to make it recent
              dq.remove(key);
        }
        
       dq.add(key);
       lruCache.put(key,value);
        
    }
}