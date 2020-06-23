/*
Egg dropping problem
with memorised

*/
class Solution {
    //memorised
    static int[][] m = new int[101][10001];
    public int superEggDrop(int K, int N) {
       
        // If there are no floors, then 
        // no trials needed. OR if there 
        // is one floor, one trial needed. 
        if (N == 1 || N == 0) 
            return N; 
  
        // We need k trials for one egg 
        // and N floors 
        if (K == 1) 
            return N;
        
        if(m[K][N] > 0) return m[K][N];
        //find Max 
        int min = Integer.MAX_VALUE;
        for(int i = 1;i<=N;i++){
        //if broken, floors below it should be tested
          int broken;
            if(m[K-1][i-1] > 0){
                broken = m[K-1][i-1];
            }else{
                broken = superEggDrop(K-1,i-1);
                m[K-1][i-1] = broken;
            }
          //if not broken, floors above it should be tested
           int notBroken;
            if(m[K][N-i] > 0){
                notBroken = m[K][N-i];
            }else{
                notBroken = superEggDrop(K,N-i);
                m[K][N-i] = notBroken;
            }
           //find the max effort, because we are talking about worst cases
            int res = Math.max(broken,notBroken);
            //save it
            m[K][N] = res;
            if(res < min){
                min = res;
            }
        }
        return min + 1;
    }
}