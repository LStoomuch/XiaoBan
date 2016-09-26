package edu.jxufe.boy.entity;// default package

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * Role entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="tb_role"
    ,catalog="blog"
)

public class Role  implements java.io.Serializable {


    // Fields    

     private Long pkRole;
     private Role role;
     private String name;
     private Boolean enable;
     private Set<Role> roles = new HashSet<Role>(0);
     private Set<RoleMenu> roleMenus = new HashSet<RoleMenu>(0);
     private Set<UserRole> userRoles = new HashSet<UserRole>(0);


    // Constructors

    /** default constructor */
    public Role() {
    }

	/** minimal constructor */
    public Role(String name, Boolean enable) {
        this.name = name;
        this.enable = enable;
    }
    
    /** full constructor */
    public Role(Role role, String name, Boolean enable, Set<Role> roles, Set<RoleMenu> roleMenus, Set<UserRole> userRoles) {
        this.role = role;
        this.name = name;
        this.enable = enable;
        this.roles = roles;
        this.roleMenus = roleMenus;
        this.userRoles = userRoles;
    }

   
    // Property accessors
    @Id @GeneratedValue
    
    @Column(name="pkRole", unique=true, nullable=false)

    public Long getPkRole() {
        return this.pkRole;
    }
    
    public void setPkRole(Long pkRole) {
        this.pkRole = pkRole;
    }
	@ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="parent")

    public Role getRole() {
        return this.role;
    }
    
    public void setRole(Role role) {
        this.role = role;
    }
    
    @Column(name="name", nullable=false, length=30)

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    @Column(name="enable", nullable=false)

    public Boolean getEnable() {
        return this.enable;
    }
    
    public void setEnable(Boolean enable) {
        this.enable = enable;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="role")

    public Set<Role> getRoles() {
        return this.roles;
    }
    
    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="role")

    public Set<RoleMenu> getRoleMenus() {
        return this.roleMenus;
    }
    
    public void setRoleMenus(Set<RoleMenu> roleMenus) {
        this.roleMenus = roleMenus;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="role")

    public Set<UserRole> getUserRoles() {
        return this.userRoles;
    }
    
    public void setUserRoles(Set<UserRole> userRoles) {
        this.userRoles = userRoles;
    }
   








}