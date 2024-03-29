// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.appdunes.shopping;

import com.appdunes.shopping.ShoppingListController;
import com.appdunes.shopping.domain.Item;
import com.appdunes.shopping.domain.ShoppingList;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ShoppingListController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ShoppingListController.create(@Valid ShoppingList shoppingList, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shoppingList);
            return "shoppinglists/create";
        }
        uiModel.asMap().clear();
        shoppingList.persist();
        return "redirect:/shoppinglists/" + encodeUrlPathSegment(shoppingList.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ShoppingListController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ShoppingList());
        return "shoppinglists/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ShoppingListController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("shoppinglist", ShoppingList.findShoppingList(id));
        uiModel.addAttribute("itemId", id);
        return "shoppinglists/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ShoppingListController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("shoppinglists", ShoppingList.findShoppingListEntries(firstResult, sizeNo));
            float nrOfPages = (float) ShoppingList.countShoppingLists() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("shoppinglists", ShoppingList.findAllShoppingLists());
        }
        return "shoppinglists/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ShoppingListController.update(@Valid ShoppingList shoppingList, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shoppingList);
            return "shoppinglists/update";
        }
        uiModel.asMap().clear();
        shoppingList.merge();
        return "redirect:/shoppinglists/" + encodeUrlPathSegment(shoppingList.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ShoppingListController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ShoppingList.findShoppingList(id));
        return "shoppinglists/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ShoppingListController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ShoppingList shoppingList = ShoppingList.findShoppingList(id);
        shoppingList.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/shoppinglists";
    }
    
    void ShoppingListController.populateEditForm(Model uiModel, ShoppingList shoppingList) {
        uiModel.addAttribute("shoppingList", shoppingList);
        uiModel.addAttribute("items", Item.findAllItems());
    }
    
    String ShoppingListController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
