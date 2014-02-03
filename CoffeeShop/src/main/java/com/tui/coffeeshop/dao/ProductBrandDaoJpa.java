package com.tui.coffeeshop.dao;

import org.springframework.stereotype.Repository;

import com.tui.coffeeshop.model.ProductBrand;

@Repository("productBrandDao")
public class ProductBrandDaoJpa extends GenericDaoJpa<ProductBrand> implements
		ProductBrandDao {
	
	public ProductBrandDaoJpa() {
		super(ProductBrand.class);
	}

}
