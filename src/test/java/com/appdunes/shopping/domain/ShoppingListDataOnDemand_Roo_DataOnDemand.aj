// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.appdunes.shopping.domain;

import com.appdunes.shopping.domain.ShoppingList;
import com.appdunes.shopping.domain.ShoppingListDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ShoppingListDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ShoppingListDataOnDemand: @Component;
    
    private Random ShoppingListDataOnDemand.rnd = new SecureRandom();
    
    private List<ShoppingList> ShoppingListDataOnDemand.data;
    
    public ShoppingList ShoppingListDataOnDemand.getNewTransientShoppingList(int index) {
        ShoppingList obj = new ShoppingList();
        setName(obj, index);
        return obj;
    }
    
    public void ShoppingListDataOnDemand.setName(ShoppingList obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public ShoppingList ShoppingListDataOnDemand.getSpecificShoppingList(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ShoppingList obj = data.get(index);
        Long id = obj.getId();
        return ShoppingList.findShoppingList(id);
    }
    
    public ShoppingList ShoppingListDataOnDemand.getRandomShoppingList() {
        init();
        ShoppingList obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return ShoppingList.findShoppingList(id);
    }
    
    public boolean ShoppingListDataOnDemand.modifyShoppingList(ShoppingList obj) {
        return false;
    }
    
    public void ShoppingListDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ShoppingList.findShoppingListEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ShoppingList' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ShoppingList>();
        for (int i = 0; i < 10; i++) {
            ShoppingList obj = getNewTransientShoppingList(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
