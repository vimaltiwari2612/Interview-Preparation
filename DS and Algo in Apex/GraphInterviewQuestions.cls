public class GraphInterviewQuestions {

    //for testing
    static List<Integer> nodes = new List<Integer>();
    
    //for test data
    static List<List<Integer>> adjecencyList = new List<List<Integer>>();
    
    public static void createGraph(integer size){
        adjecencyList = new List<List<Integer>>();
        integer V = size;
        for (integer i = 0; i < V; i++)
            adjecencyList.add(new List<Integer>());
            
    }
    
    public static void addEdge(List<List<Integer>> adjecencyList, integer V , integer E){
        adjecencyList.get(V).add(E);
    }
    
    static void printGraph(List<List<Integer>> adj)
    {
        for(Integer i = 0; i < adj.size(); i++) {
            for(Integer j = 0; j < adj.get(i).size(); j++) {
                System.debug(i+' -> '+adj.get(i).get(j));
            }
        }
    }
    
    public static void testmethods(){
         
        //Test Data creation 
        createGraph(5);
 
        // Adding edges one by one
        addEdge(adjecencyList,0, 1);
        addEdge(adjecencyList,0, 4);
        addEdge(adjecencyList,1, 2);
        addEdge(adjecencyList,1, 3);
        addEdge(adjecencyList,1, 4);
        addEdge(adjecencyList,2, 3);
        addEdge(adjecencyList,3, 4);
       
        system.assert(adjecencyList.size() == 5);
        
        ///////// Main testing
        nodes = new List<Integer>();
        BFS(adjecencyList,0);
        System.assertEquals(nodes.get(0), 0);
        System.assertEquals(nodes.get(1), 1);
        System.assertEquals(nodes.get(2), 4);
        System.assertEquals(nodes.get(3), 2);
        System.assertEquals(nodes.get(4), 3);
        
        nodes = new List<Integer>();
        DFS(adjecencyList,0);
        System.assertEquals(nodes.get(0), 0);
        System.assertEquals(nodes.get(1), 4);
        System.assertEquals(nodes.get(2), 1);
        System.assertEquals(nodes.get(3), 3);
        System.assertEquals(nodes.get(4), 2);
        
        createGraph(4);
        
        addEdge(adjecencyList,0, 1);
        addEdge(adjecencyList,0, 2);
        addEdge(adjecencyList,1, 2);
        addEdge(adjecencyList,2, 0);
        addEdge(adjecencyList,2, 3);
        addEdge(adjecencyList,3, 3);
        
        nodes = new List<Integer>();
        BFS(adjecencyList,2);
        System.assertEquals(nodes.get(0), 2);
        System.assertEquals(nodes.get(1), 0);
        System.assertEquals(nodes.get(2), 3);
        System.assertEquals(nodes.get(3), 1);
        
        nodes = new List<Integer>();
        DFS(adjecencyList,2);
        System.assertEquals(nodes.get(0), 2);
        System.assertEquals(nodes.get(1), 3);
        System.assertEquals(nodes.get(2), 0);
        System.assertEquals(nodes.get(3), 1);
        
     }
     
     
     /*************************************************** GRAPH Functions ****************************************/
     
     //Breadth First Search or BFS for a Graph
     public static void BFS(List<List<Integer>> adjecencyList, integer source){
         if(adjecencyList == null || adjecencyList.isEmpty()){
             return;
         }
         //go for level order traversal
         List<Integer> queue = new List<Integer>();
         List<Integer> visited = new List<Integer>();
         queue.add(source);//first index
         
         while(!queue.isEmpty()){
             integer vertex = queue.get(0);
             queue.remove(0);//remove it from queue
             if(!visited.contains(vertex)){
                System.debug(vertex);
                nodes.add(vertex);//for testing
                visited.add(vertex);
             }
             for(integer i  : adjecencyList.get(vertex)){
                 if(!visited.contains(i)){
                     queue.add(i);
                 }
             }
             
         } 
     }
     
     //Depth First Search or DFS for a Graph
     public static void DFS(List<List<Integer>> adjecencyList, integer source){
         if(adjecencyList == null || adjecencyList.isEmpty()){
             return;
         }
         //go for level order traversal
         List<Integer> stack = new List<Integer>();
         List<Integer> visited = new List<Integer>();
         stack.add(source);//first index
         
         while(!stack.isEmpty()){
             integer top = stack.size()-1;
             integer vertex = stack.get(top);
             stack.remove(top);//remove it from queue
             if(!visited.contains(vertex)){
                System.debug(vertex);
                nodes.add(vertex);//for testing
                visited.add(vertex);
             }
             for(integer i  : adjecencyList.get(vertex)){
                 if(!visited.contains(i)){
                     stack.add(i);
                 }
             }
             
         } 
     }
     
     
}