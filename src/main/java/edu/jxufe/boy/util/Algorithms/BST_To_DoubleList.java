package edu.jxufe.boy.util.Algorithms;

import edu.jxufe.boy.util.DataStructure.BinarySearchTree;
import edu.jxufe.boy.util.DataStructure.MyLinkList;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by liaos on 2017/4/20.
 */
public class BST_To_DoubleList {

    public static void main(String[] args){
        BinarySearchTree binarySearchTree = new BinarySearchTree();
        binarySearchTree.put(1,'1');
        binarySearchTree.put(3,'3');
        binarySearchTree.put(2,'2');
        binarySearchTree.put(4,'4');
        binarySearchTree.put(6,'6');
        binarySearchTree.put(5,'5');
        MyLinkList list = new MyLinkList();
        binarySearchTree.bst_To_DoubleList(list);
    }

}
