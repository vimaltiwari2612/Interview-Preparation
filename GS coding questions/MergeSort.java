class GfG
{
   // Merges two subarrays of arr[].  First subarray is arr[l..m]
   // Second subarray is arr[m+1..r]
    void merge(int a[], int l, int m, int r)
    {
         
         // Your code here
         int left = m - l + 1;
         int right = r - m;
         
         int[] LeftArray = new int[left];
         int[] RightArray = new int[right];
         
         //populate left array
        for(int i = 0 ; i<left ; i++)
            LeftArray[i] = a[i+l];
        //populate right array
        for(int i = 0; i < right ; i++)
            RightArray[i] = a[i+m+1];
            
        //merge in original array 
        int k = l,i=0,j=0;
        while(i<left && j<right){
            if(LeftArray[i] <= RightArray[j]){
                a[k] = LeftArray[i];
                i++;
            }
            else{
                a[k] = RightArray[j];
                j++;
            }
            k++;
        }
        
        while(i<left){
            a[k] = LeftArray[i];
                i++;
                k++;
        }
         
        while(j<right){
            a[k] = RightArray[j];
                j++;
                k++;
        }
    }

	static void mergeSort(int arr[], int l, int r)
	{
		GfG g = new GfG();
		if (l < r)   
	   {
			int m = (l+r)/2;
			mergeSort(arr, l, m);
			mergeSort(arr , m+1, r);
			g.merge(arr, l, m, r);
		}
	}
