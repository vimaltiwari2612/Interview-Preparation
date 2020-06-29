/*
Connect n ropes with minimum cost - HuffMan Encoding - add then sort then add sort and so on
There are given n ropes of different lengths, we need to connect these ropes into one rope. The cost to connect two ropes is equal to sum of their lengths. We need to connect the ropes with minimum cost.

For example if we are given 4 ropes of lengths 4, 3, 2 and 6. We can connect the ropes in following ways.
1) First connect ropes of lengths 2 and 3. Now we have three ropes of lengths 4, 6 and 5.
2) Now connect ropes of lengths 4 and 5. Now we have two ropes of lengths 6 and 9.
3) Finally connect the two ropes and all ropes have connected.

Total cost for connecting all ropes is 5 + 9 + 15 = 29. This is the optimized cost for connecting ropes. Other ways of connecting ropes would always 
have same or more cost. For example, if we connect 4 and 6 first (we get three strings of 3, 2 and 10), then connect 10 and 3 (we get two strings of 
13 and 2). Finally we connect 13 and 2. Total cost in this way is 10 + 13 + 15 = 38.


*/

// Java program to connect n 
// ropes with minimum cost 
import java.util.*; 

class ConnectRopes { 
	static int minCost(int arr[], int n) 
	{ 
		// Create a priority queue = MIN HEAP
		PriorityQueue<Integer> pq = new PriorityQueue<Integer>(); 

		// Adding items to the pQueue 
		for (int i = 0; i < n; i++) { 
			pq.add(arr[i]); 
		} 

		// Initialize result 
		int res = 0; 

		// While size of priority queue 
		// is more than 1 
		while (pq.size() > 1) { 
			// Extract shortest two ropes from pq 
			int first = pq.poll(); 
			int second = pq.poll(); 

			// Connect the ropes: update result 
			// and insert the new rope to pq 
			res += first + second; 
			pq.add(first + second); 
		} 

		return res; 
	} 

	// Driver program to test above function 
	public static void main(String args[]) 
	{ 
		int len[] = { 4, 3, 2, 6 }; 
		int size = len.length; 
		System.out.println("Total cost for connecting"
						+ " ropes is " + minCost(len, size)); 
	} 
} 
// This code is contributed by yash_pec 
