package com.tui.coffeeshop.dao;

import java.util.List;

import com.tui.coffeeshop.model.Product;

public interface ProductDao extends GenericDao<Product> {
	
	List<Product> getAllProductByBrand(Integer brandId);

}
