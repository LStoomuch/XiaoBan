package edu.jxufe.boy.entity;// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Group entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="tb_group"
    ,catalog="blog"
)

public class Group  implements java.io.Serializable {


    // Fields    

     private Long pkGroup;
     private String name;


    // Constructors

    /** default constructor */
    public Group() {
    }

    
    /** full constructor */
    public Group(String name) {
        this.name = name;
    }

   
    // Property accessors
    @Id @GeneratedValue
    
    @Column(name="pkGroup", unique=true, nullable=false)

    public Long getPkGroup() {
        return this.pkGroup;
    }
    
    public void setPkGroup(Long pkGroup) {
        this.pkGroup = pkGroup;
    }
    
    @Column(name="name", length=30)

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
   








}