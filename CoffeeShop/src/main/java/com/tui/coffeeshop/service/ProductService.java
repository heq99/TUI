package com.tui.coffeeshop.service;

import java.util.List;

import com.tui.coffeeshop.model.Product;

public interface ProductService {
	
	List<Product> getAllProductByBrand(Integer brandId);
	
	Product getProductById(Integer productId);
}
