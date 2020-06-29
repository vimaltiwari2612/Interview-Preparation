/*

Given a binary tree, a target node in the binary tree, and an 
integer value k, find all the nodes that are at distance k from 
the given target node. No parent pointers are available.

Input:
2
20 8 22 4 12 N N N N 10 14
8
2
20 7 24 4 3 N N N N 1
7
2

Output:
10 14 22 
1 24

*/
class Solution
{
    static Map<Node,Node> allNodes = null;
    static Node targetNode = null;
    static ArrayList<Integer> nodes = null;
    static ArrayList<Integer> visited = null;
    public static ArrayList<Integer> KDistanceNodes(Node root, int target , int k)
    {
        allNodes = new HashMap<Node,Node>();
        nodes = new ArrayList<Integer>();
        visited = new ArrayList<Integer>();
        targetNode = null;
        //find TargetNode first
        findTarget(root,target);
        //map parent nodes
        createRootVsParentMap(root,null);
        
        while(k >=0){ 
            //for each node
            findKDistanceChildren(targetNode,k);
            //mark it visited
            visited.add(targetNode.data);
            //get parent
            targetNode = allNodes.get(targetNode);
            //if it is root
            if(targetNode == null) break;
            k--;
        }
        
        Collections.sort(nodes);
        return nodes;
    }
    
    //find in it's own tree, being as root
    static void findKDistanceChildren(Node root, int k){
       
        if(root == null) return;
        
        if(k == 0){
            if(!visited.contains(root.data)){
                nodes.add(root.data);
            }
            return;
        }
        visited.add(root.data);
        findKDistanceChildren(root.left,k-1);
        findKDistanceChildren(root.right,k-1);
        
    }
    
    static void findTarget(Node root,int target){
        
        if(root == null || targetNode != null) return ;
       
        if(root.data == target){
            targetNode = root;
            return;
        }
        
        findTarget(root.left,target);
        findTarget(root.right,target);  
    }
    
    // Template for preorder traversal of the tree
    static void createRootVsParentMap(Node root, Node parent) {
        if (root == null) {
            return;
        }
        allNodes.put(root, parent);
        createRootVsParentMap(root.left, root);
        createRootVsParentMap(root.right, root);
    }
    
}