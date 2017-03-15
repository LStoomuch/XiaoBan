package edu.jxufe.boy.entity;

import org.apache.commons.lang.builder.ToStringBuilder;

import java.io.Serializable;

/**
 * Created by liaosheng on 2017/3/15.
 */
public class BaseDomain implements Serializable{
    public String toString(){
        return ToStringBuilder.reflectionToString(this);
    }
}
