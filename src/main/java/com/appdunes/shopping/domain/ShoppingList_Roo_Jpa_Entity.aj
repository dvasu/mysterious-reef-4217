// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.appdunes.shopping.domain;

import com.appdunes.shopping.domain.ShoppingList;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect ShoppingList_Roo_Jpa_Entity {
    
    declare @type: ShoppingList: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ShoppingList.id;
    
    @Version
    @Column(name = "version")
    private Integer ShoppingList.version;
    
    public Long ShoppingList.getId() {
        return this.id;
    }
    
    public void ShoppingList.setId(Long id) {
        this.id = id;
    }
    
    public Integer ShoppingList.getVersion() {
        return this.version;
    }
    
    public void ShoppingList.setVersion(Integer version) {
        this.version = version;
    }
    
}
