package com.tui.coffeeshop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tui.coffeeshop.model.CartItem;

@Controller
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value = "/add_cart_item", method = RequestMethod.GET)
	public String addCartItem(@ModelAttribute CartItem cartItem, Model model) {
		logger.info("Add cart item");
		
		System.out.println(cartItem);
		
		return "productList";
	}

}
