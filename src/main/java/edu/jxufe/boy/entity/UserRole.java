package edu.jxufe.boy.entity;// default package

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * UserRole entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="tb_user_role"
    ,catalog="blog"
)

public class UserRole  implements java.io.Serializable {


    // Fields    

     private Long pkUserRole;
     private User user;
     private Role role;
     private Timestamp bgnDate;
     private Timestamp endDate;


    // Constructors

    /** default constructor */
    public UserRole() {
    }

	/** minimal constructor */
    public UserRole(User user, Role role) {
        this.user = user;
        this.role = role;
    }
    
    /** full constructor */
    public UserRole(User user, Role role, Timestamp bgnDate, Timestamp endDate) {
        this.user = user;
        this.role = role;
        this.bgnDate = bgnDate;
        this.endDate = endDate;
    }

   
    // Property accessors
    @Id @GeneratedValue
    
    @Column(name="pkUserRole", unique=true, nullable=false)

    public Long getPkUserRole() {
        return this.pkUserRole;
    }
    
    public void setPkUserRole(Long pkUserRole) {
        this.pkUserRole = pkUserRole;
    }
	@ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="pkUser", nullable=false)

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
	@ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="pkRole", nullable=false)

    public Role getRole() {
        return this.role;
    }
    
    public void setRole(Role role) {
        this.role = role;
    }
    
    @Column(name="bgn_date", length=19)

    public Timestamp getBgnDate() {
        return this.bgnDate;
    }
    
    public void setBgnDate(Timestamp bgnDate) {
        this.bgnDate = bgnDate;
    }
    
    @Column(name="end_date", length=19)

    public Timestamp getEndDate() {
        return this.endDate;
    }
    
    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }
   








}