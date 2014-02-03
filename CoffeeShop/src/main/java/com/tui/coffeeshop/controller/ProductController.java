package com.tui.coffeeshop.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tui.coffeeshop.model.Cart;
import com.tui.coffeeshop.model.CartItem;
import com.tui.coffeeshop.model.CartItemValidator;
import com.tui.coffeeshop.model.Product;
import com.tui.coffeeshop.model.ProductAttributeValue;
import com.tui.coffeeshop.model.ProductBrand;
import com.tui.coffeeshop.service.ProductAttributeValueService;
import com.tui.coffeeshop.service.ProductBrandService;
import com.tui.coffeeshop.service.ProductService;

@Controller
@SessionAttributes({"cart", "cartItem"})
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductBrandService productBrandService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductAttributeValueService prodAttrValueService;
		
	@RequestMapping(value = "/brand/{brandId}", method = RequestMethod.GET)
	public String listProducts(@PathVariable Integer brandId, @ModelAttribute Cart cart, Model model) {
		logger.info("List products of brand id = " + brandId);
		
		ProductBrand productBrand = productBrandService.getProductBrandById(brandId);
		model.addAttribute("productBrand", productBrand);
		
		List<Product> productList = productService.getAllProductByBrand(brandId);
		model.addAttribute("productList", productList);
		
		cart.setProductBrand(productBrand);
		if (cart.getCartItems()==null) {
			cart.setCartItems(new ArrayList<CartItem>());
		}
		model.addAttribute("cart", cart);

		model.addAttribute("cartPrice", cartPrice(cart));

		return "productList";
	}
	
	@RequestMapping(value = "/product/{productId}", method = RequestMethod.GET)
	public String displayProductDetails(@PathVariable Integer productId, Model model) {
		logger.info("Display product details of product id = " + productId);
		
		Product product = productService.getProductById(productId);
		model.addAttribute("product", product);
		
		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		cartItem.setQuantity(0);
		cartItem.setAttributes(new ArrayList<ProductAttributeValue>());
		model.addAttribute("cartItem", cartItem);
		
		return "product";
	}
	
	@RequestMapping(value = "/product/update_price", method = RequestMethod.POST)
	public String updatePrice(@ModelAttribute CartItem cartItem, Model model) {
		logger.info("Update product price of product id = " + cartItem.getProduct().getId());

		Integer totalPrice = cartItem.getProduct().getDefaultPrice();
		
		List<ProductAttributeValue> selectedAttrValues = cartItem.getAttributes();
		for (int i=0; i<selectedAttrValues.size(); i++) {
			ProductAttributeValue attrValue = selectedAttrValues.get(i);
			if (attrValue.getId()!=null && attrValue.getId()!=0) {
				attrValue = prodAttrValueService.getProductAttributeValueById(attrValue.getId());
				selectedAttrValues.set(i, attrValue);
				if (attrValue.getPrice()!=null) {
					totalPrice += attrValue.getPrice();
				}
			}
		}
		totalPrice = totalPrice * cartItem.getQuantity();
		cartItem.setPrice(totalPrice);
		
		model.addAttribute("product", cartItem.getProduct());
		model.addAttribute("cartItem", cartItem);
		
		return "product";
	}
	
	@RequestMapping(value = "/product/add_cart_item", method = RequestMethod.POST)
	public String addCartItem(@ModelAttribute Cart cart, @ModelAttribute CartItem cartItem,
			BindingResult bindingResult, Model model) {
		logger.info("Add product to Cart. Produt id = " + cartItem.getProduct().getId());

		CartItemValidator cartItemValidator = new CartItemValidator();
		cartItemValidator.validate(cartItem, bindingResult);
		
		if (bindingResult.hasErrors()) {			
			model.addAttribute("product", cartItem.getProduct());
			model.addAttribute("cartItem", cartItem);
			return "product";
		}
		
		cart.addCartItem(cartItem);
		model.addAttribute("cart", cart);
		
		return "redirect:/brand/" + cart.getProductBrand().getId();
	}
	
	@RequestMapping(value = "/product/delete_cart_item/{index}", method = RequestMethod.GET)
	public String deleteCartItem(@PathVariable Integer index, @ModelAttribute Cart cart, Model model) {
		logger.info("Delete cart item index = " + index);

		cart.getCartItems().remove(index.intValue());
		model.addAttribute("cart", cart);
		
		return "redirect:/brand/" + cart.getProductBrand().getId();
	}
	
	private String cartPrice(Cart cart) {
		Integer totalPrice = 0;
		if (cart.getCartItems()!=null) {
			for (Iterator<CartItem> i = cart.getCartItems().iterator(); i.hasNext(); ) {
				CartItem cartItem = i.next();
				totalPrice += cartItem.getPrice();
			}
		}
		return "&pound;" + totalPrice / 100.0;
	}
}
