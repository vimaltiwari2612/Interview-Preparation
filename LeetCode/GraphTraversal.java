class Traversal {
    static ArrayList<Integer> bfs(ArrayList<ArrayList<Integer>> g, int N) {
        // add your code here
        ArrayList<Integer> visited = new ArrayList<Integer>();
        Deque<Integer> queue = new LinkedList<Integer>();
        ArrayList<Integer> fvisited = new ArrayList<Integer>();
        
        int source = 0;//the first node
        queue.add(source);//add to queue
        visited.add(source);
        
        while(!queue.isEmpty()){
            int s = queue.removeFirst();
            fvisited.add(s);
            //get all linked nodes
            ArrayList<Integer> nodes = g.get(s);
            for(int node : nodes){
                //if not visited
                if(!visited.contains(node)){
                    visited.add(node);
                    queue.add(node);
                }
            }
            count++;
        }
        return fvisited;
    }
	
	//use Stack instead of queue
	static ArrayList<Integer> dfs(ArrayList<ArrayList<Integer>> g, int N)
    {
        // add your code here
        ArrayList<Integer> visited = new ArrayList<Integer>();
        Stack<Integer> stack = new Stack<Integer>();
        ArrayList<Integer> fvisited = new ArrayList<Integer>();
        
        int source = 0;//the first node
        stack.push(source);
        visited.add(source);
        
        while(!stack.isEmpty()){
            System.out.println(stack);
            int s = stack.peek();
            stack.pop();
            fvisited.add(s);
            //get all linked nodes
            ArrayList<Integer> nodes = g.get(s);
            for(int node : nodes){
                //if not visited
                if(!visited.contains(node)){
                    visited.add(node);
                    stack.push(node);
                }
            }
        }
        return fvisited;
    }
}