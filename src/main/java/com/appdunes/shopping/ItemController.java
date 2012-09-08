package com.appdunes.shopping;

import com.appdunes.shopping.domain.Item;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Item.class)
@Controller
@RequestMapping("/items")
@RooWebScaffold(path = "items", formBackingObject = Item.class)
public class ItemController {
}
