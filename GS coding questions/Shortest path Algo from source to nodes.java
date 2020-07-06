//Shortest path algo

public class ShortestPath{

	/*
		The Floyd Warshall Algorithm is for solving the All Pairs Shortest Path problem. 
		The problem is to find shortest distances between every pair 
		of vertices in a given edge weighted directed Graph.
		 O(V3)
		 
		 /// - It can't work with negative weights
	*/
	static int[][] FloydWarshall(int[][] dist){
		/* Add all vertices one by one to the set of intermediate 
           vertices. 
          ---> Before start of an iteration, we have shortest 
               distances between all pairs of vertices such that 
               the shortest distances consider only the vertices in 
               set {0, 1, 2, .. k-1} as intermediate vertices. 
          ----> After the end of an iteration, vertex no. k is added 
                to the set of intermediate vertices and the set 
                becomes {0, 1, 2, .. k} */
        for (k = 0; k < V; k++) 
        { 
            // Pick all vertices as source one by one 
            for (i = 0; i < V; i++) 
            { 
                // Pick all vertices as destination for the 
                // above picked source 
                for (j = 0; j < V; j++) 
                { 
                    // If vertex k is on the shortest path from 
                    // i to j, then update the value of dist[i][j] 
                    if (dist[i][k] + dist[k][j] < dist[i][j]) 
                        dist[i][j] = dist[i][k] + dist[k][j]; 
                } 
            } 
        } 
		return dist;
	}
	
	
		// The main function that finds shortest 
	// distances from src to all other vertices 
	// using Bellman-Ford algorithm. The function 
	// also detects negative weight cycle 
	// The row graph[i] represents i-th edge with 
	// three values u, v and w. 
	/*
		input - graph [srcVertex,DesinationVertes,weight]
		/// - It can detect with negative weights cycles
	*/
	static int[] BellmanFord(int graph[][], int V, int E, 
					int src) 
	{ 
		// Initialize distance of all vertices as infinite. 
		int [] dis = new int[V]; 
		for (int i = 0; i < V; i++) 
			dis[i] = Integer.MAX_VALUE; 
	  
		// initialize distance of source as 0 
		dis[src] = 0; 
	  
		// Relax all edges |V| - 1 times. A simple 
		// shortest path from src to any other 
		// vertex can have at-most |V| - 1 edges 
		for (int i = 0; i < V - 1; i++)  
		{ 
	  
			for (int j = 0; j < E; j++)  
			{ 
				if (dis[graph[j][0]] + graph[j][2] < 
								dis[graph[j][1]]) 
					dis[graph[j][1]] =  
					dis[graph[j][0]] + graph[j][2]; 
			} 
		} 
	  
		// check for negative-weight cycles. 
		// The above step guarantees shortest 
		// distances if graph doesn't contain 
		// negative weight cycle. If we get a 
		// shorter path, then there is a cycle. 
		for (int i = 0; i < E; i++)  
		{ 
			int x = graph[i][0]; 
			int y = graph[i][1]; 
			int weight = graph[i][2]; 
			if (dis[x] != Integer.MAX_VALUE && 
					dis[x] + weight < dis[y]) 
				System.out.println("Graph contains negative"
						+" weight cycle"); 
		} 
	  
		System.out.println("Vertex Distance from Source"); 
		for (int i = 0; i < V; i++) 
			System.out.println(i + "\t\t" + dis[i]); 
		
		return dis;
	} 
	
			
}