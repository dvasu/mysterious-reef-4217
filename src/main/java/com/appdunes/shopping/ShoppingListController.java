package com.appdunes.shopping;

import com.appdunes.shopping.domain.ShoppingList;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = ShoppingList.class)
@Controller
@RequestMapping("/shoppinglists")
@RooWebScaffold(path = "shoppinglists", formBackingObject = ShoppingList.class)
public class ShoppingListController {
}
