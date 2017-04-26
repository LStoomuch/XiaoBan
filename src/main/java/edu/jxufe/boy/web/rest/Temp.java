package edu.jxufe.boy.web.rest;

import edu.jxufe.boy.entity.User;
import edu.jxufe.boy.util.DataStructure.BinarySearchTree;
import edu.jxufe.boy.util.DataStructure.MyLinkList;
import edu.jxufe.boy.util.Sort.QuickSortUtil;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by lvxi on 2016/8/7.
 */
public class Temp {
    private static int i=1;
    public static void main(String[] args){
        Integer[] a = {1,2,3,4,5,6,7,8,9};
        QuickSortUtil quickSortUtil = new QuickSortUtil();
        quickSortUtil.sort(a);
    }
    public static void move(int n,char from,char to){
        System.out.println("第"+i+++"步:将"+n+"号盘子"+from+"---->"+to);
    }
    public static void hanoi(int n,char from,char depend,char to){
        if (n==1){
            move(1,from,to);
        }else {
            hanoi(n-1,from,to,depend);
            move(n,from,to);
            hanoi(n-1,depend,from,to);
        }
    }
}
