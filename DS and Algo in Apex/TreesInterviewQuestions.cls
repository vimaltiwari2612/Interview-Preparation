public class TreesInterviewQuestions {

    static List<Tree> nodes = new List<Tree>();
    //wrapper for Tree
    public class Tree implements Comparable
    {
        integer data;
        Tree left;
        Tree right;
        
        Tree(integer data){
            this.data = data;
            left = null;
            right = null;
        }
        
        public integer compareTo(object a){
            return this.data - ((Tree)a).data;
        }
        
        public boolean equals(Object a){
            return (this.data == ((Tree)a).data);
        }
    }
    
     /*******************************************  Binary Tree functions*****************************************/
    //insertion in tree
    public static void insertionInBinaryTree(Tree root, integer data){
        
        if(root == null){
            root = new Tree(data);
            return;
        }
        //if root not null
        List<Tree> queue = new List<Tree>();
        queue.add(root);
        while(!queue.isEmpty()){
            Tree node = queue.get(0);
            queue.remove(0);
            if(node.left == null){
                Tree left = new Tree(data);
                node.left  = left;
                return;
            }else{
                queue.add(node.left);
            }
            
            if(node.right == null){
                Tree right = new Tree(data);
                node.right  = right;
                return;
            }
            else{
                queue.add(node.right);
            }
        }
    }
    
    //deletion in binary Tree
    /*
        the deleted node is replaced by bottom most and rightmost node)
        
        Delete 10 in below tree
               10
             /    \         
            20     30
        Output :    
               30
             /             
            20     
        
        
        Delete 20 in below tree
               10
             /    \         
            20     30
                    \
                    40
        Output :    
               10
             /   \             
            40    30   
            
    */
    public static void deletionInBinaryTree(Tree root, integer data){
        if(root == null) return;
        else if (root.data == data) {
            root = null;
            return;
        }
        //if root is not null
        //check wether the data is present of not, throught any traversal, if needed
        //find the rightmost, only traversal that gives right most at the end is level order, so go for it's algo.
        //level order
        List<Tree> queue = new List<Tree>();
        queue.add(root);
        Tree tempNode = null;
        Tree lastProcessedNode = null;
        while(!queue.isEmpty()){
            lastProcessedNode = queue.get(0);
            queue.remove(0);
            if(lastProcessedNode.data == data){
                //if the node has matched data
                //put in temp
                tempNode = lastProcessedNode;
            }
            if(lastProcessedNode.left != null){
                queue.add(lastProcessedNode.left);
            }
            if(lastProcessedNode.right != null){
                queue.add(lastProcessedNode.right);
            }
        }
        if(tempNode != null && lastProcessedNode != null){
            //if found the required node
            //find parent of last node, which is the rightmost bottom node, because of level order traversal
            Tree parent = getParent(root,lastProcessedNode);
            tempNode.data = lastProcessedNode.data;
            if(parent.right != null  && parent.right.data == lastProcessedNode.data ){
                parent.right = null;
            }
            else if(parent.left != null  && parent.left.data == lastProcessedNode.data){
                parent.left = null;
            }
        }
    }
    
      /*
        Input:
          1
        /  \
       2    3
    Output: 2 1 3
    Explanation: The tree is
       1    (mirror)  1
     /  \    =>      /  \
    3    2          2    3
    The inorder of mirror is 2 1 3
    */
    public static void mirrorBTree(Tree root){
        //use level order traversal
        if(root == null) return;
        //if root not null
        //get the count
        Integer childCount = getNodesCount(root);
        List<Tree> queue = new List<Tree>();
        queue.add(root);
        integer i = 0;
        while(i < childCount){
            Tree node = queue.get(i);
            //push right first
            if(node.right != null){
                queue.add(node.right);
            }
            //then left
            if(node.left != null){
                queue.add(node.left);
            }
            i++;
           
        }
        //re-form the tree
        queue.remove(0);//remove the root
        root.left = null; //clear
        root.right = null; //clear
        while(!queue.isEmpty()){
             Tree node = queue.get(0);
             insertionInBinaryTree(root, node.data);
             queue.remove(0);
        }
        
    }
    
    /*******************************************  Binary Search Tree functions*****************************************/
    
    /*
        A new key is always inserted at the leaf. We start searching a key from the root until we hit a leaf node. 
        Once a leaf node is found, the new node is added as a child of the leaf node. 
     
    
             100                               100
            /   \        Insert 40            /    \
          20     500    --------->          20     500 
         /  \                              /  \  
        10   30                           10   30
                                                  \   
                                                  40
     */ 
    //insertion in BST
    public static Tree insertionInBST(Tree root, integer data){
        
        if(root == null){
            root = new Tree(data); 
            return root;
        }
        
        if(root.data > data){
             root.left = insertionInBST(root.left, data);
        }
        else if (root.data < data){
            root.right = insertionInBST(root.right, data);
        }
            
        
        return root;
    }  
    
    //deletion in BST
    /*
        https://www.geeksforgeeks.org/binary-search-tree-set-2-delete/
        
        When we delete a node, three possibilities arise. 
        1) Node to be deleted is the leaf: Simply remove from the tree. 
        
                      50                            50
                   /     \         delete(20)      /   \
                  30      70       --------->    30     70 
                 /  \    /  \                     \    /  \ 
               20   40  60   80                   40  60   80
        2) Node to be deleted has only one child: Copy the child to the node and delete the child 
        
                      50                            50
                   /     \         delete(30)      /   \
                  30      70       --------->    40     70 
                    \    /  \                          /  \ 
                    40  60   80                       60   80
        3) Node to be deleted has two children: Find inorder successor of the node. Copy contents of the inorder successor to the node and delete the inorder successor.
        Note that inorder predecessor can also be used. 
         
        
                      50                            60
                   /     \         delete(50)      /   \
                  40      70       --------->    40    70 
                         /  \                            \ 
                        60   80                           80
        The important thing to note is, inorder successor is needed only when the right child is not empty. In this particular case, inorder successor can be obtained by finding the minimum value in the right child of the node.
    */
    
    // in this function, we are taking 2 node, 
   // 1. is root, - which will be passed in every recurring call 
    //2. is again root which will be moved
    //3. is data
    public static void deletionInBST(Tree head, Tree root, integer data){
        if(root == null){ 
            return;
        }
        
        //1) Node to be deleted is the leaf: Simply remove from the tree
        if(root.data == data && root.left == null && root.right == null){
            Tree parent = getParent(head,root);
            if(parent == null){
                root = null;
                return;
            }
            if(parent.left != null && parent.left.data == data){
                parent.left = null;
                return;
            }
            if(parent.right != null && parent.right.data == data){
                parent.right = null;
                return;
            }
        }
        //2) Node to be deleted has only one child: Copy the child to the node and delete the child
        else if(root.data == data && (root.left == null || root.right == null)){
            
            if(root.left != null ){
                integer temp = root.data;
                root.data = root.left.data;
                root.left.data = temp;
                deletionInBST(head,root.left, data);
                return;
            }
            if(root.right != null){
                integer temp = root.data;
                root.data = root.right.data;
                root.right.data = temp;
                deletionInBST(head,root.right, data);
                return;
            }
        }
        //3) Node to be deleted has two children: Find inorder successor of the node. Copy contents of the inorder successor to the node and delete the inorder successor.
        else if(root.data == data && root.left != null && root.right != null){
            Tree inorderSuccessor = getInorderSuccessor(head, root);
            integer temp = root.data;
            root.data = inorderSuccessor.data;
            inorderSuccessor.data = temp;
            deletionInBST(head,inorderSuccessor, data);
            return;
        }
        //if root data is not matched
        if(root.data < data && root.right != null){
            deletionInBST(head,root.right, data);
        }else if(root.data > data && root.left != null){
            deletionInBST(head,root.left, data);
        }
    }
    
    /******************************************* GENERIC FUNCTIONS for all Types of Binary/Binary search Tree*****************************************/
    
    //method to find parent of any node
    public static Tree getParent(Tree root, Tree child){
        //level order traversal
        List<Tree> queue = new List<Tree>();
        queue.add(root);
        while(!queue.isEmpty()){
            Tree node = queue.get(0);
            queue.remove(0);
            if(node.data == child.data){
                //if the node has matched data
                //put in temp
                return null; // no parent, it's the root
            }
            
            if((node.left != null && node.left.data == child.data) || (node.right != null && node.right.data == child.data )){
                return node;// parent
            }
            
            if(node.left != null){
                queue.add(node.left);
            }
            
            if(node.right != null){
                queue.add(node.right);
            }
        }
        return null;
    }
    
    /*
    In Binary Tree, Inorder successor of a node is the next node in Inorder traversal of the Binary Tree. 
    Inorder Successor is NULL for the last node in Inorder traversal. 
    
    In Binary Search Tree, Inorder Successor of an input node can also be defined as the node with the smallest key greater than the key of the input node. 
    So, it is sometimes important to find next node in sorted order.
    */
    public static Tree getInorderSuccessor(Tree root, integer data){
        nodes = new List<Tree>();
        inorder(root);
        
        for(integer i = 0 ; i< nodes.size() ; i++){
            if(nodes[i].data == data){
                if((i + 1) == nodes.size()) return null;
                return nodes[i+1];
            }
        }
        return null;
    }
    
    public static Tree getInorderSuccessor(Tree root, Tree child){
        return getInorderSuccessor(root, child.data);
    }
    
    //method to find parent of any node's data
    //considering no duplicate data
    public static Tree getParent(Tree root, integer data){
        //level order traversal
        List<Tree> queue = new List<Tree>();
        Tree child = new Tree(data);
        queue.add(root);
        while(!queue.isEmpty()){
            Tree node = queue.get(0);
            queue.remove(0);
            if(node.data == child.data){
                //if the node has matched data
                //put in temp
                return null; // no parent, it's the root
            }
            
            if((node.left != null && node.left.data == child.data) || (node.right != null && node.right.data == child.data )){
                return node;// parent
            }
            
            if(node.left != null){
                queue.add(node.left);
            }
            
            if(node.right != null){
                queue.add(node.right);
            }
        }
        return null;
    }
    
    //level order
    public static void levelOrder(Tree root){
        if(root == null) return;
        //if root not null
        List<Tree> queue = new List<Tree>();
        queue.add(root);
        System.debug(root.data);
        nodes.add(root);
        while(!queue.isEmpty()){
            Tree node = queue.get(0);
            queue.remove(0);
            if(node.left != null){
                System.debug(node.left.data);
                nodes.add(node.left);
                queue.add(node.left);
            }
            if(node.right != null){
                System.debug(node.right.data);
                nodes.add(node.right);
                queue.add(node.right);
            }
        }
    }
    
    //preorder
    public static void preorder(Tree root){
        
        if(root == null) return;
        
        System.debug(root.data);
        nodes.add(root);//for testing
        preorder(root.left);
        preorder(root.right);
        
    }
    
    //preorder
    public static void inorder(Tree root){
        
        if(root == null) return;
        
        inorder(root.left);
        System.debug(root.data);
        nodes.add(root);//for testing
        inorder(root.right);
        
    }
    
    //preorder
    public static void postorder(Tree root){
        
        if(root == null) return;
        
        postorder(root.left);
        postorder(root.right);
        System.debug(root.data);
        nodes.add(root);//for testing
        
    }
    
    //height of a binary tree
    public static integer height(Tree root){
        if(root == null|| (root.left == null && root.right == null)) return 0;
        
        integer left = 1 + height(root.left);
        integer right = 1 + height(root.right);
        
        return (left > right)? left : right;
    }
    
    //iterative preorder
    public static void preorderIterative(Tree root){
        
        // Create an empty stack and push root to it
        List<Tree> stack = new List<Tree>();
        stack.add(root);
        /* Pop all items one by one. Do following for every popped item
         a) print it
         b) push its right child
         c) push its left child
         Note that right child is pushed first so that left is processed first */
        while(!stack.isEmpty()){
            Tree node = stack.get(stack.size() - 1);//get the top
            stack.remove(stack.size()-1);
            System.debug(node.data);
            nodes.add(node);
            // Push right and left children of the popped node to stack
            if(node.right != null){
                stack.add(node.right);
            }
            if(node.left != null){
                stack.add(node.left);
            }
            
            
        }
    }
    
    
    //number of nodes in Tree
    public static integer getNodesCount(Tree root){
        
        if(root == null) return 0;
        return 1 + getNodesCount(root.left) + getNodesCount(root.right);
    }
    
    //genrric Mirror method
     /*
        Input:
          1
        /  \
       2    3
    Output: 2 1 3
    Explanation: The tree is
       1    (mirror)  1
     /  \    =>      /  \
    3    2          2    3
    The inorder of mirror is 2 1 3
    */
    static Tree mirror(Tree root)
    {
        if (root == null) return root;

        /* do the subtrees */
        Tree left = mirror(root.left);
        Tree right = mirror(root.right);

        /* swap the left and right pointers */
        root.left = right;
        root.right = left;
        nodes.add(root);
        return root;
    }
    
    /*
    Given the root of a binary tree, return all root-to-leaf paths in any order.

        A leaf is a node with no children.
        
         
        
        Example 1:
        
        
        Input: root = [1,2,3,null,5]
        Output: ["1->2->5","1->3"]
        Example 2:
        
        Input: root = [1]
        Output: ["1"]
            
    */
    public static List<String> binaryTreePaths(Tree root) {
        List<String> finalList = new List<String>();
        traverse(root,'',finalList);
        return finalList;
    }
    
    public static void traverse(Tree root, String path, List<String> finalList){
        
        if(root == null) return;
        
        path += '->'+String.valueOf(root.data);
        
        if(root.left == null && root.right == null){
            finalList.add(path.substring(2));
            return;
        }
        traverse(root.left,path,finalList);
        traverse(root.right,path,finalList);
    }
    
    /*
    Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.

    A leaf is a node with no children.
    Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
    Output: true
    
    */
    
    public static boolean hasPathSum(Tree root, integer targetSum) {
        
        return hasPathSum(root,0,targetSum);
    }
    
    public static boolean hasPathSum(Tree root, integer currentSum ,integer targetSum){
        
        if(root == null) return false;
        currentSum += root.data;
        
        if(root.left == null && root.right == null && (targetSum - currentSum == 0)) return true;
        
        
        return (hasPathSum(root.left, currentSum, targetSum) || hasPathSum(root.right, currentSum, targetSum));
    }
    
    
    
   
    //test cases
    public static void testMethods(){
        
        //testing insertion
        Tree root = new Tree(1);
        system.assertEquals(height(root),0);
        insertionInBinaryTree(root,2);
        system.assert(hasPathSum(root,3) == true);
        system.assert(binaryTreePaths(root).get(0) == '1->2');
        system.assertEquals(height(root),1);
        insertionInBinaryTree(root,3);
        system.assert(hasPathSum(root,4) == true);
        system.assertEquals(height(root),1);
        insertionInBinaryTree(root,4);
        system.assert(hasPathSum(root,7) == true);
        system.assert(hasPathSum(root,8) == false);
        system.assertEquals(height(root),2);
        
        nodes = new List<Tree>();
        preorderIterative(root);
        System.assertEquals(nodes.size(), 4);
        System.assertEquals(nodes.get(0).data,1);
        System.assertEquals(nodes.get(1).data,2);
        System.assertEquals(nodes.get(2).data,4);
        System.assertEquals(nodes.get(3).data,3);
        
        nodes = new List<Tree>();
        inorder(root);
        System.assertEquals(nodes.get(0).data,4);
        System.assertEquals(nodes.get(1).data,2);
        System.assertEquals(nodes.get(2).data,1);
        System.assertEquals(nodes.get(3).data,3);
        
        nodes = new List<Tree>();
        postorder(root);
        System.assertEquals(nodes.get(0).data,4);
        System.assertEquals(nodes.get(1).data,2);
        System.assertEquals(nodes.get(2).data,3);
        System.assertEquals(nodes.get(3).data,1);
    
        nodes = new List<Tree>();
        levelOrder(root);
        System.assertEquals(nodes.get(0).data,1);
        System.assertEquals(nodes.get(1).data,2);
        System.assertEquals(nodes.get(2).data,3);
        System.assertEquals(nodes.get(3).data,4);
        
        deletionInBinaryTree(root,3);
        system.assertEquals(height(root),1);
        deletionInBinaryTree(root,2);
        system.assertEquals(height(root),1);
        insertionInBinaryTree(root,5);
        insertionInBinaryTree(root,6);
        system.assertEquals(height(root),2);
       
        nodes = new List<Tree>();
        preorder(root);
        
        System.assertEquals(nodes.size(), 4);
        System.assertEquals(nodes.get(0).data,1);
        System.assertEquals(nodes.get(1).data,4);
        System.assertEquals(nodes.get(2).data,6);
        System.assertEquals(nodes.get(3).data,5);
        
        nodes = new List<Tree>();
        inorder(root);
        System.assertEquals(nodes.get(0).data,6);
        System.assertEquals(nodes.get(1).data,4);
        System.assertEquals(nodes.get(2).data,1);
        System.assertEquals(nodes.get(3).data,5);
        
        nodes = new List<Tree>();
        postorder(root);
        System.assertEquals(nodes.get(0).data,6);
        System.assertEquals(nodes.get(1).data,4);
        System.assertEquals(nodes.get(2).data,5);
        System.assertEquals(nodes.get(3).data,1);
    
        nodes = new List<Tree>();
        levelOrder(root);
        System.assertEquals(nodes.get(0).data,1);
        System.assertEquals(nodes.get(1).data,4);
        System.assertEquals(nodes.get(2).data,5);
        System.assertEquals(nodes.get(3).data,6);
        
        mirrorBTree(root);
        nodes = new List<Tree>();
        levelOrder(root);
        system.assertEquals(nodes.size(),4);
        System.assertEquals(nodes.get(0).data,1);
        System.assertEquals(nodes.get(1).data,5);
        System.assertEquals(nodes.get(2).data,4);
        System.assertEquals(nodes.get(3).data,6);
        
        mirror(root);
        nodes = new List<Tree>();
        levelOrder(root);
        System.assertEquals(nodes.get(0).data,1);
        System.assertEquals(nodes.get(1).data,4);
        System.assertEquals(nodes.get(2).data,5);
        System.assertEquals(nodes.get(3).data,6);
        
        root = insertionInBST(null, 5);
        insertionInBST(root, 4);
        system.assertEquals(height(root),1);
        insertionInBST(root, 7);
        system.assertEquals(height(root),1);
        insertionInBST(root, 6);
        system.assertEquals(height(root),2);
        insertionInBST(root, 3);
        nodes = new List<Tree>();
        preorder(root);
        System.assertEquals(nodes.get(0).data,5);
        System.assertEquals(nodes.get(1).data,4);
        System.assertEquals(nodes.get(2).data,3);
        System.assertEquals(nodes.get(3).data,7);
        System.assertEquals(nodes.get(4).data,6);
        
        deletionInBST(root,root,3);//leaf
        nodes = new List<Tree>();
        inorder(root);
        System.assertEquals(nodes.size(),4);
        System.assertEquals(nodes.get(0).data,4);
        System.assertEquals(nodes.get(1).data,5);
        System.assertEquals(nodes.get(2).data,6);
        System.assertEquals(nodes.get(3).data,7);
        
        deletionInBST(root,root,7); //with one child
        nodes = new List<Tree>();
        inorder(root);
        System.assertEquals(nodes.size(),3);
        System.assertEquals(nodes.get(0).data,4);
        System.assertEquals(nodes.get(1).data,5);
        System.assertEquals(nodes.get(2).data,6);
        
        insertionInBST(root, 7);
        insertionInBST(root, 3);
        deletionInBST(root,root,5); //with both child
        nodes = new List<Tree>();
        inorder(root);
        System.assertEquals(nodes.size(),4);
        System.assertEquals(nodes.get(0).data,3);
        System.assertEquals(nodes.get(1).data,4);
        System.assertEquals(nodes.get(2).data,6);
        System.assertEquals(nodes.get(3).data,7);
        
    }

}