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


/**
 * Menu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="tb_menu"
    ,catalog="blog"
)

public class Menu  implements java.io.Serializable {


    // Fields    

     private Long pkMenu;
     private String name;
     private Integer code;
     private String addresss;
     private Boolean enable;
     private Set<RoleMenu> roleMenus = new HashSet<RoleMenu>(0);


    // Constructors

    /** default constructor */
    public Menu() {
    }

	/** minimal constructor */
    public Menu(String name, Integer code, String addresss, Boolean enable) {
        this.name = name;
        this.code = code;
        this.addresss = addresss;
        this.enable = enable;
    }
    
    /** full constructor */
    public Menu(String name, Integer code, String addresss, Boolean enable, Set<RoleMenu> roleMenus) {
        this.name = name;
        this.code = code;
        this.addresss = addresss;
        this.enable = enable;
        this.roleMenus = roleMenus;
    }

   
    // Property accessors
    @Id @GeneratedValue
    
    @Column(name="pkMenu", unique=true, nullable=false)

    public Long getPkMenu() {
        return this.pkMenu;
    }
    
    public void setPkMenu(Long pkMenu) {
        this.pkMenu = pkMenu;
    }
    
    @Column(name="name", nullable=false, length=50)

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    @Column(name="code", nullable=false)

    public Integer getCode() {
        return this.code;
    }
    
    public void setCode(Integer code) {
        this.code = code;
    }
    
    @Column(name="addresss", nullable=false, length=50)

    public String getAddresss() {
        return this.addresss;
    }
    
    public void setAddresss(String addresss) {
        this.addresss = addresss;
    }
    
    @Column(name="enable", nullable=false)

    public Boolean getEnable() {
        return this.enable;
    }
    
    public void setEnable(Boolean enable) {
        this.enable = enable;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="menu")

    public Set<RoleMenu> getRoleMenus() {
        return this.roleMenus;
    }
    
    public void setRoleMenus(Set<RoleMenu> roleMenus) {
        this.roleMenus = roleMenus;
    }
   








}