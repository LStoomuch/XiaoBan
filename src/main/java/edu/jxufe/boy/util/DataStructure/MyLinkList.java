package edu.jxufe.boy.util.DataStructure;

/**
 * Created by liaos on 2017/4/20.
 */
public class MyLinkList<T extends Comparable<T>> {
    Node<T> first;
    Node<T> last;
    int size = 0;

    public MyLinkList(){
    }

    private static class Node<T>{
        T item;
        Node<T> prev;
        Node<T> next;

        Node(Node<T> prev,T item,Node<T> next){
            this.prev = prev;
            this.item = item;
            this.next = next;
        }
    }

    public Boolean add(T t){
        linkLast(t);
        return true;
    }
    public void linkLast(T t){
        Node<T> l = last;
        Node<T> newNode = new Node<T>(l,t,null);
        last = newNode;
        if (l == null)
            first = newNode;
        else
            l.next = newNode;
        size++;
    }
}
