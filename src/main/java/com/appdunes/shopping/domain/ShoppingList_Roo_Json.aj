// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.appdunes.shopping.domain;

import com.appdunes.shopping.domain.ShoppingList;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ShoppingList_Roo_Json {
    
    public String ShoppingList.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static ShoppingList ShoppingList.fromJsonToShoppingList(String json) {
        return new JSONDeserializer<ShoppingList>().use(null, ShoppingList.class).deserialize(json);
    }
    
    public static String ShoppingList.toJsonArray(Collection<ShoppingList> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<ShoppingList> ShoppingList.fromJsonArrayToShoppingLists(String json) {
        return new JSONDeserializer<List<ShoppingList>>().use(null, ArrayList.class).use("values", ShoppingList.class).deserialize(json);
    }
    
}