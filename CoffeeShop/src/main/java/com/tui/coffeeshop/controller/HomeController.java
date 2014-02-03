package com.tui.coffeeshop.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tui.coffeeshop.model.Cart;
import com.tui.coffeeshop.model.ProductBrand;
import com.tui.coffeeshop.service.ProductBrandService;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("cart")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ProductBrandService productBrandService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("Welcome home! The TUI Coffee Shop.");
		
		List<ProductBrand> brandList = productBrandService.getAllProductBrands();
		model.addAttribute("brandList", brandList);
		
		Cart cart = new Cart();
		model.addAttribute("cart", cart);
		
		return "home";
	}
	
}
