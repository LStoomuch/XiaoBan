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
 * RoleMenu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="tb_role_menu"
    ,catalog="blog"
)

public class RoleMenu  implements java.io.Serializable {


    // Fields    

     private Long pkRoleMenu;
     private Menu menu;
     private Role role;
     private Boolean add;
     private Boolean delete;
     private Boolean query;
     private Boolean update;
     private Timestamp bgnDate;
     private Timestamp endDate;


    // Constructors

    /** default constructor */
    public RoleMenu() {
    }

	/** minimal constructor */
    public RoleMenu(Menu menu, Role role, Boolean add, Boolean delete, Boolean query, Boolean update) {
        this.menu = menu;
        this.role = role;
        this.add = add;
        this.delete = delete;
        this.query = query;
        this.update = update;
    }
    
    /** full constructor */
    public RoleMenu(Menu menu, Role role, Boolean add, Boolean delete, Boolean query, Boolean update, Timestamp bgnDate, Timestamp endDate) {
        this.menu = menu;
        this.role = role;
        this.add = add;
        this.delete = delete;
        this.query = query;
        this.update = update;
        this.bgnDate = bgnDate;
        this.endDate = endDate;
    }

   
    // Property accessors
    @Id @GeneratedValue
    
    @Column(name="pkRoleMenu", unique=true, nullable=false)

    public Long getPkRoleMenu() {
        return this.pkRoleMenu;
    }
    
    public void setPkRoleMenu(Long pkRoleMenu) {
        this.pkRoleMenu = pkRoleMenu;
    }
	@ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="pkMenu", nullable=false)

    public Menu getMenu() {
        return this.menu;
    }
    
    public void setMenu(Menu menu) {
        this.menu = menu;
    }
	@ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="pkRole", nullable=false)

    public Role getRole() {
        return this.role;
    }
    
    public void setRole(Role role) {
        this.role = role;
    }
    
    @Column(name="add", nullable=false)

    public Boolean getAdd() {
        return this.add;
    }
    
    public void setAdd(Boolean add) {
        this.add = add;
    }
    
    @Column(name="delete", nullable=false)

    public Boolean getDelete() {
        return this.delete;
    }
    
    public void setDelete(Boolean delete) {
        this.delete = delete;
    }
    
    @Column(name="query", nullable=false)

    public Boolean getQuery() {
        return this.query;
    }
    
    public void setQuery(Boolean query) {
        this.query = query;
    }
    
    @Column(name="update", nullable=false)

    public Boolean getUpdate() {
        return this.update;
    }
    
    public void setUpdate(Boolean update) {
        this.update = update;
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