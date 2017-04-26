package edu.jxufe.boy.util.DataStructure;

import java.util.List;

/**
 * Created by liaos on 2017/4/19.
 */
public class BinarySearchTree<Key extends Comparable<Key>,Value> {
    Node root;

    public Node getRoot() {
        return root;
    }

    private class Node{
        Key key;
        Value value;
        Node left,right;
        int N;

        public Node(Key key,Value value,int N){
            this.key = key;
            this.value = value;
            this.N = N;
        }
    }

    public int size(){
        return this.size(root);
    }
    public int size(Node x){
        if(x==null) return 0;
        else return x.N;
    }

    public Value get(Key key){
        return get(root,key);
    }
    public Value get(Node x,Key key){
        if (x ==null) return null;
        int cmp = key.compareTo(x.key);
        if(cmp<0) return get(x.left,key);
        else if(cmp>0) return get(x.right,key);
        else return x.value;
    }

    public void put(Key key,Value value){
        root = put(root,key,value);
    }
    public Node put(Node x,Key key,Value value){
        if(x == null) return new Node(key,value,1);
        int cmp = key.compareTo(x.key);
        if(cmp<0) x.left = put(x.left,key,value);
        else if(cmp>0) x.right = put(x.right,key,value);
        else x.value = value;
        x.N = size(x.left)+size(x.right)+1;
        return x;
    }
    public void bst_To_DoubleList(MyLinkList list){
        this.bst_To_DoubleList(root,list);
    }
    public void bst_To_DoubleList(Node x, MyLinkList list){
        if (x==null) return;
        bst_To_DoubleList(x.left,list);
        list.add(x.key);
        bst_To_DoubleList(x.right,list);
    }
}
