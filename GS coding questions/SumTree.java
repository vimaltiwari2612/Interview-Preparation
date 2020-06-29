/*
A SumTree is a Binary Tree in which value of each node x is equal to sum of nodes present in its left subtree and right subtree . An empty tree is 
SumTree and sum of an empty tree can be considered as 0. A leaf node is also considered as SumTree
*/

class Tree
{
	boolean isSumTree(Node node)
	{
             // Your code here
             if(node == null) return false;
               
             int left = sum(node.left);
             int right = sum(node.right);
             
             if(left + right == node.data) return true;
             
             return (isSumTree(node.left) && isSumTree(node.right));
             
	}
	
	int sum(Node n){
	    if(n == null) return 0;
	    return (n.data + sum(n.left) + sum(n.right));
	}
}