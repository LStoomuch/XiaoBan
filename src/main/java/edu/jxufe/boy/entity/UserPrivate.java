package edu.jxufe.boy.entity;// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * UserPrivate entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="tb_user_private"
    ,catalog="blog"
)

public class UserPrivate  implements java.io.Serializable {


    // Fields    

     private Long pkUser;
     private User user;
     private String passwd;
     private Boolean lock;


    // Constructors

    /** default constructor */
    public UserPrivate() {
    }

    
    /** full constructor */
    public UserPrivate(User user, String passwd, Boolean lock) {
        this.user = user;
        this.passwd = passwd;
        this.lock = lock;
    }

   
    // Property accessors
    @Id @GeneratedValue
    
    @Column(name="pkUser", unique=true, nullable=false)

    public Long getPkUser() {
        return this.pkUser;
    }
    
    public void setPkUser(Long pkUser) {
        this.pkUser = pkUser;
    }
	@ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="pkUser", unique=true, nullable=false, insertable=false, updatable=false)

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    @Column(name="passwd", nullable=false, length=32)

    public String getPasswd() {
        return this.passwd;
    }
    
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
    
    @Column(name="lock", nullable=false)

    public Boolean getLock() {
        return this.lock;
    }
    
    public void setLock(Boolean lock) {
        this.lock = lock;
    }
   








}