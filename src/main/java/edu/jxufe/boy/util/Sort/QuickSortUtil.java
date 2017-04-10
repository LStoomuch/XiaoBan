package edu.jxufe.boy.util.Sort;

/**
 * Created by liaosheng on 2017/4/10.
 */
public class QuickSortUtil<T extends Comparable<T>> {
    public void sort(T[] arry){
        sort(arry,0,arry.length-1);
    }
    public void sort(T[] arry,int low,int hight){
        if(hight<=low) return;
        int j = partitionIt(arry,low,hight);
        sort(arry,low,j-1);
        sort(arry,j+1,hight);
    }
    public int partitionIt(T[] arry,int low,int hight){
        int i = low,j=hight+1;
        T v = arry[low];
        while(true){
            while (arry[++i].compareTo(v)<0){
                if (i==hight) break;
            }
            while (arry[--j].compareTo(v)>0){
                if (j==low) break;
            }
            if (i>=j) break;
            swap(arry,i,j);
        }
        swap(arry,low,j);
        return j;
    }
    public void swap(T[] arry,int i,int j){
        T temp = arry[i];
        arry[i]=arry[j];
        arry[j]=temp;
    }
}
