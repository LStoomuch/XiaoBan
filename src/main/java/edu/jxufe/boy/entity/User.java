package edu.jxufe.boy.entity;// default package

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;


/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="tb_user"
    ,catalog="blog"
, uniqueConstraints = @UniqueConstraint(columnNames="account")
)

public class User  implements java.io.Serializable {


    // Fields    

     private Long pkUser;
     private String account;
     private String nickname;
     private Boolean sex;
     private String email;
     private String head;
     private String signa;
     private String phone;
     private String city;
     private Set<UserPrivate> userPrivates = new HashSet<UserPrivate>(0);
     private Set<UserRole> userRoles = new HashSet<UserRole>(0);


    // Constructors

    /** default constructor */
    public User() {
    }

	/** minimal constructor */
    public User(String account, String nickname, Boolean sex) {
        this.account = account;
        this.nickname = nickname;
        this.sex = sex;
    }
    
    /** full constructor */
    public User(String account, String nickname, Boolean sex, String email, String head, String signa, String phone, String city, Set<UserPrivate> userPrivates, Set<UserRole> userRoles) {
        this.account = account;
        this.nickname = nickname;
        this.sex = sex;
        this.email = email;
        this.head = head;
        this.signa = signa;
        this.phone = phone;
        this.city = city;
        this.userPrivates = userPrivates;
        this.userRoles = userRoles;
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
    
    @Column(name="account", unique=true, nullable=false, length=50)

    public String getAccount() {
        return this.account;
    }
    
    public void setAccount(String account) {
        this.account = account;
    }
    
    @Column(name="nickname", nullable=false, length=50)

    public String getNickname() {
        return this.nickname;
    }
    
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    
    @Column(name="sex", nullable=false)

    public Boolean getSex() {
        return this.sex;
    }
    
    public void setSex(Boolean sex) {
        this.sex = sex;
    }
    
    @Column(name="email", length=60)

    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    @Column(name="head", length=60)

    public String getHead() {
        return this.head;
    }
    
    public void setHead(String head) {
        this.head = head;
    }
    
    @Column(name="signa")

    public String getSigna() {
        return this.signa;
    }
    
    public void setSigna(String signa) {
        this.signa = signa;
    }
    
    @Column(name="phone", length=11)

    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    @Column(name="city", length=50)

    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="user")

    public Set<UserPrivate> getUserPrivates() {
        return this.userPrivates;
    }
    
    public void setUserPrivates(Set<UserPrivate> userPrivates) {
        this.userPrivates = userPrivates;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="user")

    public Set<UserRole> getUserRoles() {
        return this.userRoles;
    }
    
    public void setUserRoles(Set<UserRole> userRoles) {
        this.userRoles = userRoles;
    }
   








}